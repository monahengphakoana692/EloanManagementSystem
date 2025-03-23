<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Your Data</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                padding: 20px;
            }
            .confirmation-form {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 500px;
                margin: 0 auto;
            }
            .confirmation-form h2 {
                text-align: center;
                color: #333;
            }
            .confirmation-form p {
                font-size: 16px;
                margin: 10px 0;
            }
            .confirmation-form button {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                width: 48%; /* Adjust width for two buttons */
                margin: 5px;
            }
            .confirmation-form button.cancel {
                background-color: #f44336; /* Red color for cancel button */
            }
            .confirmation-form button:hover {
                opacity: 0.9;
            }
        </style>
    </head>
    <body>
        <div class="confirmation-form">
            <h2>Confirm Your Data</h2>
            <%
                // Retrieve form data from request parameters
                String phone = request.getParameter("phone");
                String district = request.getParameter("district");
                String street = request.getParameter("street");
                 String DOB = request.getParameter("Date");
                String accnum = request.getParameter("AccNum");
                String acctype = request.getParameter("acctype");
                String ID = request.getParameter("ID");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
            %>

            <!-- Display the data for confirmation (Mirroring) -->
            <p><strong>Phone:</strong> <%= phone %></p>
            <p><strong>District:</strong> <%= district %></p>
            <p><strong>Street:</strong> <%= street %></p>
            <p><strong>DOB:</strong> <%= DOB %></p>
            <p><strong>Account Number:</strong> <%= accnum %></p>
            <p><strong>Account Type:</strong> <%= acctype %></p>
            <p><strong>ID:</strong> <%= ID %></p>
            <p><strong>Username:</strong> <%= username %></p>
            <p><strong>Password:</strong> <%= password %></p>

            <!-- Form to confirm and submit data -->
            <form action="InsertingDB.jsp" method="post">
                <!-- Hidden fields to pass data to the next page -->
                <input type="hidden" name="phone" value="<%= phone %>">
                <input type="hidden" name="district" value="<%= district %>">
                <input type="hidden" name="street" value="<%= street %>">
                <input type="hidden" name="Date" value="<%= DOB %>">
                <input type="hidden" name="AccNum" value="<%= accnum %>">
                <input type="hidden" name="acctype" value="<%= acctype %>">
                <input type="hidden" name="ID" value="<%= ID %>">
                <input type="hidden" name="username" value="<%= username %>">
                <input type="hidden" name="password" value="<%= password %>">

                <!-- Confirmation and Cancel buttons -->
                <button type="submit">Confirm and Submit</button>
                <button type="button" class="cancel" onclick="window.location.href='Registration.html'">Cancel</button>
            </form>
        </div>
    </body>
</html>