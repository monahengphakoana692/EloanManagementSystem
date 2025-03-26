<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Loans - Standard Bank Loan Ltd</title>
    <style>
        /* General styling */
        #body4 {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container4 {
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
        }

        table th {
            background-color: #f9f9f9;
            font-weight: bold;
            color: #007bff;
        }

        table td {
            font-size: 14px;
        }

        .status {
            font-weight: bold;
            color: #ff5722; /* Orange color for status */
        }

        .amount-due {
            color: #ff5722; /* Orange color for amount due */
        }
    </style>
</head>
<body id="body4">
    <div class="container4">
        <h1>My Loans</h1>
        <jsp:useBean id="loans" class="eloanmanagementdb.Loans" scope="application"/>
        <%  loans.fetchLoanData((String)session.getAttribute("username"));%>
        <!-- Loan Details Table -->
        <table>
            <thead>
                <tr>
                    <th>Loan Type</th>
                    <th>Date</th>
                    <th>Loan Number</th>
                    <th>Status</th>
                    <th>Loan Amount</th>
                    <th>Amount Due</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><jsp:getProperty name="loans" property="loantype"/></td>
                    <td> <jsp:getProperty name="loans" property="date"/></td>
                    <td><jsp:getProperty name="loans" property="loanNum"/></td>
                    <td class="status"><jsp:getProperty name="loans" property="status"/></td>
                    <td><jsp:getProperty name="loans" property="loanAmount"/></td>
                    <td class="amount-due">$<jsp:getProperty name="loans" property="dueAmount"/>(Need to pay)</td>
                </tr>
                <!-- Add more rows as needed -->
            </tbody>
        </table>
    </div>
</body>
</html>