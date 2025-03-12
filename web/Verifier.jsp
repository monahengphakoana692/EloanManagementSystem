<%-- 
    Document   : Verifier
    Created on : Mar 7, 2025, 9:00:30 PM
    Author     : Retshepile Sehloho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checking details</title>
    </head>
    <body>
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
