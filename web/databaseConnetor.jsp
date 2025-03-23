<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/EloanManagementDB?useSSL=false";
            String user = "root";
            String pass = "59908114";
            
            
            Connection connect = null;
            PreparedStatement pstmt = null;
            Statement statement = null;
            
            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Establish the database connection
                connect = DriverManager.getConnection(url, user, pass);
                
           }catch(Exception e)
           {
                out.println("error connect :" + e.toString());
            }%> 
    </body>
</html>
