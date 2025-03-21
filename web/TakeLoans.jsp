<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Plans - Standard Bank Loan Ltd</title>
    <style>
        /* General styling */
        #body1 {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container2 {
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

        .loan-plans2 {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .loan-plans2 button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            flex: 1;
            margin: 0 5px;
        }

        .loan-plans2 button:hover {
            background-color: #0056b3;
        }

        .loan-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .loan-details .loan-info2 {
            flex: 1;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            margin: 0 10px;
        }

        .loan-details .loan-info2 h2 {
            color: #007bff;
            margin-bottom: 10px;
        }

        .loan-details .loan-info2 p {
            margin: 5px 0;
            font-size: 14px;
        }

        .loan-details .loan-info2 .percentage {
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
        }

        .apply-button2 {
            text-align: center;
            margin-top: 20px;
        }

        .apply-button2 button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .apply-button2 button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body id="body1">
    <div class="container2">
        <h1>Loan Plans</h1>
        <p style="text-align: center; font-size: 16px; margin-bottom: 20px;">Take Control of Your Financial Future with Our Top Loan Recommendations.</p>

        <div class="loan-plans2">
            <button>Car Loan</button>
            <button>House Loan</button>
            <button>Quick Loan</button>
            <button>Business Loan</button>
            <button>Student Loan</button>
        </div>

        <div class="loan-details">
            <div class="loan-info">
                <h2>Car Loan</h2>
                <p class="percentage">52%</p>
                <p>Interest Rate</p>
                <p>→ Take Minimum: $1,000,000.00</p>
                <p>→ Take Maximum: $1,000,000,000.00</p>
                <p>→ Per Installment: 38%</p>
                <p>→ Installment Interval: 365 Days</p>
                <p>→ Total Installment: 4</p>
            </div>
            <div class="loan-info2">
                <h2>House Loan</h2>
                <p class="percentage">45%</p>
                <p>Interest Rate</p>
                <p>→ Take Minimum: $500,000.00</p>
                <p>→ Take Maximum: $500,000,000.00</p>
                <p>→ Per Installment: 30%</p>
                <p>→ Installment Interval: 365 Days</p>
                <p>→ Total Installment: 5</p>
            </div>
        </div>

        <div class="apply-button2">
            <button>Apply Now</button>
        </div>
    </div>
</body>
</html>