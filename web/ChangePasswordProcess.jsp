<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>
<%
    // Database connection details
    String url = "jdbc:mysql://localhost:3306/EloanManagementDB?useSSL=false";
    String dbUser = "root";
    String dbPass = "59908114";

    // Retrieve form data
    String currentPassword = request.getParameter("currentPassword");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");
    String username = (String) session.getAttribute("username");

    if (username == null) {
        response.sendRedirect("Login.html"); // Redirect to login if session is invalid
        return;
    }

    if (!newPassword.equals(confirmPassword)) {
        out.println("New password and confirm password do not match.");
        return;
    }

    Connection connect = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        connect = DriverManager.getConnection(url, dbUser, dbPass);
        stmt = connect.createStatement();

        // Retrieve the current password from the database
        String query = "SELECT pass FROM customers WHERE username = '" + username + "'";
        rs = stmt.executeQuery(query);

        if (rs.next()) {
            String dbPassword = rs.getString("pass");

            // Verify the current password
            if (currentPassword.equals(dbPassword)) {
                // Update the password in the database
                String updateQuery = "UPDATE customers SET pass = '" + newPassword + 
                                    "' WHERE username = '" + username + "'";

                int rowsUpdated = stmt.executeUpdate(updateQuery);
                if (rowsUpdated > 0) {
                    out.println("Password changed successfully.");
                    response.sendRedirect("Login.html");
                    return;
                } else {
                    out.println("Failed to change password.");
                }
            } else {
                out.println("Current password is incorrect.");
            }
        } else {
            out.println("User not found.");
        }
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
    } finally {
        // Close resources
        if (rs != null) {
            try { rs.close(); } catch (SQLException e) { /* Ignored */ }
        }
        if (stmt != null) {
            try { stmt.close(); } catch (SQLException e) { /* Ignored */ }
        }
        if (connect != null) {
            try { connect.close(); } catch (SQLException e) { /* Ignored */ }
        }
    }
%> 