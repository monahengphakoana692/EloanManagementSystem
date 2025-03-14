<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Apply for a Loan | eLoan Management</title>
    
    <!-- Bootstrap for responsive layout -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    
    <style>
        /* Bank standard colors */
        body {
            background-color: #f5f7fa;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 600px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }
        .form-label {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #004080;
            border: none;
        }
        .btn-primary:hover {
            background-color: #002d5a;
        }
    </style>

    <script>
        function validateForm() 
        {
            let name = document.getElementById("name").value;
            let email = document.getElementById("email").value;
            let phone = document.getElementById("phone").value;
            let amount = document.getElementById("amount").value;
            let loanType = document.getElementById("loanType").value;
            let errorMessage = "";

            if (name.trim() === "") {
                errorMessage += "Name cannot be empty.\n";
            }
            if (!/^[a-zA-Z\s]+$/.test(name)) {
                errorMessage += "Name must contain only letters.\n";
            }
            if (email.trim() === "" || !/^\S+@\S+\.\S+$/.test(email)) {
                errorMessage += "Enter a valid email address.\n";
            }
            if (!/^\d{10}$/.test(phone)) {
                errorMessage += "Phone number must be 10 digits.\n";
            }
            if (loanType === "select") {
                errorMessage += "Please select a loan type.\n";
            }
            if (amount.trim() === "" || isNaN(amount) || amount <= 0) {
                errorMessage += "Enter a valid loan amount.\n";
            }
            if (amount < 1000 || amount > 5000000) {
                errorMessage += "Loan amount must be between 1,000 and 5,000,000.\n";
            }

            if (errorMessage !== "") {
                alert(errorMessage);
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<div class="container">
    <h2 class="text-center text-primary">Apply for a Loan</h2>
    <form action="processLoan.jsp" method="post" onsubmit="return validateForm();">
        
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" id="name" name="name" class="form-control" placeholder="Enter your full name">
        </div>

        <div class="mb-3">
            <label class="form-label">Email Address</label>
            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email">
        </div>

        <div class="mb-3">
            <label class="form-label">Phone Number</label>
            <input type="text" id="phone" name="phone" class="form-control" placeholder="Enter your phone number">
        </div>

        <div class="mb-3">
            <label class="form-label">Loan Type</label>
            <select id="loanType" name="loanType" class="form-select">
                <option value="select">-- Select Loan Type --</option>
                <option value="home">Home Loan</option>
                <option value="personal">Personal Loan</option>
                <option value="education">Education Loan</option>
                <option value="car">Car Loan</option>
                <option value="business">Business Loan</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Loan Amount (Min: 1,000 - Max: 5,000,000)</label>
            <input type="number" id="amount" name="amount" class="form-control" placeholder="Enter loan amount">
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary">Apply Now</button>
        </div>

    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
