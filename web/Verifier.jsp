<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Loan Master | eLoan Management</title>
</head>
<body>
    <%
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/EloanManagementDB?useSSL=false";
        String dbUser = "root";
        String dbPass = "59908114";
        
        // Retrieve form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Connection connect = null;
        Statement pstmt = null;
        ResultSet rs = null;
        boolean passchecker = false;
        
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish the database connection
            connect = DriverManager.getConnection(url, dbUser, dbPass);
            
            // SQL query to check username and password
            String query = "SELECT username, pass FROM customers";
            pstmt = connect.createStatement();
           
            
            
            rs = pstmt.executeQuery(query);
            
            while(rs.next()) 
            {
                
                
                if (username.equals("Admin") )
                {
                     String logPass = rs.getString("pass");
                     if(logPass.equals(password))
                     {
                         %>
                            <jsp:include page="UserMaster.jsp" />
                         <%
                           session.setAttribute("username",username);
                           passchecker = true;  
                          break;   
                     }
                    
                } else
                {
                    
                     String userName = rs.getString("username");
                     String logPass = rs.getString("pass");
                     
                     if(logPass.equals(password) && userName.equals(username))
                     {
                         %>
                            <jsp:include page="CustomerMaster.jsp" />
                        <%
                            session.setAttribute("username",username);
                             passchecker = true;
                          break;    
                     }
                  
                    
                }
            }
                if(passchecker == false)
                {%>
                    <jsp:include page="Login.html" />
                <%}
            
        } catch (Exception e) {
            // Log or display the exception
            out.println("An error occurred: " + e.getMessage());
        } finally {
            // Close resources
            if (rs != null) {
                try { rs.close(); } catch (SQLException e) { /* Ignored */ }
            }
            if (pstmt != null) {
                try { pstmt.close(); } catch (SQLException e) { /* Ignored */ }
            }
            if (connect != null) {
                try { connect.close(); } catch (SQLException e) { /* Ignored */ }
            }
        }
    %>
</body>
</html>