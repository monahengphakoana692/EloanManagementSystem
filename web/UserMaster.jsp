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
            width: 260px;
            background-color: white;
            height: 990px;
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
        #formHolder
        {
            overflow: auto;
            padding:200px;
            height:800px;
            width: 1080px;
            margin-left:20px;
            background-color:#effbfd;
            align-content:center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div id="lang">
            <select id="Language" name="langs" required>
                <option value="English">English</option>
                <option value="Sesotho">Sesotho</option>
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
                    
                    switch (pageNames)
                    {
                        case "dashboard":
                            %><jsp:include page="dashboard.jsp" /><%
                            break;
                        case "takeLoan":
                            %><jsp:include page="takeLoan.jsp" /><%
                            break;
                        case "myLoans":
                            %><jsp:include page="myLoans.jsp" /><%
                            break;
                        case "deposit":
                            %><jsp:include page="DepositMethod.jsp" /><%
                            break;
                        case "withdraw":
                            %><jsp:include page="withdraw.jsp" /><%
                            break;
                        case "transactions":
                            %><jsp:include page="transactions.jsp" /><%
                            break;
                        case "supportTicket":
                            %><jsp:include page="Tickets.jsp" /><%
                            break;
                        case "2faSetting":
                            %><jsp:include page="2faSetting.jsp" /><%
                            break;
                        case "profile":
                            %><jsp:include page="profile.jsp" /><%
                            break;
                        case "changePassword":
                            %><jsp:include page="changePassword.jsp" /><%
                            break;
                        case "logout":
                            %><jsp:include page="logout.jsp" /><%
                            break;
                        default:
                            %><p>Please select a page from the menu.</p><%
                            break;
                    }
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
                <li><a href="#" onclick="callJSPMethods('dashboard')">Dashboard</a></li>
                <li><a href="#" onclick="callJSPMethods('manageUsers')">Manage Users</a></li>
                <li><a href="#" onclick="callJSPMethods('categories')">Categories</a></li>
                <li><a href="#" onclick="callJSPMethods('loanPlans')">Loan Plans</a></li>
                <li><a href="#" onclick="callJSPMethods('loans')">Loans</a></li>
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
            
    <script>
   function callJSPMethods(pageName) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", pageName+".jsp?page=" + pageName, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            document.getElementById("placeholderMasters").innerHTML = xhr.responseText;
        }
    };
    xhr.send();
}
    </script>
</body>
</html>