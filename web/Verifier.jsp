
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
        <%!
            String name = "";
            String surname = "";
        %>
        <%
            
            
            {//preparing connection
                
            String url = "jdbc:mysql://localhost:3306/monaheng?useSSL=false&allowPublicKeyRetrieval=true";
            String user = "root";
            String DBpassword ="59908114";
            String sqlquery = "SELECT* from users";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = DriverManager.getConnection(url,user,DBpassword);
            
            Statement statement = connect.createStatement();
            ResultSet res = statement.executeQuery(sqlquery);
            while(res.next())
            {
                name = res.getString("name");
                surname = res.getString("password");
            }
            
            }
        %>
      <%
          
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String authory = "";
            
            if(username.equals(name) && password.equals(surname))
            {
                for(int i =0; i < username.length();i++)
                {
                    char chara = username.charAt((username.length()-1)-i);
                    
                    if(chara == 'd')
                    {
                      authory = authory + chara;
                    }
                    else if(chara == 't')
                    {
                        authory = authory + chara;
                        
                    }else if(chara == 's')
                    {
                        authory = authory + chara;
                    }
                }
                
                if(authory.equals("dts"))
                {
                    response.sendRedirect("worker.png");
                }else
                {
                    response.sendRedirect("worker.png");
                }
                
            }else
            {
               response.sendRedirect("Login.html");
            }
            
           
      %>
    </body>
</html>
