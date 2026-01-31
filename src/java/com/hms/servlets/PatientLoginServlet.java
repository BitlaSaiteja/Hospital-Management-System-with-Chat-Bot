package com.hms.servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class PatientLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientId = request.getParameter("patient_id");
        boolean isValid = false;

        try {
            Class.forName("com.mysql.jdbc.Driver"); // Compatible with MySQL 5.1
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "root");

            PreparedStatement ps = con.prepareStatement("SELECT patient_id FROM addpatient WHERE patient_id = ?");
            ps.setInt(1, Integer.parseInt(patientId));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                isValid = true;
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("patient", patientId);
            response.sendRedirect("patient/PatientHome.jsp");
        } else {
            request.setAttribute("error", "Invalid Patient ID");
            RequestDispatcher rd = request.getRequestDispatcher("PatientLogin.jsp");
            rd.forward(request, response);
        }
    }
}
