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
            String user = "root";
            String pass = "59908114";
            String query = "Select username , pass from customers";
            boolean loginCheck = false;
            
            
            Connection connect = null;
            Statement statement = null;
            
            try{
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Establish the database connection
                connect = DriverManager.getConnection(url, user, pass);
                
                
                statement = connect.createStatement();
                
                ResultSet rs = statement.executeQuery(query);
                
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                
        
                if(user!= null && user.equals("Admin"))
                {
                    while(rs.next())
                    {
                       if(password.equals(rs.getString("pass")))
                       {
                            %>
            
                            <jsp:include page="UserMaster.jsp" /><%
                                loginCheck = true;
                                break;
                        }
                    } 
                
                }else
                {
                    
                    while(rs.next())
                    {
                       if(password.equals(rs.getString("pass")) && username.equals("username"))
                       {
                            %>
                                <jsp:include page="CustomerMaster.jsp" /> 
                               
                            <%
                                 loginCheck = true;
                                break;
                        }
                    }
                        if( loginCheck == false)
                        {%>
                            <jsp:include page="Login.html" /> <%
                        }
                    }
                
            }catch(Exception e)
            {
                
            }
    %>
            
   

</body>
</html>
