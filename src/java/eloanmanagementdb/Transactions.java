package eloanmanagementdb;

import java.beans.*;
import java.io.Serializable;
import java.sql.*;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Transactions implements Serializable {
    // Connection variables
    private String url = "jdbc:mysql://localhost:3306/EloanManagementDB?useSSL=false";
    private String user = "root";
    private String password = "59908114";
    private Connection connect = null;
    private PreparedStatement pstmt = null;
    private Statement statement = null;
    public String exceptionMessage = "";
    public ResultSet rs = null;
    int size = 0;

    // Object attributes
    private String username = "";
    private String traType = "";
    private String date = "";
    private String accNum = "";
    private String traNum = "";
    private float amount = 0.0f;
    private float balance = 0.0f;
    
    // Object attributes
    private List<String> username1 = new ArrayList<>();
    private List<String> traType1 = new ArrayList<>();
    private List<String> date1 = new ArrayList<>();
    private List<String> accNum1 = new ArrayList<>();
    private List<String> traNum1 = new ArrayList<>();
    private List<Float> amount1 = new ArrayList<>();
    private List<Float> balance1 = new ArrayList<>();

    // Constructor
    public Transactions() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the database connection
            connect = DriverManager.getConnection(url, user, password);
            statement = connect.createStatement(); // Initialize the statement
        } catch (Exception e) {
            exceptionMessage = "Connection Error: " + e.toString();
        }
    }

    // Fetch transaction data based on username
    public void fetchTransactionData(String customerID) {
        try {
            String query = "SELECT * FROM transactions WHERE username = ? ORDER BY Date DESC LIMIT 1";
            pstmt = connect.prepareStatement(query);
            pstmt.setString(1, customerID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                this.username = rs.getString("username");
                this.traType = rs.getString("Tra_type");
                this.date = rs.getString("Date");
                this.accNum = rs.getString("accNum");
                this.traNum = rs.getString("tra_num");
                this.amount = rs.getFloat("Amount");
                this.balance = rs.getFloat("Balance");
            } else {
                // If no data is found, set default values
                this.username = "N/A";
                this.traType = "N/A";
                this.date = "N/A";
                this.accNum = "N/A";
                this.traNum = "N/A";
                this.amount = 0.0f;
                this.balance = 0.0f;
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
    // Fetch transaction data based on username
    public void fetchTransactionData(String customerID, String query) {
        try {
            pstmt = connect.prepareStatement(query);
            pstmt.setString(1, customerID);
            rs = pstmt.executeQuery();

            // Clear previous data
            username1.clear();
            traType1.clear();
            date1.clear();
            accNum1.clear();
            traNum1.clear();
            amount1.clear();
            balance1.clear();

            // Fetch data
            while (rs.next()) {
                username1.add(rs.getString("username"));
                traType1.add(rs.getString("Tra_type"));
                date1.add(rs.getString("Date"));
                accNum1.add(rs.getString("accNum"));
                traNum1.add(rs.getString("tra_num"));
                amount1.add(rs.getFloat("Amount"));
                balance1.add(rs.getFloat("Balance"));
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

    public String getTraType() {
        return traType;
    }

    public String getDate() {
        return date;
    }

    public String getAccNum() {
        return accNum;
    }

    public String getTraNum() {
        return traNum;
    }

    public float getAmount() {
        return amount;
    }

    public float getBalance() {
        return balance;
    }
    public String getUsername1(int index) {
        return username1.get(index);
    }

    public String getTraType1(int index) {
        return traType1.get(index);
    }

    public String getDate1(int index) {
        return date1.get(index);
    }

    public String getAccNum1(int index) {
        return accNum1.get(index);
    }

    public String getTraNum1(int index) {
        return traNum1.get(index);
    }

    public float getAmount1(int index) {
        return amount1.get(index);
    }

    public float getBalance1(int index) {
        return balance1.get(index);
    }

    public String getExceptionMessage() {
        return exceptionMessage;
    }
    
    public int numOfDeposits(String username)
    {
        int Deposits = 0;
        try
        {
        String query = "select sum(Amount) from Transactions where Tra_type='dep' AND username='" + username  +"'";
        
        rs = statement.executeQuery(query);
        
        if(rs.next())
        {
            Deposits = rs.getInt(1);
        }
        }catch(Exception e)
        {
            exceptionMessage = "counting trans Error: " + e.toString();
        }
        return Deposits;
    }
    
    public int numOfWithDrawls(String username)
    {
        int Deposits = 0;
        try
        {
        String query = "select sum(Amount) from Transactions where Tra_type='withd' AND username='" + username  +"'";
        
        rs = statement.executeQuery(query);
        
        if(rs.next())
        {
            Deposits = rs.getInt(1);
        }
        }catch(Exception e)
        {
            exceptionMessage = "counting trans Error: " + e.toString();
        }
        return Deposits;
    }
    
    public int sum(String username)
    {
        int Deposits = 0;
        try
        {
        String query = "select sum(Amount) from Transactions where username='" + username  +"'";
        
        rs = statement.executeQuery(query);
        
        if(rs.next())
        {
            Deposits = rs.getInt(1);
        }
        }catch(Exception e)
        {
            exceptionMessage = "counting trans Error: " + e.toString();
        }
        return Deposits;
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