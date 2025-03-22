<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="dashboard-container">
        <div class="card total-users">
            <h3>Total Users</h3>
            <p><%= request.getAttribute("totalUsers") %></p>
        </div>
        <div class="card active-users">
            <h3>Active Users</h3>
            <p><%= request.getAttribute("activeUsers") %></p>
        </div>
        <div class="card email-unverified">
            <h3>Email Unverified Users</h3>
            <p><%= request.getAttribute("emailUnverified") %></p>
        </div>
        <div class="card running-loan">
            <h3>Running Loan</h3>
            <p><%= request.getAttribute("runningLoan") %></p>
        </div>
        <div class="card total-deposits">
            <h3>Total Deposits</h3>
            <p>$<%= request.getAttribute("totalDeposits") %></p>
        </div>
        <div class="card total-withdrawn">
            <h3>Total Withdrawn</h3>
            <p>$<%= request.getAttribute("totalWithdrawn") %></p>
        </div>
    </div>
</body>
</html>
