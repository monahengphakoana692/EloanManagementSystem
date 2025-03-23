package eloanmanagementdb;

import java.beans.*;
import java.io.Serializable;
import java.sql.*;
import java.sql.Statement;

public class Customers implements Serializable {
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
    private String P_num = "";
    private String District = "";
    private String street = "";
    private String DOB = "";
    private String AccNum = "";
    private String Acctype = "";
    private String NID = "";
    private String username = "";
    private String pass = "";

    public Customers() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the database connection
            connect = DriverManager.getConnection(url, user, password);
            statement = connect.createStatement(); // Initialize the statement
        } catch (Exception e) {
            exceptionMessage = "Connection Error: " + e.toString();
        }
    }    

    // Fetch all customer data in one query
    public void fetchCustomerData(String customerID) {
        try {
            String query = "SELECT * FROM customers WHERE username = ?";
            pstmt = connect.prepareStatement(query);
            pstmt.setString(1, customerID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                this.P_num = rs.getString("P_num");
                this.District = rs.getString("District");
                this.street = rs.getString("street");
                this.DOB = rs.getString("DOB");
                this.AccNum = rs.getString("AccNum");
                this.Acctype = rs.getString("Acctype");
                this.NID = rs.getString("NID");
                this.username = rs.getString("username");
                this.pass = rs.getString("pass");
            } else {
                // If no data is found, set default values
                this.P_num = "N/A";
                this.District = "N/A";
                this.street = "N/A";
                this.DOB = "N/A";
                this.AccNum = "N/A";
                this.Acctype = "N/A";
                this.NID = "N/A";
                this.username = "N/A";
                this.pass = "N/A";
            }
        } catch (Exception e) {
            exceptionMessage = "Fetch Data Error: " + e.toString();
        }
    }

    // Getters
    public String getP_num() {
        return P_num;
    }

    public String getDistrict() {
        return District;
    }

    public String getStreet() {
        return street;
    }

    public String getDOB() {
        return DOB;
    }

    public String getAccNum() {
        System.out.print(this.Accnum);
        return AccNum;
    }

    public String getAcctype() {
        return Acctype;
    }

    public String getNID() {
        return NID;
    }

    public String getUsername() {
        return username;
    }

    public String getPass() {
        return pass;
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