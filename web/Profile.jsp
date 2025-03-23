<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Setting - Standard Bank Loan Ltd</title>
    <style>
        /* General styling */
        #body7 {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container7 {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        #h13 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .profile-info {
            margin-bottom: 20px;
        }

        .profile-info p {
            margin: 5px 0;
            font-size: 14px;
        }

        .profile-info .label {
            font-weight: bold;
            color: #007bff;
        }

        .profile-picture {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-picture img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #007bff;
        }

        .form-group4 {
            margin-bottom: 15px;
        }

        .form-group4 label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group4 input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .form-group4 input[type="file"] {
            padding: 5px;
        }

        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body id="body7">
    <div class="container7">
        <h1>Profile Setting</h1>


        <!-- Form for Profile Details -->
        <form>
            <jsp:useBean id="customers" class="eloanmanagementdb.Customers" scope="session"/>
            <% customers.fetchCustomerData((String)session.getAttribute("username")); %>
            <jsp:useBean id="loans" class="eloanmanagementdb.Loans" scope="session"/>
        <% loans.fetchLoanData((String)session.getAttribute("username")); %>

            <div class="form-group4">
                <label for="username">Username</label>
                <input type="text" id="username" value="<jsp:getProperty name="customers" property="username" />" readonly>
            </div>

            <div class="form-group4">
                <label for="district">District</label>
                <input type="text" id="district" value="<jsp:getProperty name="customers" property="district" />" readonly>
            </div>

            <div class="form-group4">
                <label for="street">Street</label>
                <input type="text" id="street" value="<jsp:getProperty name="customers" property="street" />" readonly>
            </div>

            <div class="form-group4">
                <label for="dob">Date of Birth</label>
                <input type="text" id="dob" value="<jsp:getProperty name="customers" property="DOB" />" readonly>
            </div>

            <div class="form-group4">
                <label for="accountNumber">Account Number</label>
                <input type="text" id="accountNumber" value="<jsp:getProperty name="customers" property="accNum" />" readonly>
            </div>
            <div class="form-group4">
                <label for="accountNumber">Loan Account Number</label>
                <input type="text" id="accountNumber" value="<jsp:getProperty name="loans" property="loanNum" />" readonly>
            </div>

            <div class="form-group4">
                <label for="nid">National ID</label>
                <input type="text" id="nid" value="<jsp:getProperty name="customers" property="NID" />" readonly>
            </div>
            <div class="form-group4">
                <label for="nid">Phone number</label>
                <input type="text" id="nid" value="<jsp:getProperty name="customers" property="p_num" />" readonly>
            </div>

            <!-- Display error message if any -->
            <div class="error-message">
                <%= customers.getExceptionMessage() %>
            </div>
        </form>
    </div>

    <script>
        // JavaScript to handle profile picture upload
        document.getElementById('profilePictureUpload').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader(); 
                reader.onload = function(e) {
                    document.getElementById('profileImage').src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>