<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*,java.util.Date, java.security.*" %>
<%@ page session="true" %>
<%
    // Database configuration
    String url = "jdbc:mysql://localhost:3306/EloanManagementDB?useSSL=false";
    String dbUser = "root";
    String dbPass = "59908114";
    
    // Get parameters directly without validation
    String username = (String) session.getAttribute("username");
    String fullNames = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String loantype = request.getParameter("loanType");
    String amountStr = request.getParameter("amount");
    
    // Generate loan number
    String characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    SecureRandom random = new SecureRandom();
    StringBuilder loanNum = new StringBuilder(14);
    for (int i = 0; i < 14; i++) {
        loanNum.append(characters.charAt(random.nextInt(characters.length())));
    }
    
    // Get current date
    Date date = new Date();
    
    
    // Calculate due amount (simple addition)
    float loanAmount = Float.parseFloat(amountStr);
    float dueAmount = loanAmount + 27;
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        // Load JDBC driver and establish connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);
        
        // Insert loan application
        String insertSql = "INSERT INTO loans (username, loantype, Date, loanNum, status, " +
                         "loanAmount, DueAmount, amountPaid, fullNames, email) " +
                         "VALUES (?, ?, ?, ?, 'Pending', ?, ?, 0, ?, ?)";
        
        pstmt = conn.prepareStatement(insertSql);
        pstmt.setString(1, username);
        pstmt.setString(2, loantype);
        pstmt.setString(3, date.toString());
        pstmt.setString(4, loanNum.toString());
        pstmt.setFloat(5, loanAmount);
        pstmt.setFloat(6, dueAmount);
        pstmt.setString(7, fullNames);
        pstmt.setString(8, email);
       
        
        pstmt.executeUpdate();
        
        // Redirect with success
        response.sendRedirect("CustomerMaster.jsp?success=Loan applied successfully");
        
    } catch (Exception e) {
        // Redirect with error
        response.sendRedirect("ApplyForm.jsp?error=Application failed: " + e.getMessage());
    } finally {
        // Clean up resources
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { }
        if (conn != null) try { conn.close(); } catch (SQLException e) { }
    }
%>