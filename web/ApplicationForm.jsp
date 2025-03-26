<%@page import="eloanmanagementdb.Calculator"%>
<jsp:useBean id="calculator" class="eloanmanagementdb.Calculator" scope="request" />
<jsp:setProperty name="calculator" property="*" />

<!DOCTYPE html>
<html>
<head>
    <title>Credit Calculator</title>
    <style>
        .calculator-container { max-width: 500px; margin: 0 auto; padding: 20px; }
        .calculator-form-group { margin-bottom: 15px; }
        .calculator-result { margin: 20px 0; font-weight: bold; }
      
    /* Main Container Styles */
    .calculator-container {
        max-width: 500px;
        margin: 0 auto;
        padding: 30px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    /* Header Styles */
    .calculator-container h2 {
        color: #2c3e50;
        text-align: center;
        margin-bottom: 25px;
        font-size: 28px;
        font-weight: 600;
    }

    /* Form Group Styles */
    .calculator-form-group {
        margin-bottom: 20px;
    }

    .calculator-form-group label {
        display: block;
        margin-bottom: 8px;
        color: #34495e;
        font-weight: 500;
        font-size: 16px;
    }

    /* Input Field Styles */
    .calculator-form-group input[type="number"],
    .calculator-form-group select {
        width: 100%;
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 16px;
        transition: border-color 0.3s;
        box-sizing: border-box;
    }

    .calculator-form-group input[type="number"]:focus,
    .calculator-form-group select:focus {
        border-color: #3498db;
        outline: none;
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
    }

    /* Button Styles */
    button {
        width: 100%;
        padding: 14px;
        background-color: #2980b9;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.3s;
        margin-top: 10px;
    }

    button:hover {
        background-color: #3498db;
    }

    /* Results Section Styles */
    #results {
        margin-top: 25px;
        padding: 20px;
        background-color: #f8f9fa;
        border-radius: 6px;
        border-left: 4px solid #2980b9;
    }

    .calculator-result {
        color: #2c3e50;
    }

    .calculator-result h3 {
        color: #27ae60;
        margin-bottom: 10px;
        font-size: 20px;
    }

    .calculator-result p {
        margin: 5px 0;
        font-size: 16px;
    }

    /* Error Message Styles */
    .error-message {
        color: #e74c3c;
        padding: 10px;
        background-color: #fadbd8;
        border-radius: 4px;
        margin-top: 15px;
    }

    /* Responsive Design */
    @media (max-width: 600px) {
        .calculator-container {
            padding: 20px;
            margin: 20px;
        }
        
        .calculator-container h2 {
            font-size: 24px;
        }
    }
</style>
    </style>
</head>
<body>
    <div class="home1">
       
    </div><br><br>
    <div class="calculator-container">
        <h2>Credit Calculator</h2>
        <form action="calEMI.jsp" method="post">
            <div class="calculator-form-group">
                <label for="term-select">Loan Type</label>
                <select id="term-select" name="loanType" required>
                    <option value="short_term">Short Term</option>
                    <option value="medium_term">Medium Term</option>
                    <option value="long_term">Long Term</option>
                </select>
            </div>
            <div class="calculator-form-group">
                <label for="amount">Loan Amount</label>
                <input type="number" id="amount" name="loanAmount" step="0.01" placeholder="Enter amount" required>
            </div>
            <div class="calculator-form-group">
                <label for="months">Tenure (Months)</label>
                <input type="number" id="months" name="tenure" placeholder="Enter number of months" required>
                <div id="results">
                    
                </div>
            </div>
            <button type="hidden" onclick="callJSPMethods('calEMI')">Calculate EMI</button>
            
        </form>
    </div><br><br>
    
    <script>
        function callJSPMethods(pageName) {
            // Validate pageName to prevent XSS
            const validPages = ['calEMI'];
            
            if (!validPages.includes(pageName)) {
                console.error('Invalid page request');
                return;
            }
                //action="calEMI.jsp"
            // For logout, redirect immediately
            if (pageName === 'Logout') {
                window.location.href = 'Logout.jsp';
                return;
            }

            fetch(pageName + '.jsp')
                .then(response => {
                    if (!response.ok) throw new Error('Network response was not ok');
                    return response.text();
                })
                .then(data => {
                    document.getElementById('results').innerHTML = this.r;
                })
                .catch(error => {
                    console.error('Error:', error);
                    document.getElementById('dynamic-content').innerHTML = 
                        '<div class="error-message">Error loading content. Please try again.</div>';
                });
        }

        // Load dashboard by default
        document.addEventListener('DOMContentLoaded', function() {
            callJSPMethods('dashboard');
        });
    </script>
</body>
</html>
