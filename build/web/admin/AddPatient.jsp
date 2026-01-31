<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Patient</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #eef6fa, #d1e9f9);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow-y: auto;
            padding: 40px 0;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px 35px;
            border-radius: 16px;
            width: 100%;
            max-width: 650px;
            box-shadow: 0 0 20px rgba(135, 206, 250, 0.25);
        }

        h2 {
            text-align: center;
            color: #007acc;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: 500;
            color: #005f8d;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 10px;
            border: 1px solid #87cefa;
            font-size: 1em;
            background-color: #f4fbff;
            color: #333;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus,
        select:focus {
            border-color: #00bfff;
            background-color: #e6f7ff;
            outline: none;
        }

        input[readonly] {
            background-color: #e6f7ff;
        }

        input[type="submit"] {
            background-color: #00bfff;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 10px;
            font-size: 1em;
            cursor: pointer;
            transition: 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #00a3cc;
        }

        .success-msg {
            color: green;
            margin-top: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2><i class="fas fa-procedures"></i> Add Patient</h2>
        <form action="../AddPatientServlet" method="post">
            <label>Patient ID:</label>
            <input type="number" name="patient_id" value="0" required />

            <label>Disease Description:</label>
            <input type="text" name="disease_description" required />

            <label>Age:</label>
            <input type="number" name="age" required />

            <label>Contact No:</label>
            <input type="text" name="contact_no" required />

            <label>Fee Paid:</label>
            <input type="text" name="fee_paid" required />

            <label>Consult Doctor:</label>
            <select name="consult_doctor" required>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "root");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT username FROM adddoctor");
                    while(rs.next()) {
                %>
                <option value="<%= rs.getString("username") %>"><%= rs.getString("username") %></option>
                <% } con.close(); %>
            </select>

            <label>Prescription:</label>
            <input type="text" name="prescription" value="Pending" readonly />

            <label>Visit Date:</label>
            <input type="date" name="visit_date" required />

            <input type="submit" value="Add Patient" />
        </form>
        <% 
            String msg = request.getParameter("msg"); 
            if (msg != null) { 
        %>
            <p class="success-msg"><%= msg %></p>
        <% } %>
    </div>
</body>
</html>
