<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserting Data into Database</title>
    </head>
    <body>
        <%
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/EloanManagementDB?useSSL=false";
            String user = "root";
            String pass = "59908114";
            boolean nameValidation = true;
            
            Connection connect = null;
            PreparedStatement pstmt = null;
            Statement statement = null;
            
            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Establish the database connection
                connect = DriverManager.getConnection(url, user, pass);
                
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
                
                // SQL query to insert data into the database
                String sql = "INSERT INTO customers (P_num, District, street,DOB, AccNum, Acctype, NID, username, pass) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
                String check = "Select username from customers";
                
                
                // Create a PreparedStatement to safely insert data
                pstmt = connect.prepareStatement(sql);
                statement = connect.createStatement();
                
                ResultSet rs = statement.executeQuery(check);
                
                while(rs.next())
                {
                    String name = rs.getString("username");
                    
                    if(name.equals(username))
                    {
                        out.println("The name already exists, try a different name");
                        nameValidation = false;
                        break;
                    }
                }
                
                if(nameValidation == true)
                {
                    pstmt.setString(1, phone);
                    pstmt.setString(2, district);
                    pstmt.setString(3, street);
                    pstmt.setString(4, DOB);
                    pstmt.setString(5, accnum);
                    pstmt.setString(6, acctype);
                    pstmt.setString(7, ID);
                    pstmt.setString(8, username);
                    pstmt.setString(9, password);
                }
                
                
                // Execute the query
                int rowsInserted = pstmt.executeUpdate();
                
                // Check if the insertion was successful
                if (rowsInserted > 0) {
                    out.println("Successfully registered!");
                } else {
                    out.println("Registration failed. Please try again.");
                }
                
            } catch (Exception e) {
                // Handle exceptions
                out.println("An error occurred: " + e.getMessage());
            } finally {
                // Close resources in the finally block
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) {
                        out.println("Error closing PreparedStatement: " + e.getMessage());
                    }
                }
                if (connect != null) {
                    try {
                        connect.close();
                    } catch (SQLException e) {
                        out.println("Error closing Connection: " + e.getMessage());
                    }
                }
            }
        %>
    </body>
</html>