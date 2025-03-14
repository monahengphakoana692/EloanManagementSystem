<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Loan Master | eLoan Management</title>
    
    <!-- Bootstrap for responsive layout -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">

    <style>
        body {
            background-color: #f5f7fa;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 800px;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }
        .btn-primary {
            background-color: #004080;
            border: none;
        }
        .btn-primary:hover {
            background-color: #002d5a;
        }
        .table {
            margin-top: 20px;
        }
    </style>

</head>
<body>

<div class="container">
    <h2 class="text-center text-primary">Loan Master</h2>

    <form action="loanMaster.jsp" method="post" class="mb-4">
        <div class="mb-3">
            <label class="form-label">Loan Type Name</label>
            <input type="text" name="loanType" class="form-control" placeholder="Enter new loan type" required>
        </div>
        <div class="mb-3">
            <button type="submit" class="btn btn-primary">Add Loan Type</button>
        </div>
    </form>

    <h4>Existing Loan Types</h4>
    <table class="table table-bordered">
        <%!
                String[] loanTypes = {"Moaheng","Moaheng2","Moaheng2"};
        %>
        <thead>
            <tr>
                <th>Loan Type</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="loan" items="${loanTypes}">
                <tr>
                    <td>monaheng<td>
                    <td>
                        <a href="editLoan.jsp?id=${loan.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="deleteLoan.jsp?id=${loan.id}" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
