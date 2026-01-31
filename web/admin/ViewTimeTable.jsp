<%@ page import="java.sql.*" %>
<html>
<head><title>View Doctor Timetable</title></head>
<body>
<h2>Doctor Timetables</h2>
<table border="1">
    <tr>
        <th>Doctor</th><th>Date</th><th>Slots</th>
    </tr>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "root");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM timetable1");
    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getString("username") %></td>
        <td><%= rs.getString("time_table") %></td>
        <td><%= rs.getString("available_slots") %></td>
    </tr>
<% } con.close(); %>
</table>
</body>
</html>
