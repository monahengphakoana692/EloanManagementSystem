
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checking details</title>
    </head>
    <body>
        <%
            
            {//preparing connection
                
            String url = "jdbc:mysql://localhost:3306/monaheng?useSSL=false&allowPublicKeyRetrieval=true";
            String user = "root";
            String DBpassword ="59908114";
            String sqlquery = "SELECT* from users";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = DriverManager.getConnection(url,user,DBpassword);
            
            Statement statement = connect.createStatement();
            statement.execute(sqlquery);
            
            }
        %>
      <%
          
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            
            if(username.equals("Monaheng") && password.equals("Phakoana"))
            {
                out.println("hello there i am in ");
            }
      %>
    </body>
</html>
