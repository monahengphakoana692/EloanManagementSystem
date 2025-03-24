<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Loans</title>
    <style>
        /* General styling */
        #body9 {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container9 {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        #h19 {
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

        .status-pending {
            color: #ff9900;
            font-weight: bold;
        }

        .action-button {
            background-color: #007bff;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .action-button:hover {
            background-color: #0056b3;
        }

        .summary {
            margin-top: 20px;
            font-size: 16px;
            color: #555;
        }
        .action-button select
        {
            border-radius: 0px;
            background-color:#007bff;
            color:white;
        }
        .action-button a
        {
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body id="body1">
    <div class="container9">
        <h1 id="h19">Pending Loans</h1>
        <table>
            <thead>
                <tr>
                    <th>S.Pk</th>
                    <th>Loan No.</th>
                    <th>Plan</th>
                    <th>User</th>
                    <th>Amount</th>
                    <th>Installment Amount</th>
                    <th>Installment</th>
                    <th>Created Next Installment</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>KISHINGHIAOKX Student Loan</td>
                    <td>@Benson</td>
                    <td>$200.00</td>
                    <td>$22.00</td>
                    <td>Total: 2</td>
                    <td>17 May, 2024</td>
                    <td class="status-pending">[Pending]</td>
                    <td><button class="action-button"><a href="#" onclick="callJSPMethods('details')">Details</a></button></td>
                    <td><button class="action-button">
                            <select>
                                <option value="pending">pend</option>
                                <option value="reject">reject</option>
                                <option value="pending">run</option>
                            </select>
                        </button></td>
                </tr>
                <!-- Add more rows as needed -->
            </tbody>
        </table>

        <div class="summary">
            <p><strong>$244.00 Receivable Per 80 days</strong></p>
            <p>Total: 2</p>
            <p>Given: 0</p>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>