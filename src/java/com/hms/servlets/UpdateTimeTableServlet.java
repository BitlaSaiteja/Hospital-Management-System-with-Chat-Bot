package com.hms.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateTimeTableServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String date = request.getParameter("t1");
        String slots = request.getParameter("t2");

        HttpSession session = request.getSession();
        String doctor = (String) session.getAttribute("doctor");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "root");

            PreparedStatement ps = con.prepareStatement(
                "UPDATE timetable1 SET time_table=?, available_slots=? WHERE username=?"
            );
            ps.setString(1, date);
            ps.setString(2, slots);
            ps.setString(3, doctor);

            int i = ps.executeUpdate();

            if (i > 0) {
                response.sendRedirect("doctor/UpdateTimeTable.jsp?msg=Timetable Updated Successfully");
            } else {
                response.sendRedirect("doctor/UpdateTimeTable.jsp?msg=Failed to Update");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("doctor/UpdateTimeTable.jsp?msg=Error Occurred");
        }
    }
}
