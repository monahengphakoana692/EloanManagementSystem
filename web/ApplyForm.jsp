<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Apply for a Loan | eLoan Management</title>
    
    <style>
        /* Bank standard colors */
        #bodyy {
            background-color: #f5f7fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .containerr {
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
        
        .form-label1 {
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
        
        .btn-primary1 {
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
        
        .btn-primary1:hover {
            background-color: #003366;
        }
        
        /* Input placeholder styling */
        ::placeholder {
            color: #aaa;
            opacity: 1;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .containerr {
                width: 90%;
                padding: 20px;
            }
        }
        
        /* Animation for form elements */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .mb-3, div[style*="margin-bottom"] {
            animation: fadeIn 0.5s ease forwards;
        }
        
        /* Delay animations for each form element */
        .mb-3:nth-child(1) { animation-delay: 0.1s; }
        .mb-3:nth-child(2) { animation-delay: 0.2s; }
        .mb-3:nth-child(3) { animation-delay: 0.3s; }
        .mb-3:nth-child(4) { animation-delay: 0.4s; }
        .mb-3:nth-child(5) { animation-delay: 0.5s; }
        div[style*="margin-bottom"]:last-child { animation-delay: 0.6s; }
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
<body id="bodyy">

<div class="containerr">
    <h2 class="text-center text-primary">Apply for a Loan</h2>
    <form action="processLoan.jsp" method="post" onsubmit="return validateForm();">
        
        <div class="mb-3">
            <label class="form-label1">Full Name</label>
            <input type="text" id="name" name="name" class="form-control" placeholder="Enter your full name"required>
        </div>

        <div class="mb-3">
            <label class="form-label1">Email Address</label>
            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
        </div>

        <div class="mb-3">
            <label class="form-label1">Phone Number</label>
            <input type="text" id="phone" name="phone" class="form-control" placeholder="Enter your phone number" required>
        </div>

        <div class="mb-3">
            <label class="form-label1">Loan Type</label>
            <select id="loanType" name="loanType" class="form-select" required>
                <option value="select">-- Select Loan Type --</option>
                <option value="home">House Loan</option>
                <option value="personal">Quick Loan</option>
                <option value="car">Car Loan</option>
                <option value="business">Business Loan</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label1">Loan Amount (Min: 1,000 - Max: 5,000,000)</label>
            <input type="number" id="amount" name="amount" class="form-control" placeholder="Enter loan amount"required>
        </div>

        <div>
            <button type="submit" class="btn btn-primary1">Apply Now</button>
        </div>

    </form>
</div>

</body>
</html>