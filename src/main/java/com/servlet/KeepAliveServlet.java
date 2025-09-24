package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet; // Commented out since @WebServlet is disabled
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// COMMENTED OUT - KeepAlive functionality disabled to avoid hitting Render every 5 minutes
// @WebServlet("/keepalive")
public class KeepAliveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        
        PrintWriter out = response.getWriter();
        
        // Simple JSON response with timestamp
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        String jsonResponse = String.format(
            "{\"status\":\"alive\",\"timestamp\":\"%s\",\"service\":\"IIIT Kalyani Gymkhana Voting System\"}", 
            timestamp
        );
        
        out.println(jsonResponse);
    }
    
    protected void doHead(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Handle HEAD requests for health checks
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
