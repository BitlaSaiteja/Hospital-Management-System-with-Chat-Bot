package com.hms.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ScheduleTimeTableServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String date = request.getParameter("t1");
        String slots = request.getParameter("t2");

        HttpSession session = request.getSession();
        String doctor = (String) session.getAttribute("doctor");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "root");

            PreparedStatement ps = con.prepareStatement("INSERT INTO timetable1(username, time_table, available_slots) VALUES (?, ?, ?)");
            ps.setString(1, doctor);
            ps.setString(2, date);
            ps.setString(3, slots);

            int i = ps.executeUpdate();

            if (i > 0) {
                response.sendRedirect("doctor/ScheduleTimeTable.jsp?msg=Timetable Scheduled Successfully");
            } else {
                response.sendRedirect("doctor/ScheduleTimeTable.jsp?msg=Failed to Schedule");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("doctor/ScheduleTimeTable.jsp?msg=Error Occurred");
        }
    }
}
