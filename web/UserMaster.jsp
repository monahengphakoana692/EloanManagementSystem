<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Standard Bank Loan Ltd - Deposit Confirm</title>
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 2000px;
            margin: 0 auto;
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }

        h2 {
            color: #007bff;
            margin-bottom: 10px;
        }

        .balance {
            text-align: center;
            font-size: 18px;
            margin-bottom: 20px;
        }

        .instructions {
            margin-bottom: 20px;
        }

        .instructions p {
            margin: 10px 0;
        }

        .pay-now button:hover {
            background-color: #0056b3;
        }

        .menu {
            margin-top: -980px;
            width: 160px;
            background-color: white;
            height: 880px;
            padding: 50px;
            text-autospace: auto;
        }

        .menu ul {
            list-style-type: none;
            padding: 0;
        }

        .menu ul li {
            margin: 10px 0;
            margin-bottom: 27px;
        }

        .menu ul li a {
            text-decoration: none;
            color: #007bff;
        }

        .menu ul li a:hover {
            text-decoration: none;
            color: black;
        }

        h1 {
            margin-left: -40px;
            font-size: 20px;
        }

        #lang {
            background-color: white;
            width: 1180px;
            height: 60px;
            margin-left: 260px;
        }

        #Language {
            margin-left: 1100px;
            width: 80px;
            height: 40px;
            margin-top: 10px;
            background-color: white;
            border-radius: 30px;
            text-align: center;
        }

        #placeholderMasters {
            width: 1120px;
            height: 900px;
            background-color: white;
            margin-left: 300px;
            margin-top: 20px;
            overflow: auto; /* Add scroll if content overflows */
            align-content: center;
        }

        #formHolder {
            overflow: auto;
            padding: 200px;
            height: 400px;
            width: 680px;
            margin-left: 20px;
            background-color: #effbfd;
            align-content: center;
        }

        /* Styling for the loans dropdown */
        .menu ul li select {
            width: 100%;
            padding: 8px;
            border: 1px solid #007bff;
            border-radius: 4px;
            background-color: white;
            color: #007bff;
            font-size: 14px;
            cursor: pointer;
        }

        .menu ul li select:hover {
            border-color: #0056b3;
        }

        .menu ul li select option {
            padding: 8px;
            background-color: white;
            color: #333;
        }

        .menu ul li select option:hover {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div id="lang">
            <select id="Language" name="langs" required>
                <option value="English">Admin</option>
                <!-- Add more languages as needed -->
            </select>
        </div>
        <%!
            String pageNames;
            public String callJSPMethod(String pageName)
                {
                    this.pageNames = pageName;
                    
                    return (String)pageName;
                }
        %>

        <!-- Placeholder for including another page -->
        <div id="placeholderMasters">
            <form id="formHolder">
                <div>
                <% 
                if (pageNames != null)
                {
                    
                } else
                {
                    %><p>Welcome! Please select a page from the menu.</p><%
                }
            %>
                </div>
            </form>
        </div>

        <!-- Menu Section -->
        <div class="menu">
            <h1>Standard Bank Loan</h1>
            <ul>
                <li><a href="#" onclick="callJSPMethods('dashboardAd')">Dashboard</a></li>
                <li><a href="#" onclick="callJSPMethods('manageUsers')">Manage Users</a></li>
                <li><a href="#" onclick="callJSPMethods('categories')">Categories</a></li>
                <li><a href="#" onclick="callJSPMethods('loanPlans')">Loan Plans</a></li>
                <li>
                    <select onchange="callJSPMethods(this.value)">
                        <option value="">Loans</option>
                        <option value="pendingloans">Pending Loans</option>
                        <option value="runningLoans">Running Loans</option>
                        <option value="allLoans">All Loans</option>
                        <option value="dueLoans">Due Loans</option>
                        <option value="paidLoans">Paid Loans</option>
                        <option value="rejectedLoans">Rejected Loans</option>
                    </select>
                </li>
                <li><a href="#" onclick="callJSPMethods('paymentGateways')">Payment Gateways</a></li>
                <li><a href="#" onclick="callJSPMethods('deposits')">Deposits</a></li>
                <li><a href="#" onclick="callJSPMethods('withdrawals')">Withdrawals</a></li>
                <li><a href="#" onclick="callJSPMethods('supportTickets')">Support Tickets</a></li>
                <li><a href="#" onclick="callJSPMethods('reports')">Reports</a></li>
                <li><a href="#" onclick="callJSPMethods('subscribers')">Subscribers</a></li>
                <li><a href="#" onclick="callJSPMethods('generalSettings')">General Settings</a></li>
                <li><a href="#" onclick="callJSPMethods('chatJobSettings')">Chat Job Settings</a></li>
                <li><a href="#" onclick="callJSPMethods('systemConfiguration')">System Configuration</a></li>
                <li><a href="#" onclick="callJSPMethods('logoAndFavicon')">Logo & Favicon</a></li>
                <li><a href="#" onclick="callJSPMethods('socialCredentials')">Social Credentials</a></li>
                <li><a href="#" onclick="callJSPMethods('logout')">Logout</a></li>
            </ul>
        </div>
    </div>

                <script src="script.js"></script>
</body>
</html>