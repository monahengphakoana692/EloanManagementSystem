<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Details</title>
    <style>
        /* General styling */
        #body100 {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container100 {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .container100 h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .status-favoring {
            color: #28a745;
            font-weight: bold;
        }

        .action-buttons {
            margin-top: 20px;
            text-align: center;
        }

        .action-buttons button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin: 0 10px;
        }

        .action-buttons button:hover {
            background-color: #0056b3;
        }

        .action-buttons button.reject {
            background-color: #dc3545;
        }

        .action-buttons button.reject:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body id="body100">
    <div class="container100">
        <h1>Loan Details</h1>
        <table>
            <tbody>
                <tr>
                    <th>Plan</th>
                    <td>Student Loan</td>
                </tr>
                <tr>
                    <th>Date of Application</th>
                    <td>17 May, 2024, 04:19 AM</td>
                </tr>
                <tr>
                    <th>Loan Number</th>
                    <td>KISN0001A/CXX</td>
                </tr>
                <tr>
                    <th>Amount</th>
                    <td><strong>200.00 USD</strong></td>
                </tr>
                <tr>
                    <th>Per Installment</th>
                    <td>122.00 USD</td>
                </tr>
                <tr>
                    <th>Total Installment</th>
                    <td>2</td>
                </tr>
                <tr>
                    <th>Given Installment</th>
                    <td>0</td>
                </tr>
                <tr>
                    <th>Total Payable</th>
                    <td>244.00 USD</td>
                </tr>
                <tr>
                    <th>Profit</th>
                    <td><strong>44.00 USD</strong></td>
                </tr>
                <tr>
                    <th>Status</th>
                    <td class="status-favoring"><strong>Favoring</strong></td>
                </tr>
            </tbody>
        </table>

        <div class="action-buttons">
            <button onclick="applyLoan()">Apply App</button>
            <button class="reject" onclick="rejectLoan()">Reject</button>
        </div>
    </div>

    <script>
        function applyLoan() {
            alert("Loan application approved!");
            // Add logic to handle loan approval
        }

        function rejectLoan() {
            alert("Loan application rejected!");
            // Add logic to handle loan rejection
        }
    </script>
</body>
</html>