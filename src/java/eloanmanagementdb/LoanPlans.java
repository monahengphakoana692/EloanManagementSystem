package eloanmanagementdb;

import java.io.Serializable;
import java.sql.*;

public class LoanPlans implements Serializable {
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
    private String loanType = "";
    private String interestRate = "";
    private float minAmount = 0.0f;
    private float maxAmount = 0.0f;
    private String installmentPercent = "";
    private String installmentInterval = ""; // in days
    private String totalInstallment = "";
    private boolean isLoanChosen = false;
    private double EMI;

    // Constructor
    public LoanPlans() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the database connection
            connect = DriverManager.getConnection(url, user, password);
            statement = connect.createStatement(); // Initialize the statement
        } catch (Exception e) {
            exceptionMessage = "Connection Error: " + e.toString();
        }
    }

    // Fetch loan plan data based on loan type
    public void fetchLoanPlanData(String loanType) {
        try {
            String query = "SELECT * FROM loanplans WHERE loantype  = ?";
            pstmt = connect.prepareStatement(query);
            pstmt.setString(1, loanType);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                this.loanType = rs.getString("loanType");
                this.interestRate = rs.getString("interest");
                this.minAmount = rs.getFloat("miniAm");
                this.maxAmount = rs.getFloat("maxiAm");
                this.installmentPercent = rs.getString("P_instal");
                this.installmentInterval = rs.getString("instal_interval");
                this.totalInstallment = rs.getString("total_instal");
            } else {
                // If no data is found, set default values
                this.loanType = "N/A";
                this.interestRate = "N/A";
                this.minAmount = 0.0f;
                this.maxAmount = 0.0f;
                this.installmentPercent = "N/A";
                this.installmentInterval = "N/A";
                this.totalInstallment = "N/A";
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
    
    public void setIsLoanChosen(boolean value)
    {
        this.isLoanChosen = value;
    }

    // Getters
    public String getLoanType() {
        return loanType;
    }

    public String getInterestRate() {
        return interestRate;
    }

    public float getMinAmount() {
        return minAmount;
    }

    public float getMaxAmount() {
        return maxAmount;
    }

    public String getInstallmentPercent() {
        return installmentPercent;
    }

    public String getInstallmentInterval() {
        return installmentInterval;
    }

    public String getTotalInstallment() {
        return totalInstallment;
    }

    public String getExceptionMessage() {
        return exceptionMessage;
    }
    public boolean getIsLoanChosen()
    {
        return isLoanChosen;
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
    public void setEMI(float amount)
    {
        
        this.EMI = amount *Double.parseDouble(this.interestRate ) *
            Math.pow(1 + Double.parseDouble(this.interestRate),Double.parseDouble(this.installmentInterval)) /
            (Math.pow(1 + Double.parseDouble(this.interestRate), Double.parseDouble(this.installmentInterval)) - 1);
    }
    
    public double getEMI()
    {
        return EMI;
    }
}