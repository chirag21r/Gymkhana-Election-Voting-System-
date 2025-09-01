package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.DBConnect;
import com.dao.CandidateDAO;

@MultipartConfig
@WebServlet("/updateCandidate")
public class UpdateCandidate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            String name = request.getParameter("name");
            String post = request.getParameter("post");
            int id = Integer.parseInt(idStr);

            CandidateDAO dao = new CandidateDAO(DBConnect.getConn());
            int res = dao.updateCandidate(id, name.trim(), post == null ? "" : post.trim());

            Cookie c = new Cookie(res > 0 ? "cndupdated" : "cndupdfail", res > 0 ? "cndupdated" : "cndupdfail");
            c.setMaxAge(10);
            response.addCookie(c);
            response.sendRedirect("admincandidates.jsp");
        } catch (Exception e) {
            Cookie c = new Cookie("cndupdfail", "cndupdfail");
            c.setMaxAge(10);
            response.addCookie(c);
            response.sendRedirect("admincandidates.jsp");
        }
    }
}

