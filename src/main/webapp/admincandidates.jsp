<%@page import="com.conn.DBConnect"%>
<%@page import="com.entity.Candidate"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CandidateDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Candidates</title>
<link rel="stylesheet" href = "css/style.css">
</head>
<body>
<%@ include file = "adminnavbar.jsp" %>
<%@ include file = "checkadmincookie.jsp" %>
<div class = "center">
<div class="container">
  <h1>Manage Candidates</h1>
  <%@ include file = "msgcookie.jsp" %>
  <%
    CandidateDAO dao = new CandidateDAO(DBConnect.getConn());
    List<Candidate> list = dao.getCandidates();
  %>
  <%
  if(msg != null){ %>
    <p style="color:green"><%= msg %></p>
  <% } %>
  <%
  if(fmsg != null){ %>
    <p style="color:red"><%= fmsg %></p>
  <% } %>
  <table>
    <tr>
      <th>Id</th>
      <th>Name</th>
      <th>Post</th>
      <th>Votes</th>
      <th>Actions</th>
    </tr>
    <%
      for(Candidate c : list){
    %>
    <tr>
      <td><%= c.getId() %></td>
      <td><%= c.getCandidate() %></td>
      <td><%= c.getPost() %></td>
      <td><%= c.getVotes() %></td>
      <td>
        <form action="editCandidate.jsp" method="get" style="display:inline">
          <input type="hidden" name="id" value="<%= c.getId() %>">
          <input type="hidden" name="name" value="<%= c.getCandidate() %>">
          <input type="hidden" name="post" value="<%= c.getPost() %>">
          <input type="submit" value="Edit" class="btn">
        </form>
      </td>
    </tr>
    <%
      }
    %>
  </table>
</div>
</div>
<%@ include file = "footer.jsp" %>
</body>
</html>

