package com.hms.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if ("admin".equals(username) && "admin".equals(password)) {
            response.sendRedirect("admin/AdminHome.jsp");
        } else {
            response.sendRedirect("AdminLogin.jsp?msg=Invalid Credentials");
        }
    }
}