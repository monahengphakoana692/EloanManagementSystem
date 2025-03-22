<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Standard Bank Loan Ltd</title>
    <style>
        /* General styling */
        #body3 {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container3 {
            max-width: 1200px;
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

        .section {
            margin-bottom: 30px;
        }

        .section h2 {
            color: #007bff;
            margin-bottom: 10px;
        }

        .section .balance {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .section .status {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .section .status div {
            flex: 1;
            text-align: center;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 8px;
            margin: 0 5px;
        }

        .section .status div p {
            margin: 5px 0;
            font-size: 14px;
        }

        .section .status div .amount {
            font-size: 18px;
            font-weight: bold;
            color: #007bff;
        }

        .section .request-info {
            font-size: 14px;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        table th {
            background-color: #f9f9f9;
            font-weight: bold;
        }
    </style>
</head>
<body id="body3">
    <div class="container3">
        <h1>Dashboard</h1>

        <!-- Successful Deposits Section -->
        <div class="section">
            <h2>Successful Deposits</h2>
            <div class="balance">0.00 USD</div>
            <div class="status">
                <div>
                    <p>Submitted</p>
                    <p class="amount">$0.00</p>
                </div>
                <div>
                    <p>Pending</p>
                    <p class="amount">$0.00</p>
                </div>
                <div>
                    <p>Rejected</p>
                    <p class="amount">$0.00</p>
                </div>
            </div>
            <div class="request-info">
                <p>You've requested to deposit $180.00. Where $180.00 is just initiated but not submitted.</p>
            </div>
        </div>

        <!-- My Running Loans Section -->
        <div class="section">
            <h2>My Running Loans</h2>
            <table>
                <thead>
                    <tr>
                        <th>Loan Number</th>
                        <th>Plan Name</th>
                        <th>Loan Amount</th>
                        <th>Installment</th>
                        <th>Installment Amount</th>
                        <th>Next Installment</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>001</td>
                        <td>Car Loan</td>
                        <td>$10,000.00</td>
                        <td>4/12</td>
                        <td>$833.33</td>
                        <td>2023-11-01</td>
                    </tr>
                    <!-- Add more rows as needed -->
                </tbody>
            </table>
        </div>

        <!-- Successful Withdrawals Section -->
        <div class="section">
            <h2>Successful Withdrawals</h2>
            <div class="balance">0.00 USD</div>
            <div class="status">
                <div>
                    <p>Submitted</p>
                    <p class="amount">$0.00</p>
                </div>
                <div>
                    <p>Pending</p>
                    <p class="amount">$0.00</p>
                </div>
                <div>
                    <p>Rejected</p>
                    <p class="amount">$0.00</p>
                </div>
            </div>
            <div class="request-info">
                <p>You've requested to withdraw $0.00. Where $0.00 is just initiated but not submitted.</p>
            </div>
        </div>

        <!-- Total Loan Section -->
        <div class="section">
            <h2>Total Loan</h2>
            <div class="balance">0.00 USD</div>
            <div class="status">
                <div>
                    <p>Pending</p>
                    <p class="amount">$0.00</p>
                </div>
                <div>
                    <p>Running</p>
                    <p class="amount">$0.00</p>
                </div>
                <div>
                    <p>Completed</p>
                    <p class="amount">$0.00</p>
                </div>
                <div>
                    <p>Rejected</p>
                    <p class="amount">$0.00</p>
                </div>
            </div>
            <div class="request-info">
                <p>You've 0 Loans. Which is 0 Running & 0 is Pending & 0 is Rejected & 0 is Completed.</p>
            </div>
        </div>
    </div>
</body>
</html>