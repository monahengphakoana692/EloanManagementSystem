<%-- 
    Document   : AnotherPage
    Created on : Mar 22, 2025, 8:47:52 AM
    Author     : Retshepile Sehloho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
                body{
            
        }
            login-container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }
        .login-container h2 {
            color: #004a99;
            margin-bottom: 20px;
        }
        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .input-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .remember-me {
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 14px;
        }
        .login-btn {
            width: 100%;
            background-color: #004a99;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        .login-btn:hover {
            background-color: #003366;
        }
        .forgot-password {
            display: block;
            margin-top: 10px;
            font-size: 14px;
            color: #004a99;
            text-decoration: none;
        }
        .forgot-password:hover {
            text-decoration: underline;
        }
        </style>
    </head>
    <body>
         <div class="login-container">
        <h2>Standard Bank Login     </a></h2>
        
        <form action="CustomerMaster.jsp" method="GET">
            <div class="input-group">
                <label for="username">Username or Email</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="remember-me">
                <label><input type="checkbox" name="remember"> Remember Me</label>
                <a href="#" class="forgot-password">Forgot Password?</a>
            </div>
            <button type="submit" class="login-btn">Login</button>
        </form>
    </div>
    </body>
</html>
