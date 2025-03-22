<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Standard Bank Loan Ltd - Deposit Confirm</title>
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 2000px;
            margin: 0 auto;
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }

        h2 {
            color: #007bff;
            margin-bottom: 10px;
        }

        .balance {
            text-align: center;
            font-size: 18px;
            margin-bottom: 20px;
        }

        .instructions {
            margin-bottom: 20px;
        }

        .instructions p {
            margin: 10px 0;
        }

        .bank-details {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .bank-details p {
            margin: 5px 0;
        }

        .pay-now {
            text-align: center;
            margin-bottom: 20px;
        }

        .pay-now button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .pay-now button:hover {
            background-color: #0056b3;
        }

        .menu {
            margin-top: -980px;
            width: 160px;
            background-color: white;
            height: 910px;
            padding: 50px;
            text-autospace: auto;
        }

        .menu ul {
            list-style-type: none;
            padding: 0;
        }

        .menu ul li {
            margin: 10px 0;
            margin-bottom: 35px;
        }

        .menu ul li a {
            text-decoration: none;
            color: #007bff;
        }

        .menu ul li a:hover {
            text-decoration: none;
            color: black;
        }

        h1 {
            margin-left: -40px;
            font-size: 20px;
        }

        #lang {
            background-color: white;
            width: 1180px;
            height: 60px;
            margin-left: 260px;
        }

        #Language {
            margin-left: 1100px;
            width: 80px;
            height: 40px;
            margin-top: 10px;
            background-color: white;
            border-radius: 30px;
            text-align: center;
        }

        #dep {
            background-color: greenyellow;
            color: black;
            margin-left: -40px;
        }

        #with {
            background-color: black;
            color: white;
            margin-left: 30px;
        }

        #dep,
        #with {
            width: 80px;
            height: 40px;
            border-radius: 20px;
        }

        #dep:hover,
        #with:hover {
            height: 46px;
            cursor: pointer;
        }

        #placeholderMasters {
            width: 1120px;
            height: 900px;
            background-color: white;
            margin-left: 300px;
            margin-top: 20px;
            overflow: auto; /* Add scroll if content overflows */
            align-content: center;
        }
        #formHolder
        {
            overflow: auto;
            padding:200px;
            height:400px;
            width: 680px;
            margin-left:20px;
            background-color:#effbfd;
            align-content:start;
        }
    </style>
</head>
<body>
    <div class="container">
        <div id="lang">
            <select id="Language" name="langs" required>
                <option value="English">English</option>
                <option value="Sesotho">Sesotho</option>
                <!-- Add more languages as needed -->
            </select>
        </div>

        <!-- Placeholder for including another page -->
        <div id="placeholderMasters">
            <form id="formHolder">
                <jsp:include page="AnotherPage.jsp"/>
            </form>
            
        </div>

        <!-- Menu Section -->
        <div class="menu">
            <h1>Standard Bank Loan</h1>
            <h2>Balance : $0</h2><br>
            <button id="dep">Deposit</button>
            <button id="with">Withdraw</button>
            <br><br><br>
            <ul>
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Take Loan</a></li>
                <li><a href="#">My Loans</a></li>
                <li><a href="#">Deposit</a></li>
                <li><a href="#">Withdraw</a></li>
                <li><a href="#">Transactions</a></li>
                <li><a href="#">Support Ticket</a></li>
                <li><a href="#">2FA Setting</a></li>
                <li><a href="#">Profile</a></li>
                <li><a href="#">Change Password</a></li><br><br><br><br><br><br><br><br>
                <li><a href="#">Logout</a></li>
            </ul>
        </div>
    </div>
</body>
</html>