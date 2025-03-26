<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
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

        .loan-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .loan-details .loan-info2 {
            flex: 1;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            margin: 0 10px;
        }

        .loan-details .loan-info2 h2 {
            color: #007bff;
            margin-bottom: 10px;
        }

        .loan-details .loan-info2 p {
            margin: 5px 0;
            font-size: 14px;
        }

        .loan-details .loan-info2 .percentage {
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
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

        #placeHolderLoan {
            overflow: auto;
            padding: 20px;
            height: 400px;
            width: 560px;
            margin-left: 20px;
            background-color: #effbfd;
            align-content: center;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        button a
        {
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body id="body1">
     <jsp:useBean id="LoanPlans" class="eloanmanagementdb.LoanPlans" scope="session"/>
      <% LoanPlans.fetchLoanPlanData("Student Loan"); %>
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
                            <p>→ Total Installment:<jsp:getProperty name="LoanPlans" property="totalInstallment" /></p>
                        </div>

                    </div>

                </div>
                <div class="apply-button2">
                    <button>Apply Now</button>
                </div>
            </form>    
         </div>
            
        </div>
            
        </div>

       
    <script src="script.js"></script>
   
</body>
</html>