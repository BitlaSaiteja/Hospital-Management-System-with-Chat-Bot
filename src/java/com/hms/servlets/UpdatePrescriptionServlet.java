package com.hms.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdatePrescriptionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String patientId = request.getParameter("pid");
        String visitDate = request.getParameter("date");
        String prescription = request.getParameter("prescription");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "root");

            PreparedStatement ps = con.prepareStatement(
                "UPDATE addpatient SET prescription=? WHERE patient_id=? AND visit_date=? AND prescription='Pending'"
            );
            ps.setString(1, prescription);
            ps.setInt(2, Integer.parseInt(patientId));
            ps.setDate(3, Date.valueOf(visitDate));

            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("doctor/ViewPatients.jsp?msg=Prescription updated");
            } else {
                response.sendRedirect("doctor/ViewPatients.jsp?msg=Prescription update failed");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("doctor/ViewPatients.jsp?msg=Error occurred");
        }
    }
}
