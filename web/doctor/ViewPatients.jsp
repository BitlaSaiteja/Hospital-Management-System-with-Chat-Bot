<%@ page language="java" %>
<%@ page import="java.sql.*, javax.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Patients</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #eef6fa, #d1e9f9);
            padding: 40px;
            color: #333;
        }

        h2 {
            text-align: center;
            color: #007acc;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            max-width: 1100px;
            margin: auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 15px rgba(0, 191, 255, 0.2);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #00bfff;
            color: white;
        }

        tr:hover {
            background-color: #f1faff;
        }

        a {
            color: #007acc;
            text-decoration: none;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            thead tr {
                display: none;
            }

            tr {
                margin-bottom: 15px;
                border-bottom: 2px solid #00bfff;
                padding: 10px;
            }

            td {
                padding-left: 50%;
                position: relative;
            }

            td::before {
                content: attr(data-label);
                position: absolute;
                left: 15px;
                top: 15px;
                font-weight: bold;
                color: #007acc;
            }
        }
    </style>
</head>
<body>
    <h2><i class="fas fa-procedures"></i> Patients List</h2>
    <table>
        <thead>
            <tr>
                <th>Patient ID</th>
                <th>Disease</th>
                <th>Age</th>
                <th>Contact</th>
                <th>Fee</th>
                <th>Doctor</th>
                <th>Prescription</th>
                <th>Visit Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                String doctor = (String) session.getAttribute("doctor");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "root");
                PreparedStatement ps = con.prepareStatement("SELECT * FROM addpatient WHERE consult_doctor=?");
                ps.setString(1, doctor);
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
            %>
            <tr>
                <td data-label="Patient ID"><%= rs.getInt("patient_id") %></td>
                <td data-label="Disease"><%= rs.getString("disease_description") %></td>
                <td data-label="Age"><%= rs.getInt("age") %></td>
                <td data-label="Contact"><%= rs.getString("contact_no") %></td>
                <td data-label="Fee"><%= rs.getString("fee_paid") %></td>
                <td data-label="Doctor"><%= rs.getString("consult_doctor") %></td>
                <td data-label="Prescription">
                    <% if("Pending".equals(rs.getString("prescription"))){ %>
                        <a href="Prescription.jsp?pid=<%= rs.getInt("patient_id") %>&date=<%= rs.getDate("visit_date") %>">
                            <i class="fas fa-plus-circle"></i> Add Prescription
                        </a>
                    <% } else { %>
                        <%= rs.getString("prescription") %>
                    <% } %>
                </td>
                <td data-label="Visit Date"><%= rs.getDate("visit_date") %></td>
            </tr>
            <% } con.close(); %>
        </tbody>
    </table>
</body>
</html>
