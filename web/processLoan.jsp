<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.Date, java.util.*" %>
<%@ page session="true" %>
<%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/EloanManagementDB?useSSL=false";
    String dbUser = "root";
    String dbPass = "59908114";
    
    // Get form data
    String username = (String) session.getAttribute("username");
    String fullNames = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String loantype = request.getParameter("loanType");
    String amountStr = request.getParameter("amount");
    
    // Validate required fields
    if (username == null || fullNames == null || loantype == null || amountStr == null || 
        fullNames.isEmpty() || loantype.equals("select") || amountStr.isEmpty()) {
        session.setAttribute("error", "Please fill in all required fields");
        response.sendRedirect("CustomerMaster.jsp");
        return;
    }
    
    // Parse amount
    float loanAmount = 0;
    try {
        loanAmount = Float.parseFloat(amountStr);
    } catch (NumberFormatException e) {
        session.setAttribute("error", "Invalid loan amount format");
        response.sendRedirect("CustomerMaster.jsp");
        return;
    }
    
    // Validate amount range
    if (loanAmount < 1000 || loanAmount > 5000000) {
        session.setAttribute("error", "Loan amount must be between 1,000 and 5,000,000");
        response.sendRedirect("CustomerMaster.jsp");
        return;
    }
    
    // Generate loan number
    String characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int length = 14;
    StringBuilder loanNum = new StringBuilder(length);
    Random random = new Random();
    for (int i = 0; i < length; i++) {
        int randomIndex = random.nextInt(characters.length());
        loanNum.append(characters.charAt(randomIndex));
    }
    
    // Get current date as string
    String date = new Date().toString();
    
    // Calculate due amount (loan amount + 27)
    float dueAmount = loanAmount + 27;
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Create connection
        conn = DriverManager.getConnection(url, dbUser, dbPass);
        stmt = conn.createStatement();
        
        // MIRROR DATA: First verify user exists
        String checkUserSql = "SELECT * FROM customers WHERE username = '" + username + "'";
        rs = stmt.executeQuery(checkUserSql);
        
        if (!rs.next()) {
            session.setAttribute("error", "User not found in database");
            response.sendRedirect("CustomerMaster.jsp");
            return;
        }
        
        // MIRROR DATA: Verify email matches user record
        String dbEmail = rs.getString("email");
        if (!dbEmail.equals(email)) {
            session.setAttribute("error", "Email doesn't match user record");
            response.sendRedirect("CustomerMaster.jsp");
            return;
        }
        
        // Insert loan record
        String insertSql = "INSERT INTO loans (username, loantype, Date, loanNum, status, loanAmount, DueAmount, amountPaid, fullNames, email, phone) " +
                         "VALUES ('" + username + "', '" + loantype + "', '" + date + "', '" + loanNum.toString() + 
                         "', 'Pending', " + loanAmount + ", " + dueAmount + ", 0, '" + fullNames + "', '" + email + "', '" + phone + "')";
        
        int rowsAffected = stmt.executeUpdate(insertSql);
        
        if (rowsAffected > 0) {
            // Update user's loan status
            String updateUserSql = "UPDATE customers SET has_loan = 'Y' WHERE username = '" + username + "'";
            stmt.executeUpdate(updateUserSql);
            
            // Success - redirect with success message
            session.setAttribute("success", "Loan application submitted successfully. Loan Number: " + loanNum.toString());
            response.sendRedirect("CustomerMaster.jsp");
        } else {
            session.setAttribute("error", "Failed to process loan application");
            response.sendRedirect("CustomerMaster.jsp");
        }
    } catch (ClassNotFoundException e) {
        session.setAttribute("error", "System error: JDBC driver not found");
        response.sendRedirect("CustomerMaster.jsp");
    } catch (SQLException e) {
        session.setAttribute("error", "Database error: " + e.getMessage());
        response.sendRedirect("CustomerMaster.jsp");
    } finally {
        // Close resources
        if (rs != null) try { rs.close(); } catch (SQLException e) { /* ignore */ }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* ignore */ }
        if (conn != null) try { conn.close(); } catch (SQLException e) { /* ignore */ }
    }
%>