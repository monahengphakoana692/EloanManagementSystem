<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transactions - Standard Bank Loan Ltd</title>
    <style>
        /* General styling */
        #body5 {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container5 {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        @h11 {
            text-align: center;
            color: #007bff;
            margin-bottom: 10px;
            font-size: 24px;
        }

        .subheading {
            text-align: center;
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
        }

        .filter-section {
            margin-bottom: 20px;
        }

        .filter-section label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        .filter-section input,
        .filter-section select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .transaction-details {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .transaction-details h2 {
            color: #007bff;
            margin-bottom: 10px;
            font-size: 18px;
        }

        .transaction-details .row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .transaction-details .row p {
            margin: 0;
            font-size: 14px;
            color: #555;
        }

        .transaction-details .row .label {
            font-weight: bold;
            color: #333;
        }

        .transaction-details .row .value {
            color: #007bff;
        }

        .transaction-details .row .amount {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .transaction-details .row .balance {
            font-size: 16px;
            color: #333;
        }
    </style>
</head>
<body id="body5">
    <div class="container5">
        <h1 id="h11">Transactions</h1>
        <p class="subheading">My Transactions History</p>

        <!-- Filter Section -->
        <div class="filter-section">
            <label for="transactionNumber">Transaction Number</label>
            <input type="text" id="transactionNumber" placeholder="Transaction Number">

            <label for="type">Type</label>
            <select id="type">
                <option value="all">All</option>
                <option value="deposit">Deposit</option>
                <option value="withdraw">Withdraw</option>
            </select>

            <label for="remark">Remark</label>
            <input type="text" id="remark" placeholder="Any">
        </div>

        <!-- Transaction Details -->
        <div class="transaction-details">
            <h2>Application fee</h2>
            <div class="row">
                <p class="label">Date</p>
                <p class="value">May 17 2024 @4:19:am</p>
            </div>
            <div class="row">
                <p class="label">Transaction Number</p>
                <p class="value">#KISNNXH1ACKX</p>
            </div>
            <div class="row">
                <p class="label">Amount</p>
                <p class="amount">0.00 USD</p>
            </div>
            <div class="row">
                <p class="label">Balance</p>
                <p class="balance">0.00 USD</p>
            </div>
        </div>
    </div>
</body>
</html>