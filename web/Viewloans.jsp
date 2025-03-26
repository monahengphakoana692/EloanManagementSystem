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
            max-width: 999px;
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
        <h1>Loans</h1>
        <jsp:useBean id="loans" class="eloanmanagementdb.Loans" scope="application"/>
        <%  loans.fetchLoanData();%>
        <!-- Loan Details Table -->
        <table>
            <thead>
                <tr>
                   
                    <th>username</th>
                    <th>Loan Type</th>
                    <th>Date</th>
                    <th>Loan Number</th>
                    <th>Status</th>
                    <th>Loan Amount</th>
                    <th>Amount Due</th>
                    <th>amountPaid</th>
                    <th>fullNames</th>
                    <th>email </th>
                </tr>
            </thead>
            <%
                int i = 0;
                while(i<loans.getSize())
                {
            %>
            <tbody>
                <tr>
                    <td><%= loans.getUsername(i)%></td>
                    <td><%= loans.getLoantype(i)%></td>
                    <td> <%= loans.getDate(i)%></td>
                    <td><%= loans.getLoanNum(i)%></td>
                    <td class="status"><%= loans.getStatus(i)%></td>
                    <td><%= loans.getLoanAmount(i)%></td>
                    <td class="amount-due">M<%= loans.getDueAmount(i)%>(Need to pay)</td>
                     <td><%= loans.getAmountPaid(i)%></td>
                    <td> <%= loans.getFullname(i)%></td>
                    <td><%= loans.getEmail(i)%></td>
                </tr>
                <!-- Add more rows as needed -->
            </tbody>
            <%
                i++;
                }%>
        </table>
    </div>
</body>
</html>