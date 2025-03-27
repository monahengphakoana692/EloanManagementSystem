package eloanmanagementdb;

import java.beans.*;
import java.io.Serializable;
import java.sql.*;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
  
    
    private List<String> username1 = new ArrayList<>();
    private List<String> date1 = new ArrayList<>();
    private List<String> loantype1 = new ArrayList<>();
    private List<String> loanNum1 = new ArrayList<>();
    private List<String> status1 = new ArrayList<>();
    private List<Float> loanAmount1 = new ArrayList<>();
    private List<Float> dueAmount1 = new ArrayList<>();
    private List<Float> amountPaid1 = new ArrayList<>();
    private List<String> fullname = new ArrayList<>();
    private List<String> email = new ArrayList<>();

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
    
    public void fetchLoanData() {
        try {
            String query = "SELECT * FROM loans";
            pstmt = connect.prepareStatement(query);
            
            rs = pstmt.executeQuery();
            
            username1.clear();
            loantype1.clear();
            date1.clear();
            loanNum1.clear();
            status1.clear();
            loanAmount1.clear();
            dueAmount1.clear();
            amountPaid1.clear();
            
            while(rs.next())
            {
                this.username1.add(rs.getString("username"));
                this.loantype1.add(rs.getString("loantype"));
                this.date1.add(rs.getString("Date"));
                this.loanNum1.add( rs.getString("loanNum"));
                this.status1.add( rs.getString("status"));
                this.loanAmount1.add( rs.getFloat("loanAmount"));
                this.dueAmount1.add( rs.getFloat("DueAmount"));
                this.amountPaid1.add( rs.getFloat("amountPaid"));
                this.fullname.add(rs.getString("fullNames"));
                this.email.add(rs.getString("email"));
                
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
    
    
    public void fetchLoanData2(String username) {
        try {
            String query = "SELECT * FROM loans where username = ?";
            pstmt = connect.prepareStatement(query);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            
            username1.clear();
            loantype1.clear();
            date1.clear();
            loanNum1.clear();
            status1.clear();
            loanAmount1.clear();
            dueAmount1.clear();
            amountPaid1.clear();
            
            while(rs.next())
            {
                this.username1.add(rs.getString("username"));
                this.loantype1.add(rs.getString("loantype"));
                this.date1.add(rs.getString("Date"));
                this.loanNum1.add( rs.getString("loanNum"));
                this.status1.add( rs.getString("status"));
                this.loanAmount1.add( rs.getFloat("loanAmount"));
                this.dueAmount1.add( rs.getFloat("DueAmount"));
                this.amountPaid1.add( rs.getFloat("amountPaid"));
                this.fullname.add(rs.getString("fullNames"));
                this.email.add(rs.getString("email"));
                
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
    public int getSize()
    {
        return username1.size();
    }
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
    
    
    public String getUsername(int index)
    {
        return username1.get(index);
    }

    public String getLoantype(int index) {
        return loantype1.get(index);
    }

    public String getDate(int index) {
        return date1.get(index);
    }

    public String getLoanNum(int index) {
        return loanNum1.get(index);
    }

    public String getStatus(int index) {
        return status1.get(index);
    }

    public float getLoanAmount(int index) {
        return loanAmount1.get(index);
    }

    public float getDueAmount(int index) {
        return dueAmount1.get(index);
    }

    public float getAmountPaid(int index) {
        return amountPaid1.get(index);
    }
    
    public float getFullname(int index)
    {
        return dueAmount1.get(index);
    }

    public float getEmail(int index) 
    {
        return amountPaid1.get(index);
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
    
    public int count()
  {
      int count = 0;
      try
      {
          //select count(status) from loans where status='pending'
          String query = "select count(status) from loans where status='pending'";
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
}