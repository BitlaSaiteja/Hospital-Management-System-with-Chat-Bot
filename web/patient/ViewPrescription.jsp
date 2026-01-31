<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>

<%
    String patientId = (String) session.getAttribute("patient");
    if (patientId == null) {
        response.sendRedirect("patient_login.jsp");
        return;
    }
%>

<html>
<head>
    <title>View Prescription</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #fdfbfb, #ebedee);
            padding: 40px;
            text-align: center;
        }
        .container {
            width: 80%;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #5dade2;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>🩺 Your Prescriptions</h2>
    <table>
        <tr>
            <th>Visit Date</th>
            <th>Disease Description</th>
            <th>Consulted Doctor</th>
            <th>Prescription</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "root");
                PreparedStatement ps = con.prepareStatement("SELECT visit_date, disease_description, consult_doctor, prescription FROM addpatient WHERE patient_id = ?");
                ps.setString(1, patientId);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getDate("visit_date") %></td>
                        <td><%= rs.getString("disease_description") %></td>
                        <td><%= rs.getString("consult_doctor") %></td>
                        <td><%= rs.getString("prescription") %></td>
                    </tr>
        <%
                }

                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='4' style='color:red;'>Error fetching data: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</div>

</body>
</html>
