<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        /* General Reset */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        /* Dashboard Container */
        .dashboard-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
            margin-top: -400px;
        }

        /* Card Styles */
        .card {
            background-color: #f4f4f4;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            position: relative;
        }

        .card h3 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }

        .card p {
            margin: 10px 0 0;
            font-size: 24px;
            font-weight: bold;
            color: #555;
        }

        .card img {
            width: 50px;
            height: 50px;
            position: absolute;
            top: 20px;
            right: 20px;
        }

        /* Specific Card Styles */
        .card-total-users {
            background-color: greenyellow;
        }

        .card-active-users {
            background-color: black;
            color: white;
        }

        .card-active-users h3,
        .card-active-users p {
            color: white;
        }

        .card-email-unverified {
            background-color: #ffcc00;
        }

        .card-running-loan {
            background-color: #ff6666;
        }

        .card-total-deposits {
            background-color: #66cc66;
        }

        .card-total-withdrawn {
            background-color: #6699cc;
        }

        .card-pending-deposits {
            background-color: #cc99ff;
        }

        .card-pending-withdrawals {
            background-color: #ff9966;
        }

        .card-rejected-deposits {
            background-color: #ff6666;
        }

        .card-rejected-withdrawals {
            background-color: #ffcc99;
        }

        .card-withdrawal-charge {
            background-color: #99ccff;
        }

        .card-payloads {
            background-color: #cccccc;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Total Users Card -->
        <div class="card card-total-users">
            <h3>Total Users</h3>
            <p>3</p>
            <img src="usersIcons.png" alt="Users Icon">
        </div>

        <!-- Active Users Card -->
        <div class="card card-active-users">
            <h3>Active Users</h3>
            <p>8</p>
            <img src="activeuserIcon.png" alt="Active Users Icon">
        </div>

        <!-- Email Unverified Users Card -->
        <div class="card card-email-unverified">
            <h3>Email Unverified Users</h3>
            <p>5</p>
            <img src="emailUicon.png" alt="Email Unverified Icon">
        </div>

        <!-- Running Loan Card -->
        <div class="card card-running-loan">
            <h3>Running Loan</h3>
            <p>$10,000</p>
            <img src="runloanicon.jpeg" alt="Running Loan Icon">
        </div>

        <!-- Total Deposits Card -->
        <div class="card card-total-deposits">
            <h3>Total Deposits</h3>
            <p>$50,000</p>
            <img src="runloanicon.jpeg" alt="Total Deposits Icon">
        </div>

        <!-- Total Withdrawn Card -->
        <div class="card card-total-withdrawn">
            <h3>Total Withdrawn</h3>
            <p>$20,000</p>
            <img src="runloanicon.jpeg" alt="Total Withdrawn Icon">
        </div>

        <!-- Pending Deposits Card -->
        <div class="card card-pending-deposits">
            <h3>Pending Deposits</h3>
            <p>$0.00</p>
            <img src="runloanicon.jpeg" alt="Pending Deposits Icon">
        </div>

        <!-- Pending Withdrawals Card -->
        <div class="card card-pending-withdrawals">
            <h3>Pending Withdrawals</h3>
            <p>$0.00</p>
            <img src="runloanicon.jpeg"" alt="Pending Withdrawals Icon">
        </div>

        <!-- Rejected Deposits Card -->
        <div class="card card-rejected-deposits">
            <h3>Rejected Deposits</h3>
            <p>$0.00</p>
            <img src="runloanicon.jpeg" alt="Rejected Deposits Icon">
        </div>

        <!-- Rejected Withdrawals Card -->
        <div class="card card-rejected-withdrawals">
            <h3>Rejected Withdrawals</h3>
            <p>$0.00</p>
            <img src="runloanicon.jpeg" alt="Rejected Withdrawals Icon">
        </div>

        <!-- Withdrawal Charge Card -->
        <div class="card card-withdrawal-charge">
            <h3>Withdrawal Charge</h3>
            <p>$0.00</p>
            <img src="runloanicon.jpeg" alt="Withdrawal Charge Icon">
        </div>

        <!-- Payloads Card -->
        <div class="card card-payloads">
            <h3>Payloads</h3>
            <p>$0.00</p>
            <img src="runloanicon.jpeg" alt="Payloads Icon">
        </div>
    </div>
</body>
</html>