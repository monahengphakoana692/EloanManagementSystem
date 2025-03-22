<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Standard Bank Loan Ltd - Deposit Confirm</title>
    <style>
        /* General styling */
        #body90 {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container90 {
            max-width: 2000px;
            margin: 0 auto;
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        #h190 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }

        #h290 {
            color: #007bff;
            margin-bottom: 10px;
        }

        .balance90 {
            text-align: center;
            font-size: 18px;
            margin-bottom: 20px;
        }

        .instructions90 {
            margin-bottom: 20px;
        }

        .instructions90 p {
            margin: 10px 0;
        }

        .bank-details90 {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .bank-details90 p {
            margin: 5px 0;
        }

        .pay-now90 {
            text-align: center;
            margin-bottom: 20px;
        }

        .pay-now90 button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .pay-now90 button:hover {
            background-color: #0056b3;
        }

        .menu90 {
            margin-top: -980px;
            width: 190px;
            background-color: white;
            height: 880px;
            padding: 50px;
            text-autospace: auto;
        }

        .menu90 ul {
            list-style-type: none;
            padding: 0;
        }

        .menu90 ul li {
            margin: 10px 0;
            margin-bottom: 35px;
        }

        .menu90 ul li a {
            text-decoration: none;
            color: #007bff;
        }

        .menu90 ul li a:hover {
            text-decoration: none;
            color: black;
        }

        #h190 {
            margin-left: -40px;
            font-size: 20px;
        }

        #lang90 {
            background-color: white;
            width: 1180px;
            height: 60px;
            margin-left: 260px;
        }

        #Language90 {
            margin-left: 1100px;
            width: 80px;
            height: 40px;
            margin-top: 10px;
            background-color: white;
            border-radius: 30px;
            text-align: center;
        }

        #dep {
            background-color: greenyellow;
            color: black;
            margin-left: -40px;
        }
        #dep a
        {
            text-decoration: none;
            color: black;
        }

        #with {
            background-color: black;
            color: white;
            margin-left: 30px;
        }

        #dep,
        #with {
            width: 80px;
            height: 40px;
            border-radius: 20px;
        }

        #dep:hover,
        #with:hover {
            height: 46px;
            cursor: pointer;
        }

        #placeholderMasters90 {
            width: 1120px;
            height: 900px;
            background-color: white;
            margin-left: 300px;
            margin-top: 20px;
            overflow: auto; /* Add scroll if content overflows */
            align-content: center;
        }
        #formHolder90
        {
            overflow: auto;
            padding:200px;
            height:400px;
            width:680px;
            margin-left:20px;
            background-color:#effbfd;
            align-content:center;
        }
    </style>
</head>
<body id="body90">
    <div class="container90">
        <div id="lang90">
            <select id="Language90" name="langs" required>
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
        <div id="placeholderMasters90">
            <form id="formHolder90">
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
        <div class="menu90">
            <h1 id="h190">Standard Bank Loan</h1>
            <h2 id="h290">Balance : $0</h2><br>
            <button id="dep" ><a href="#" onclick="callJSPMethods('DepositMethod')">Deposit</a></button>
            <button id="with" >Withdraw</button>
            <br><br><br>
           <ul>
              
                <li><a href="#" onclick="callJSPMethods('dashboard')">Dashboard</a></li>
                <li><a href="#" onclick="callJSPMethods('TakeLoans')">Take Loan</a></li>
                <li><a href="#" onclick="callJSPMethods('Myloans')">My Loans</a></li>
                <li><a href="#" onclick="callJSPMethods('DepositMethod')">Deposit</a></li>
                <li><a href="#" onclick="callJSPMethods('Withdraw')">Withdraw</a></li>
                <li><a href="#" onclick="callJSPMethods('Transactions')">Transactions</a></li>
                <li><a href="#" onclick="callJSPMethods('Tickets')">Support Ticket</a></li>
                <li><a href="#" onclick="callJSPMethods('2FASetting')">2FA Setting</a></li>
                <li><a href="#" onclick="callJSPMethods('Profile')">Profile</a></li>
                <li><a href="#" onclick="callJSPMethods('ChangePassoword')">Change Password</a></li><br><!-- comment -->
                <br><br>
                <li><a href="#" onclick="callJSPMethods('Logout')">Logout</a></li>

            </ul>
        </div>
    </div>
            
    <script>
   function callJSPMethods(pageName) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", pageName+".jsp?page=" + pageName, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            document.getElementById("placeholderMasters90").innerHTML = xhr.responseText;
        }
    };
    xhr.send();
}
    </script>
</body>
</html>