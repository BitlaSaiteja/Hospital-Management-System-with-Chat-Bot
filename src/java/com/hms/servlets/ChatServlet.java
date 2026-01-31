package com.hms.servlets;

import java.io.File;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

public class ChatServlet extends HttpServlet {
    
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
        response.setContentType("text/plain");
        String query = request.getParameter("query");
        
        if (query == null || query.trim().equals("")) {
            response.getWriter().write("Please ask something...");
            return;
        }

        
        if (query.toLowerCase().contains("fever")) {
            response.getWriter().write("Dr. Smith is available for fever cases.\n");
        } else {
            response.getWriter().write("Sorry, no doctor matched your query.\n");
        }
    }
}
