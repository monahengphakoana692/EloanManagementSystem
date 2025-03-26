<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>

<%
    // Session check
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Plans - Standard Bank Loan Ltd</title>
    <style>
        /* General styling */
        #body1 {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container2 {
            max-width: 1200px;
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

        .loan-plans2 {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .loan-plans2 button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            flex: 1;
            margin: 0 5px;
        }

        .loan-plans2 button:hover {
            background-color: #0056b3;
        }

        .apply-button2 {
            text-align: center;
            margin-top: 20px;
        }

        .apply-button2 button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .apply-button2 button:hover {
            background-color: #0056b3;
        }

        /* EMI Calculator Styles */
        .emi-calculator {
            margin-top: 20px;
            padding: 20px;
            background-color: #f0f8ff;
            border-radius: 8px;
        }

        .emi-input {
            margin-bottom: 15px;
        }

        .emi-input label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .emi-input input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .emi-result {
            margin-top: 15px;
            padding: 15px;
            background-color: #e6f7ff;
            border-radius: 4px;
            font-weight: bold;
            font-size: 18px;
        }
    </style>
</head>
<body id="body1">
     <jsp:useBean id="LoanPlans" class="eloanmanagementdb.LoanPlans" scope="session"/>
      <% LoanPlans.fetchLoanPlanData("Car Loan"); %>
    <div class="container2">
        <h1>Loan Plans</h1>
        <p style="text-align: center; font-size: 16px; margin-bottom: 20px;">Take Control of Your Financial Future with Our Top Loan Recommendations.</p>

        <div class="loan-plans2">
            <button onclick="callJSPMethods('CarLoans')">Car Loan</button>
            <button onclick="callJSPMethods('HouseLoan')">House Loan</button>
            <button onclick="callJSPMethods('QuickLoans')">Quick Loan</button>
            <button onclick="callJSPMethods('BusinessLoans')">Business Loan</button>
            <button onclick="callJSPMethods('StudentLoans')">Student Loan</button>
        </div>

        <div>
            <form>
                <div id="placeHolderLoan">
                    <div class="car-details">
                        <div class="car-info">
                            <h2><jsp:getProperty name="LoanPlans" property="loanType" /></h2>
                            
                            <p>Interest Rate <p class="percentage"><jsp:getProperty name="LoanPlans" property="interestRate" />%</p></p>
                            <p>→ Take Minimum: $<jsp:getProperty name="LoanPlans" property="minAmount" /></p>
                            <p>→ Take Maximum: $<jsp:getProperty name="LoanPlans" property="maxAmount" /></p>
                            <p>→ Per Installment: <jsp:getProperty name="LoanPlans" property="installmentPercent" />%</p>
                            <p>→ Installment Interval: <jsp:getProperty name="LoanPlans" property="installmentInterval" /></p>
                            <p>→ Total Installment: <jsp:getProperty name="LoanPlans" property="totalInstallment" /></p>
                        </div>
                        
                        <div class="emi-calculator">
                            <h3>EMI Calculator</h3>
                            <div class="emi-input">
                                <label for="LoanAmount">Loan Amount ($):</label>
                                <input type="number" id="LoanAmount" name="LoanAmount" 
                                       min="<jsp:getProperty name='LoanPlans' property='minAmount' />" 
                                       max="<jsp:getProperty name='LoanPlans' property='maxAmount' />" 
                                       placeholder="Enter loan amount" required>
                            </div>
                            <div class="emi-result" id="Emis">
                                Your EMI will be displayed here
                            </div>
                        </div>
                    </div>
                </div>
                <div class="apply-button2">
                    <button type="button" onclick="calculateEMI()">Calculate EMI</button>
                </div>
            </form>    
         </div>
    </div>
                        
    <script>
    function calculateEMI() 
{
    let loanAmount = parseFloat(document.getElementById("LoanAmount").value);

    // Get interest rate and total installments dynamically
    let interestRate = parseInt(<jsp:getProperty name="LoanPlans" property="interestRate" />);
    let totalInstallments = parseInt(<jsp:getProperty name="LoanPlans" property="totalInstallment" />);

    // Validate input
    if (isNaN(loanAmount)) {
        document.getElementById("Emis").innerHTML = "Please enter a valid loan amount";
        return;
    }
    
    if (loanAmount < 1000) {
        document.getElementById("Emis").innerHTML = "Minimum loan amount is $1,000";
        return;
    }

    // Convert annual interest rate to monthly
    let monthlyInterestRate = (interestRate / 100) / 12;

    // EMI Calculation
    let emi = loanAmount * monthlyInterestRate * 
              Math.pow(1 + monthlyInterestRate, totalInstallments) /
              (Math.pow(1 + monthlyInterestRate, totalInstallments) - 1);

    // Format and display result
    let formattedAmount = new Intl.NumberFormat('en-US', { 
        style: 'currency', currency: 'USD' 
    }).format(emi.toFixed(2));

    document.getElementById("Emis").innerHTML = 
        `Your Monthly EMI: <strong>${formattedAmount}</strong> for ${totalInstallments} months`;
}

// Add event listener for real-time calculation
document.getElementById("LoanAmount").addEventListener("input", function() {
    let amount = parseFloat(this.value) || 0;
    if (amount >= 1000) {  
        calculateEMI();
    } else if (this.value === "") {
        document.getElementById("Emis").innerHTML = "Your EMI will be displayed here";
    } else {
        document.getElementById("Emis").innerHTML = "Minimum loan amount is $1,000";
    }
});


    // Add event listener for real-time calculation
    document.getElementById("LoanAmount").addEventListener("input", function() {
        let amount = parseFloat(this.value) || 0;
        if (amount >= 1000) {  // Only calculate if amount is ≥ 1000
            calculateEMI();
        } else if (this.value === "") {
            document.getElementById("Emis").innerHTML = "Your EMI willlll be displayed here";
        } else {
            document.getElementById("Emis").innerHTML = "Minimum loan amount is $1,000";
        }
    });
    
    
</script>

</body>
</html>