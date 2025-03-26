<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password - Standard Bank Loan Ltd</title>
    <style>
        /* General styling */
        #body8 {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container8 {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h14 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .form-group5 {
            margin-bottom: 15px;
        }

        .form-group5 label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group5 input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .submit-button2 {
            text-align: center;
            margin-top: 20px;
        }

        .submit-button2 button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .submit-button2 button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body id="body8">
    <div class="container8">
        <h1 id="h14">Change Password</h1>

        <!-- Change Password Form -->
        <form action="ChangePasswordProcess.jsp" method="POST">
            <div class="form-group5">
                <label for="currentPassword">Current Password *</label>
                <input type="password" id="currentPassword" name="currentPassword" required>
            </div>

            <div class="form-group5">
                <label for="newPassword">New Password *</label>
                <input type="password" id="newPassword" name="newPassword" required>
            </div>

            <div class="form-group5">
                <label for="confirmPassword">Confirm Password *</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>

            <div class="form-group5">
                <input type="hidden" id="username" name="username" value="<%= (String)session.getAttribute("username")%>" required>
            </div>

            <!-- Submit Button -->
            <div class="submit-button2">
                <button type="submit">Submit</button>
            </div>
        </form>
    </div>
</body>
</html>