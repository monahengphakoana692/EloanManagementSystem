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
    private String p_num = "";
    private String district = "";
    private String street = "";
    private String DOB = "";
    private String accNum = "";
    private String acctype = "";
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
    public void fetchCustomerData(String customerID)
    {
    try {
        String query = "SELECT * FROM customers WHERE username = ?";
        pstmt = connect.prepareStatement(query);
        pstmt.setString(1, customerID);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            this.p_num = rs.getString("P_num");
            this.district = rs.getString("District");
            this.street = rs.getString("street");
            this.DOB = rs.getString("DOB");
            this.accNum = rs.getString("AccNum");
            this.acctype = rs.getString("Acctype");
            this.NID = rs.getString("NID");
            this.username = rs.getString("username");
            this.pass = rs.getString("pass");
        } else {
            this.p_num= "N/A";
            this.district = "N/A";
            this.street = "N/A";
            this.DOB = "N/A";
            this.accNum = "N/A";
            this.acctype = "N/A";
            this.NID = "N/A";
            this.username = "N/A";
            this.pass = "N/A";
        }
    } catch (Exception e)
    {
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
  public int count()
  {
      int count = 0;
      try
      {
          //select count(status) from loans where status='pending'
          String query = "select count(username) from customers";
        pstmt = connect.prepareStatement(query);
        rs = pstmt.executeQuery();
        if(rs.next())
        {
            count = rs.getInt(1);
        }
                
        
      }catch(Exception e)
      {
          exceptionMessage = "Fetch Data Error: " + e.toString();
      }  finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
        } catch (SQLException e) {
            exceptionMessage = "Closing Error: " + e.toString();
        }
    }
      
      return count;
  }
  public String getDistrict() {
    return district;
}

public String getStreet() {
    return street;
}

public String getDOB() {
    return DOB;
}

public String getAccNum() {
    return accNum;
}

public String getNID() {
    return NID;
}

public String getUsername() {
    return username;
}
public String getP_num()
{
    return p_num;
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