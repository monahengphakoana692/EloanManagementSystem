<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Apply for a Loan | eLoan Management</title>
    
    <style>
        /* Bank standard colors */
        #body1 {
            background-color: #f5f7fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .container1 {
            width: 600px;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            margin: 20px;
        }
        
        h2.text-center {
            color: #004080;
            text-align: center;
            margin-bottom: 25px;
            font-size: 28px;
            font-weight: 600;
        }
        
        .form-label {
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
            display: block;
            font-size: 14px;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }
        
        .form-control:focus {
            border-color: #004080;
            box-shadow: 0 0 0 3px rgba(0, 64, 128, 0.1);
            outline: none;
        }
        
        .form-select {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            color: #333;
            background-color: white;
            cursor: pointer;
        }
        
        .form-select:focus {
            border-color: #004080;
            box-shadow: 0 0 0 3px rgba(0, 64, 128, 0.1);
            outline: none;
        }
        
        .btn-primary {
            background-color: #004080;
            color: white;
            border: none;
            padding: 14px 20px;
            width: 100%;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .btn-primary:hover {
            background-color: #003366;
        }
        
        .error-message {
            color: #dc3545;
            font-size: 14px;
            margin-top: -15px;
            margin-bottom: 15px;
            display: none;
        }
        
        /* Input placeholder styling */
        ::placeholder {
            color: #aaa;
            opacity: 1;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
            }
        }
        
        /* Animation for form elements */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .form-group {
            animation: fadeIn 0.5s ease forwards;
        }
        
        /* Delay animations for each form element */
        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }
        .form-group:nth-child(4) { animation-delay: 0.4s; }
        .form-group:nth-child(5) { animation-delay: 0.5s; }
        .form-group:last-child { animation-delay: 0.6s; }
    </style>
</head>
<body id="body1">
<%
    // Check if user is logged in
    String username = (String)session.getAttribute("username");
    if(username == null) {
        response.sendRedirect("Login.jsp?error=" + URLEncoder.encode("Please login to apply for a loan", "UTF-8"));
        return;
    }
%>

<div class="container1">
    <h2 class="text-center">Apply for a Loan</h2>
    <form id="loanForm" action="processLoan.jsp" method="post" onsubmit="return validateForm()">
        
        <div class="form-group">
            <label class="form-label">Full Name</label>
            <input type="text" id="name" name="name" class="form-control" placeholder="Enter your full name" required>
            <div id="nameError" class="error-message"></div>
        </div>

        <div class="form-group">
            <label class="form-label">Email Address</label>
            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
            <div id="emailError" class="error-message"></div>
        </div>

        <div class="form-group">
            <label class="form-label">Phone Number</label>
            <input type="text" id="phone" name="phone" class="form-control" placeholder="Enter your phone number" required>
            <div id="phoneError" class="error-message"></div>
        </div>

        <div class="form-group">
            <label class="form-label">Loan Type</label>
            <select id="loanType" name="loanType" class="form-select" required>
                <option value="">-- Select Loan Type --</option>
                <option value="home">House Loan</option>
                <option value="personal">Quick Loan</option>
                <option value="car">Car Loan</option>
                <option value="business">Business Loan</option>
            </select>
            <div id="loanTypeError" class="error-message"></div>
        </div>

        <div class="form-group">
            <label class="form-label">Loan Amount (Min: 1,000 - Max: 5,000,000)</label>
            <input type="number" id="amount" name="amount" class="form-control" 
                   placeholder="Enter loan amount" min="1000" max="5000000" required>
            <div id="amountError" class="error-message"></div>
            <input type="hidden" name="username" value="<%= username %>">
        </div>

        <div class="form-group">
            <button type="submit" class="btn-primary">Apply Now</button>
        </div>
    </form>
</div>

<script>
    // Improved client-side validation with inline error messages
    function validateForm() {
        let isValid = true;
        
        // Reset error messages
        document.querySelectorAll('.error-message').forEach(el => {
            el.style.display = 'none';
            el.textContent = '';
        });
        
        // Validate name
        const name = document.getElementById("name").value.trim();
        if (name === "") {
            showError("nameError", "Name cannot be empty");
            isValid = false;
        } else if (!/^[a-zA-Z\s]+$/.test(name)) {
            showError("nameError", "Name must contain only letters");
            isValid = false;
        }
        
        // Validate email
        const email = document.getElementById("email").value.trim();
        if (email === "" || !/^\S+@\S+\.\S+$/.test(email)) {
            showError("emailError", "Enter a valid email address");
            isValid = false;
        }
        
        // Validate phone
        const phone = document.getElementById("phone").value.trim();
        if (!/^\d{10}$/.test(phone)) {
            showError("phoneError", "Phone number must be 10 digits");
            isValid = false;
        }
        
        // Validate loan type
        const loanType = document.getElementById("loanType").value;
        if (loanType === "") {
            showError("loanTypeError", "Please select a loan type");
            isValid = false;
        }
        
        // Validate amount
        const amount = document.getElementById("amount").value.trim();
        if (amount === "" || isNaN(amount) || amount <= 0) {
            showError("amountError", "Enter a valid loan amount");
            isValid = false;
        } else if (amount < 1000 || amount > 5000000) {
            showError("amountError", "Loan amount must be between 1,000 and 5,000,000");
            isValid = false;
        }
        
        return isValid;
    }
    
    function showError(elementId, message) {
        const errorElement = document.getElementById(elementId);
        errorElement.textContent = message;
        errorElement.style.display = 'block';
    }
    
    // Add real-time validation for better UX
    document.getElementById('loanForm').addEventListener('input', function(e) {
        const target = e.target;
        if (target.id === 'name') {
            if (!/^[a-zA-Z\s]*$/.test(target.value)) {
                showError("nameError", "Name must contain only letters");
            } else {
                document.getElementById("nameError").style.display = 'none';
            }
        }
        if (target.id === 'phone') {
            if (!/^\d*$/.test(target.value)) {
                showError("phoneError", "Phone number must contain only digits");
            } else {
                document.getElementById("phoneError").style.display = 'none';
            }
        }
    });
</script>
</body>
</html>