<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Candidate</title>
<link rel="stylesheet" href = "css/style.css">
</head>
<body>
<%@ include file = "adminnavbar.jsp" %>
<%@ include file = "checkadmincookie.jsp" %>
<div class="center">
  <div class="container">
    <h1>Edit Candidate</h1>
    <form action="updateCandidate" method="post">
      <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
      Name:
      <input type="text" name="name" value="<%= request.getParameter("name") %>" required><br><br>
      Post:
      <input type="text" name="post" value="<%= request.getParameter("post") == null ? "" : request.getParameter("post") %>" placeholder="e.g., President, Secretary" required><br><br>
      <input type="submit" value="Save" class="btn">
    </form>
  </div>
</div>
<%@ include file = "footer.jsp" %>
</body>
</html>

