package com.hms.servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddPatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "root");
            PreparedStatement ps = con.prepareStatement("INSERT INTO addpatient VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, Integer.parseInt(request.getParameter("patient_id")));
            ps.setString(2, request.getParameter("disease_description"));
            ps.setInt(3, Integer.parseInt(request.getParameter("age")));
            ps.setString(4, request.getParameter("contact_no"));
            ps.setString(5, request.getParameter("fee_paid"));
            ps.setString(6, request.getParameter("consult_doctor"));
            ps.setString(7, request.getParameter("prescription"));
            ps.setString(8, request.getParameter("visit_date"));
            ps.executeUpdate();
            response.sendRedirect("admin/AddPatient.jsp?msg=Patient Added Successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/AddPatient.jsp?msg=Error Occurred");
        }
    }
}
