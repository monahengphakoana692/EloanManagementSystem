<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rock Loan Ltd - Deposit Confirm</title>
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
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
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
            margin-top: 20px;
        }

        .menu ul {
            list-style-type: none;
            padding: 0;
        }

        .menu ul li {
            margin: 10px 0;
        }

        .menu ul li a {
            text-decoration: none;
            color: #007bff;
        }

        .menu ul li a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>ROCK LOAN LTD</h1>

        <div class="balance">
            <strong>ACCURIT BALANCE</strong><br>
            $0.00 USD
        </div>

        <h2>Deposit Confirm</h2>
        <div class="instructions">
            <p>You have requested <strong>600 USD</strong>. Please pay <strong>60.00 $</strong> for successful payment.</p>
            <p>Please follow the instruction below:</p>
        </div>

        <div class="bank-details">
            <p>Pay the equivalent Loan amount to Our Official United Bank for Africa - UBA Account. Use the details below:</p>
            <p><strong>Account Holder Name:</strong> Desmond Kwame</p>
            <p><strong>Account Number:</strong> 1-34555555555555</p>
            <p>We shall alert you as soon as payment is received.</p>
        </div>

        <div class="pay-now">
            <button>Pay Now</button>
        </div>

        <hr>

        <div class="menu">
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
                <li><a href="#">Change Password</a></li>
                <li><a href="#">Logout</a></li>
            </ul>
        </div>
    </div>
</body>
</html>