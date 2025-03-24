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
        // Database connection details (should be stored in a config file or environment variables)
        String url = "jdbc:mysql://localhost:3306/EloanManagementDB?useSSL=false";
        String dbUser = "root";
        String dbPass = "59908114";
        
        // Retrieve form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Check if username or password is null
        if (username == null || password == null) {
            response.sendRedirect("Login.html"); // Redirect to login page
            return;
        }
        
        Connection connect = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isValidUser = false;
        
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish the database connection
            connect = DriverManager.getConnection(url, dbUser, dbPass);
            
            // SQL query to check username and password
            String query = "SELECT username, pass FROM customers WHERE username = ?";
            pstmt = connect.prepareStatement(query);
            pstmt.setString(1, username); // Set the username parameter
            
            // Execute the query
            rs = pstmt.executeQuery();
            
            // Check if the user exists and the password matches
            if (rs.next()) {
                String dbPassword = rs.getString("pass");
                if (dbPassword.equals(password)) {
                    // Set the username in the session
                    session.setAttribute("username", username);
                    isValidUser = true;
                    
                    // Redirect to the appropriate page based on the username
                    if (username.equals("Admin"))
                    {
                        %><jsp:include page="UserMaster.jsp" /><%
                            
                    } else {
                        
                        %><jsp:include page="CustomerMaster.jsp" /><%
                    }
                }
            }
            
            // If the user is not valid, redirect to the login page
            if (!isValidUser) {
               
                %><jsp:include page="Login.html" /><%
            }
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