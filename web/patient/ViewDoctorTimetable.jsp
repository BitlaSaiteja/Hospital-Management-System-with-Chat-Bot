<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Timetables</title>
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
            max-width: 900px;
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
    <h2><i class="fas fa-calendar-alt"></i> View Doctor Timetable</h2>
    <table>
        <thead>
            <tr>
                <th>Doctor</th>
                <th>Date</th>
                <th>Available Slots</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "root");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM timetable1");

                while (rs.next()) {
        %>
            <tr>
                <td data-label="Doctor"><%= rs.getString("username") %></td>
                <td data-label="Date"><%= rs.getString("time_table") %></td>
                <td data-label="Available Slots"><%= rs.getString("available_slots") %></td>
            </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
        %>
            <tr>
                <td colspan="3" style="color:red; text-align:center;">Error loading data</td>
            </tr>
        <%
                e.printStackTrace();
            }
        %>
        </tbody>
    </table>
</body>
</html>
