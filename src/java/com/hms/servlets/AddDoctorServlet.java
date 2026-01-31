package com.hms.servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddDoctorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "root");
            PreparedStatement ps = con.prepareStatement("INSERT INTO adddoctor VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, request.getParameter("username"));
            ps.setString(2, request.getParameter("password"));
            ps.setString(3, request.getParameter("emailid"));
            ps.setString(4, request.getParameter("contact_no"));
            ps.setString(5, request.getParameter("qualification"));
            ps.setString(6, request.getParameter("experience_details"));
            ps.setString(7, request.getParameter("hospital_name"));
            ps.setString(8, request.getParameter("address"));
            ps.setString(9, request.getParameter("speciality"));
            ps.executeUpdate();
            response.sendRedirect("admin/AddDoctor.jsp?msg=Doctor Added Successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/AddDoctor.jsp?msg=Error Occurred");
        }
    }
}
