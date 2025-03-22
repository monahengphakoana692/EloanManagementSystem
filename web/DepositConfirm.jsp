<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Confirm - Standard Bank Loan Ltd</title>
    <style>
        /* General styling */
      

        .container {
            max-width: 600px;
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

        .instructions {
            margin-bottom: 20px;
        }

        .instructions p {
            margin: 10px 0;
            font-size: 16px;
            line-height: 1.6;
        }

        .instructions strong {
            color: #007bff;
        }

        .bank-details {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .bank-details p {
            margin: 5px 0;
            font-size: 14px;
        }

        .bank-details a {
            color: #007bff;
            text-decoration: none;
        }

        .bank-details a:hover {
            text-decoration: underline;
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
    </style>
</head>
<body>
    <div class="container">
        <h1>Deposit Confirm</h1>

        <div class="instructions">
            <p>You have requested <strong>60.00 USD</strong>. Please pay <strong>60.00 $</strong> for successful payment.</p>
            <p>Please follow the instruction below:</p>
        </div>

        <div class="bank-details">
            <p>Pay the equivalent Loan amount to Our Official United Bank for Africa - UBA Account. Use the details below:</p>
            <p><strong>Account Holder Name:</strong> <a href="https://www.desmond-kwame.com">Desmond Kwame</a></p>
            <p><strong>Account Number:</strong> 12 536353535353535</p>
            <p>We shall alert you as soon as payment is received.</p>
        </div>

        <div class="pay-now">
            <button>Pay Now</button>
        </div>
    </div>
</body>
</html>