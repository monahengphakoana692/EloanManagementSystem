<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Support Tickets - Standard Bank Loan Ltd</title>
    <style>
        /* General styling */
        #body6{
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container6 {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        #h12 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
            font-size: 24px;
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
            color: #555;
        }

        .open-ticket-button {
            text-align: center;
            margin-bottom: 20px;
        }

        .open-ticket-button button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .open-ticket-button button:hover {
            background-color: #0056b3;
        }

        .no-data {
            text-align: center;
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
        }
    </style>
</head>
<body id="body6">
    <div class="container6">
        <h1 id="h12">Support Tickets</h1>

        <!-- Table for Support Tickets -->
        <table>
            <thead>
                <tr>
                    <th>Subject</th>
                    <th>Status</th>
                    <th>Priority</th>
                    <th>Last Reply</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- Empty row for "Data not found" -->
                <tr>
                    <td colspan="5" class="no-data">Data not found</td>
                </tr>
            </tbody>
        </table>

        <!-- Open Support Ticket Button -->
        <div class="open-ticket-button">
            <button>+ Open Support Ticket</button>
        </div>
    </div>
</body>
</html>