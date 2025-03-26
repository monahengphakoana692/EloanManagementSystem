<%@page import="eloanmanagementdb.Calculator"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Initialize variables
    String errorMessage = null;
    Double emi = null;
    Double loanAmount = null;
    Integer tenure = null;
    String loanType = null;
    Double interestRate = null;
    
    // Create decimal formatter
    DecimalFormat df = new DecimalFormat("#,##0.00");
    
    // Validate and process input
    if (request.getParameter("loanType") != null && 
        request.getParameter("loanAmount") != null && 
        request.getParameter("tenure") != null) {
        
        try {
            // Parse and validate inputs
            loanType = request.getParameter("loanType").trim();
            loanAmount = Double.parseDouble(request.getParameter("loanAmount").trim());
            tenure = Integer.parseInt(request.getParameter("tenure").trim());
            
            // Validate positive values
            if (loanAmount <= 0 || tenure <= 0) {
                errorMessage = "Loan amount and tenure must be positive values";
            } else {
                // Calculate EMI
                Calculator calculator = new Calculator();
                calculator.setLoanType(loanType);
                calculator.setLoanAmount(loanAmount);
                calculator.setTenure(tenure);
                
                emi = calculator.calculateEMI();
                interestRate = calculator.getInterestRate();
                
                // Validate calculation result
                if (emi == null || emi <= 0) {
                    errorMessage = "Invalid calculation result. Please check your inputs.";
                }
            }
        } catch (NumberFormatException e) {
            errorMessage = "Please enter valid numbers for loan amount and tenure";
        } catch (Exception e) {
            errorMessage = "An error occurred during calculation: " + e.getMessage();
        }
    } else {
        errorMessage = "Please fill out all fields in the calculator form";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= errorMessage == null ? "EMI Calculation Results" : "Calculation Error" %></title>
    <style>
        .calculator-container {
            max-width: 500px;
            margin: 20px auto;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .calculator-header {
            text-align: center;
            margin-bottom: 25px;
            color: #2c3e50;
        }
        
        .calculator-result {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 6px;
            margin-top: 20px;
        }
        
        .result-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        
        .result-label {
            font-weight: bold;
            color: #2c3e50;
        }
        
        .result-value {
            color: #2980b9;
        }
        
        .total-emi {
            font-size: 1.3rem;
            color: #27ae60;
            text-align: center;
            margin-top: 15px;
            padding-top: 15px;
            border-top: 2px solid #eee;
        }
        
        .btn-back {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #2c3e50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
        }
        
        .btn-back:hover {
            background-color: #34495e;
        }
        
        .error-message {
            color: #e74c3c;
            text-align: center;
            padding: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="calculator-container">
        <div class="calculator-header">
            <h2><%= errorMessage == null ? "EMI Calculation Results" : "Calculation Error" %></h2>
        </div>
        
        <% if (errorMessage == null) { %>
            <div class="calculator-result">
                <div class="result-item">
                    <span class="result-label">Loan Type:</span>
                    <span class="result-value"><%= loanType.replace("_", " ") %></span>
                </div>
                
                <div class="result-item">
                    <span class="result-label">Loan Amount:</span>
                    <span class="result-value">R <%= df.format(loanAmount) %></span>
                </div>
                
                <div class="result-item">
                    <span class="result-label">Loan Tenure:</span>
                    <span class="result-value"><%= tenure %> months</span>
                </div>
                
                <div class="result-item">
                    <span class="result-label">Interest Rate:</span>
                    <span class="result-value"><%= interestRate %>%</span>
                </div>
                
                <div class="total-emi">
                    Monthly EMI: R <%= df.format(emi) %>
                </div>
            </div>
        <% } else { %>
            <div class="calculator-result">
                <div class="error-message">
                    <%= errorMessage %>
                </div>
            </div>
        <% } %>
        
        <button class="btn-back" onclick="window.history.back()">Back to Calculator</button>
    </div>
        
</body>
</html>