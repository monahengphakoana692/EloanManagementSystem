<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Methods - Standard Bank Loan Ltd</title>
    <style>
        /* General styling */
        #body2 {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container2 {
            max-width: 600px;
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

        .instructions {
            margin-bottom: 20px;
            font-size: 16px;
            line-height: 1.6;
            text-align: center;
        }

        .form-group1 {
            margin-bottom: 20px;
        }

        .form-group1 label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group1 select,
        .form-group1 input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .form-group1 select:focus,
        .form-group1 input:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .submit-button1 {
            text-align: center;
            margin-top: 20px;
        }

        .submit-button1 button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .submit-button1 button:hover {
            background-color: #0056b3;
        }
        #currency
        {
            padding-left: 570px;
        }
    </style>
</head>
<body id="body1">
    <div class="container2">
        <h1>Deposit Methods</h1 >

        <div class="instructions">
            <p>Add funds using our system’s gateway. The deposited amount will be credited to the deposit wallet. You'll just make investments from this wallet.</p>
        </div>

        <form>
            <div class="form-group1">
                <label for="gateway">Select Gateway *</label>
                <select id="gateway" name="gateway" required>
                    <option value="">Select One</option>
                    <option value="gateway1">Gateway 1</option>
                    <option value="gateway2">Gateway 2</option>
                    <option value="gateway3">Gateway 3</option>
                </select>
            </div>

            <div class="form-group1">
                <label for="amount">Amount *</label>
                <input type="number" id="amount" name="amount" placeholder="Enter amount" required>
            </div>

            <div class="form-group1">
                <label for="currency">Currency</label>
                <input type="text" id="currency" name="currency" value="M" readonly>
            </div>

            <div class="submit-button1">
                <button type="submit">Submit</button>
            </div>
        </form>
    </div>
</body>
</html>