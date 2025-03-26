package eloanmanagementdb;

import java.io.Serializable;

public class Calculator implements Serializable {
    private String loanType;
    private double loanAmount;
    private int tenure;
    private double interestRate;
    
    public Calculator() {
    }

    public void setLoanType(String loanType) {
        this.loanType = loanType;
        setInterestRate();
    }

    public String getLoanType() {
        return loanType;
    }

    public void setLoanAmount(double loanAmount) {
        this.loanAmount = loanAmount;
    }

    public double getLoanAmount() {
        return loanAmount;
    }

    public void setTenure(int tenure) {
        this.tenure = tenure;
    }

    public int getTenure() {
        return tenure;
    }

    private void setInterestRate() {
        switch (loanType.toLowerCase()) {
            case "short_term":
                interestRate = 14.0;
                break;
            case "medium_term":
                interestRate = 13.0;
                break;
            case "long_term":
                interestRate = 12.0;
                break;
            default:
                interestRate = 0.0; // Default case if loan type is invalid
        }
    }

    public double getInterestRate() {
        return interestRate;
    }

    public double calculateEMI() {
        if (loanAmount <= 0 || tenure <= 0 || interestRate <= 0) {
            return 0.0; // Invalid input case
        }

        double monthlyRate = interestRate / (12 * 100);
        double emi = (loanAmount * monthlyRate * Math.pow(1 + monthlyRate, tenure)) / 
                     (Math.pow(1 + monthlyRate, tenure) - 1);
        return emi;
    }
}