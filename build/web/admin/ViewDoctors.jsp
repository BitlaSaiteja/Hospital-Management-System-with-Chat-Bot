<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Doctors</title>
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
            max-width: 1000px;
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
            font-weight: 600;
        }

        tr:hover {
            background-color: #f1faff;
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
    <h2><i class="fas fa-user-md"></i> Doctors List</h2>
    <table>
        <thead>
            <tr>
                <th>Username</th>
                <th>Email</th>
                <th>Contact</th>
                <th>Qualification</th>
                <th>Experience</th>
                <th>Hospital</th>
                <th>Address</th>
                <th>Speciality</th>
            </tr>
        </thead>
        <tbody>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "root");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM adddoctor");
            while(rs.next()) {
        %>
            <tr>
                <td data-label="Username"><%= rs.getString("username") %></td>
                <td data-label="Email"><%= rs.getString("emailid") %></td>
                <td data-label="Contact"><%= rs.getString("contact_no") %></td>
                <td data-label="Qualification"><%= rs.getString("qualification") %></td>
                <td data-label="Experience"><%= rs.getString("experience_details") %></td>
                <td data-label="Hospital"><%= rs.getString("hospital_name") %></td>
                <td data-label="Address"><%= rs.getString("address") %></td>
                <td data-label="Speciality"><%= rs.getString("speciality") %></td>
            </tr>
        <%
            }
            con.close();
        %>
        </tbody>
    </table>
</body>
</html>
