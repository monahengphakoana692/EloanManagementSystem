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

       
    </style>
</head>
<body id="body7">
    <div class="container7">
        <h1>Profile Setting</h1>

        <!-- Profile Information -->
        <div class="profile-info">
            <p><span class="label">A. benson</span></p>
            <p>moziness494@gmail.com</p>
            <p>23323456767676</p>
            <p><span class="label">B. Ghana</span></p>
        </div>

        <!-- Profile Picture -->
        <div class="profile-picture">
            <img src="placeholder.jpg" alt="Profile Picture" id="profileImage">
            <input type="file" id="profilePictureUpload" accept="image/*" style="display: none;">
            <button onclick="document.getElementById('profilePictureUpload').click()">Change Profile Picture</button>
        </div>

        <!-- Form for Profile Details -->
        <form>
            <div class="form-group4">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" value="Edward" readonly>
            </div>

            <div class="form-group4">
                <label for="state">State</label>
                <input type="text" id="state" value="Accra" readonly>
            </div>

            <div class="form-group4">
                <label for="city">City</label>
                <input type="text" id="city" value="Tema" readonly>
            </div>

            <div class="form-group4">
                <label for="address">Address</label>
                <input type="text" id="address" value="Tema" readonly>
            </div>

            <div class="form-group4">
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" value="Koprmorne" readonly>
            </div>

            <div class="form-group4">
                <label for="zipCode">Zip Code</label>
                <input type="text" id="zipCode" value="00233" readonly>
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