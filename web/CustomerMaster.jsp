<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Standard Bank Loan Ltd - Dashboard</title>
    <style>
        /* General styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        /* Menu Section */
        .menu {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding: 20px 0;
            height: 100vh;
            position: fixed;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }

        .menu-header {
            padding: 0 20px 20px;
            border-bottom: 1px solid #34495e;
        }

        .menu h1 {
            font-size: 1.5rem;
            margin: 0 0 10px;
            color: #ecf0f1;
        }

        .balance {
            font-size: 1.2rem;
            color: #2ecc71;
            margin: 10px 0;
        }

        .action-buttons {
            display: flex;
            justify-content: space-between;
            padding: 15px 20px;
        }

        .btn {
            padding: 8px 15px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s;
        }

        .btn-deposit {
            background-color: #2ecc71;
            color: white;
        }

        .btn-withdraw {
            background-color: #e74c3c;
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .menu-list {
            list-style-type: none;
            padding: 0;
            margin: 20px 0;
        }

        .menu-list li {
            padding: 12px 20px;
            border-bottom: 1px solid #34495e;
            transition: background-color 0.3s;
        }

        .menu-list li a {
            color: #ecf0f1;
            text-decoration: none;
            display: block;
        }

        .menu-list li:hover {
            background-color: #34495e;
        }

        /* Main Content Area */
        .main-content {
            margin-left: 250px;
            flex: 1;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding: 10px 20px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .language-selector {
            padding: 8px 12px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .content-area {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 30px;
            min-height: 80vh;
        }

        .welcome-message {
            text-align: center;
            font-size: 1.5rem;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            
            .menu {
                width: 100%;
                height: auto;
                position: relative;
            }
            
            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
     <jsp:useBean id="Transactions" class="eloanmanagementdb.Transactions" scope="session"/>
    <% 
        String username = (String) session.getAttribute("username");
        if (username != null) {
           Transactions.fetchTransactionData(username);
        } else {
            response.sendRedirect("Login.html");
        }
    %>
    <div class="container">
        <!-- Menu Section -->
        <div class="menu">
            <div class="menu-header">
                <h1>Standard Bank Loan</h1>
                <div class="balance">
                    Balance: $<jsp:getProperty name="Transactions" property="balance" />
                </div>
            </div>
            
            <div class="action-buttons">
                <button class="btn btn-deposit" onclick="callJSPMethods('DespositMethod')">Deposit</button>
                <button class="btn btn-withdraw" onclick="callJSPMethods('WithDrawMethod')">Withdraw</button>
            </div>
            
            <ul class="menu-list">
                <li><a href="#" onclick="callJSPMethods('dashboard')">Dashboard</a></li>
                <li><a href="#" onclick="callJSPMethods('TakeLoans')">Take Loan</a></li>
                <li><a href="#" onclick="callJSPMethods('Myloans')">My Loans</a></li>
                <li><a href="#" onclick="callJSPMethods('Transactions')">Transactions</a></li>
                <li><a href="#" onclick="callJSPMethods('Tickets')">Support Ticket</a></li>
                <li><a href="#" onclick="callJSPMethods('ApplyForm')">Apply Form</a></li>
                <li><a href="#" onclick="callJSPMethods('Profile')">Profile</a></li>
                <li><a href="#" onclick="callJSPMethods('ChangePassoword')">Change Password</a></li>
                <li><a href="#" onclick="callJSPMethods('Logout')">Logout</a></li>
            </ul>
        </div>

        <!-- Main Content Area -->
        <div class="main-content">
            <div class="header">
                <select id="Language" class="language-selector">
                    <option value="English">English</option>
                    <option value="Sesotho">Sesotho</option>
                </select>
            </div>
            
            <div class="content-area">
                <div class="welcome-message">
                    <p>Welcome to Standard Bank Loans</p>
                </div>
                
                <!-- Dynamic content will be loaded here -->
                <div id="dynamic-content"></div>
            </div>
        </div>
    </div>
    
   
    
    <script>
        function callJSPMethods(pageName) {
            // Validate pageName to prevent XSS
            const validPages = ['dashboard', 'TakeLoans', 'Myloans', 'DespositMethod', 
                              'WithDrawMethod', 'Transactions', 'Tickets', 'ApplyForm', 
                              'Profile', 'ChangePassoword', 'Logout'];
            
            if (!validPages.includes(pageName)) {
                console.error('Invalid page request');
                return;
            }

            // For logout, redirect immediately
            if (pageName === 'Logout') {
                window.location.href = 'Logout.jsp';
                return;
            }

            fetch(pageName + '.jsp')
                .then(response => {
                    if (!response.ok) throw new Error('Network response was not ok');
                    return response.text();
                })
                .then(data => {
                    document.getElementById('dynamic-content').innerHTML = data;
                })
                .catch(error => {
                    console.error('Error:', error);
                    document.getElementById('dynamic-content').innerHTML = 
                        '<div class="error-message">Error loading content. Please try again.</div>';
                });
        }

        // Load dashboard by default
        document.addEventListener('DOMContentLoaded', function() {
            callJSPMethods('dashboard');
        });
    </script>
</body>
</html>