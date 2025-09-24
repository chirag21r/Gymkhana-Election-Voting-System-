package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.conn.DBConnect;
import java.sql.Connection;

@WebServlet("/debug")
public class DebugServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("<html><head><title>Debug Information</title></head><body>");
        out.println("<h1>IIIT Kalyani Gymkhana Voting System - Debug Info</h1>");
        
        // Environment Variables
        out.println("<h2>Environment Variables:</h2>");
        out.println("<p><strong>DB_URL:</strong> " + System.getenv("DB_URL") + "</p>");
        out.println("<p><strong>DB_USER:</strong> " + System.getenv("DB_USER") + "</p>");
        out.println("<p><strong>DB_PASS:</strong> " + (System.getenv("DB_PASS") != null ? "***SET***" : "NULL") + "</p>");
        out.println("<p><strong>PORT:</strong> " + System.getenv("PORT") + "</p>");
        
        // Database Connection Test
        out.println("<h2>Database Connection Test:</h2>");
        try {
            Connection conn = DBConnect.getConn();
            if (conn != null && !conn.isClosed()) {
                out.println("<p style='color: green;'><strong>✅ Database connection successful!</strong></p>");
                out.println("<p><strong>Database URL:</strong> " + conn.getMetaData().getURL() + "</p>");
                out.println("<p><strong>Database Product:</strong> " + conn.getMetaData().getDatabaseProductName() + "</p>");
                out.println("<p><strong>Database Version:</strong> " + conn.getMetaData().getDatabaseProductVersion() + "</p>");
                conn.close();
            } else {
                out.println("<p style='color: red;'><strong>❌ Database connection failed!</strong></p>");
            }
        } catch (Exception e) {
            out.println("<p style='color: red;'><strong>❌ Database connection error:</strong></p>");
            out.println("<pre>" + e.getMessage() + "</pre>");
            e.printStackTrace();
        }
        
        // System Properties
        out.println("<h2>System Properties:</h2>");
        out.println("<p><strong>Java Version:</strong> " + System.getProperty("java.version") + "</p>");
        out.println("<p><strong>OS Name:</strong> " + System.getProperty("os.name") + "</p>");
        out.println("<p><strong>User Timezone:</strong> " + System.getProperty("user.timezone") + "</p>");
        
        out.println("</body></html>");
    }
}
