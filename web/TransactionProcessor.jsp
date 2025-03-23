<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, eloanmanagementdb.Transactions, java.util.*,java.util.Date;" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction Processor</title>
    </head>
    <body>
        <h1>Transaction Processing</h1>
        <%String url = "jdbc:mysql://localhost:3306/EloanManagementDB?useSSL=false";
        String dbUser = "root";
        String dbPass = "59908114";
       Date date = new Date();
      
        
        Connection connect = null;
        PreparedStatement  pstmt = null;
        ResultSet rs = null;
        boolean passchecker = false;
        
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish the database connection
            connect = DriverManager.getConnection(url, dbUser, dbPass);%>
        <%
            // Generate a random transaction number
            String characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            int length = 14;
            StringBuilder transactionNumber = new StringBuilder(length);
            Random random = new Random();

            for (int i = 0; i < length; i++) {
                int randomIndex = random.nextInt(characters.length());
                transactionNumber.append(characters.charAt(randomIndex));
            }

            String traNum = transactionNumber.toString();
            
        %>
        <%
            // Retrieve form data
            String Accnum = request.getParameter("Accnum");
            String traType = request.getParameter("traType");
            String amountStr = request.getParameter("amount");
            String currency = request.getParameter("currency");

            // Validate input
            if (Accnum== null || amountStr == null || currency == null) {
                out.println("<p>Error: Missing form data. Please go back and fill out the form.</p>");
                return;
            }

            // Parse amount
            float amount = 0.0f;
            try {
                amount = Float.parseFloat(amountStr);
            } catch (NumberFormatException e) {
                out.println("<p>Error: Invalid amount. Please enter a valid number.</p>");
                return;
            }

            // Fetch current balance from the database
            Transactions transaction = new Transactions();
            String username = (String) session.getAttribute("username");

            // Fetch the latest balance for the user
            float currentBalance = 0.0f;
            try {
                String query = "SELECT Balance FROM transactions WHERE username = ? ORDER BY Date DESC LIMIT 1";
                pstmt = connect.prepareStatement(query);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    currentBalance = rs.getFloat("Balance");
                } else {
                    // If no previous transactions, assume balance is 0
                    currentBalance = 0.0f;
                }

                rs.close();
                pstmt.close();
            } catch (SQLException e) {
                out.println("<p>Error fetching balance: " + e.getMessage() + "</p>");
                return;
            }
            float newBalance = 0.0f;
            if(traType.equals("dep"))
            {
               
             newBalance = currentBalance + amount;
            }else if(traType.equals("withd"))
            {
                if(amount<currentBalance)
                {
                    newBalance = currentBalance - amount;
                }else
                {
                    out.println("<p>Error: Transaction failed, insufficient funds.</p>");
                    return;
                }
            }

            // Insert the new transaction into the database
            try {
                String insertQuery = "INSERT INTO transactions (username, Tra_type, Date, accNum, tra_num, Amount, Balance) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = connect.prepareStatement(insertQuery);
                insertStmt.setString(1, username);
                insertStmt.setString(2, traType);
                 insertStmt.setString(3, date.toString()); 
                insertStmt.setString(4, Accnum); 
                insertStmt.setString(5, traNum); 
                insertStmt.setFloat(6, amount);
                insertStmt.setFloat(7, newBalance);

                int rowsInserted = insertStmt.executeUpdate();
                if (rowsInserted > 0) {
                    out.println("<p>Transaction successful! New balance: " + newBalance + "</p>");
                } else {
                    out.println("<p>Error: Transaction failed to insert.</p>");
                }

                insertStmt.close();
            } catch (SQLException e) {
                out.println("<p>Error inserting transaction: " + e.getMessage() + "</p>");
            } finally {
                // Close the database connection
                transaction.closeConnection();
            }
            }catch(Exception e)
            {   
                out.println("wow errors : ");
            }
        %>
    </body>
</html>