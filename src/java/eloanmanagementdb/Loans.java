package eloanmanagementdb;

import java.beans.*;
import java.io.Serializable;
import java.sql.*;
import java.sql.Statement;

public class Loans implements Serializable
{
    // Connection variables
    private String url = "jdbc:mysql://localhost:3306/EloanManagementDB?useSSL=false";
    private String user = "root";
    private String password = "59908114";
    private Connection connect = null;
    private PreparedStatement pstmt = null;
    private Statement statement = null;
    public String exceptionMessage = "";
    public ResultSet rs = null;

    // Object attributes
    private String username = "";
    private String loantype = "";
    private String date = "";
    private String loanNum = null;
    private String status = "";
    private float loanAmount = 0.0f;
    private float dueAmount = 0.0f;
    private float amountPaid = 0.0f;

    // Constructor
    public Loans() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the database connection
            connect = DriverManager.getConnection(url, user, password);
            statement = connect.createStatement(); // Initialize the statement
        } catch (Exception e) {
            exceptionMessage = "Connection Error: " + e.toString();
        }
    }

    // Fetch loan data based on username
    public void fetchLoanData(String customerID) {
        try {
            String query = "SELECT * FROM loans WHERE username = ?";
            pstmt = connect.prepareStatement(query);
            pstmt.setString(1, customerID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                this.username = rs.getString("username");
                this.loantype = rs.getString("loantype");
                this.date = rs.getString("Date");
                this.loanNum = rs.getString("loanNum");
                this.status = rs.getString("status");
                this.loanAmount = rs.getFloat("loanAmount");
                this.dueAmount = rs.getFloat("DueAmount");
                this.amountPaid = rs.getFloat("amountPaid");
            } else {
                // If no data is found, set default values
                this.username = "N/A";
                this.loantype = "N/A";
                this.date = "N/A";
                this.loanNum = null;
                this.status = "N/A";
                this.loanAmount = 0.0f;
                this.dueAmount = 0.0f;
                this.amountPaid = 0.0f;
            }
        } catch (Exception e) {
            exceptionMessage = "Fetch Data Error: " + e.toString();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                exceptionMessage = "Closing Error: " + e.toString();
            }
        }
    }
    
    
    // Getters
    public String getUsername() {
        return username;
    }

    public String getLoantype() {
        return loantype;
    }

    public String getDate() {
        return date;
    }

    public String getLoanNum() {
        return loanNum;
    }

    public String getStatus() {
        return status;
    }

    public float getLoanAmount() {
        return loanAmount;
    }

    public float getDueAmount() {
        return dueAmount;
    }

    public float getAmountPaid() {
        return amountPaid;
    }

    public String getExceptionMessage() {
        return exceptionMessage;
    }

    // Close the database connection
    public String closeConnection() {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (statement != null) statement.close();
            if (connect != null) connect.close();
        } catch (Exception e) {
            exceptionMessage = "Connection Closing Error: " + e.toString();
        }
        return exceptionMessage;
    }
}