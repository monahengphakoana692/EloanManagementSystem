<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="com" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Loan Master | eLoan Management</title>
    
    <!-- Bootstrap for responsive layout -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">


</head>
<body>
    <%
        String user = request.getParameter("username");
        
        if(user!= null && user.equals("Admin"))
        {
                    %>
            
             <jsp:include page="UserMaster.jsp" />
    <%
        }else
        {
            %>
               <jsp:include page="CustomerMaster.jsp" /> 
              
            <%
        }
    %>

</body>
</html>
