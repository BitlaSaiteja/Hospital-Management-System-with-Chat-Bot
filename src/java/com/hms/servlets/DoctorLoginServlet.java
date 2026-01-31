package com.hms.servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class DoctorLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "root");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM adddoctor WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("doctor", username);
                response.sendRedirect("doctor/DoctorHome.jsp");
            } else {
                response.sendRedirect("DoctorLogin.jsp?msg=Invalid Credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
