
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
<title>Admin Dashboard - IIIT Kalyani Gymkhana 2024</title>
<link rel="stylesheet" href = "css/style.css">

</head>
<body>
<%@ include file = "adminnavbar.jsp" %>
<%@ include file = "checkadmincookie.jsp" %>
<%@ include file = "msgcookie.jsp" %>

<div class = "center">
<div class="container">








<!--  -->
<div class="container" id="cb" >
<h1>All Candidates Votes</h1>
<style>
.votes-table { width:100%; border-collapse: collapse; }
.votes-table th, .votes-table td { border:1px solid #e5e7eb; padding:10px; text-align:left; }
.bar { background:#e5e7eb; border-radius:6px; height:10px; overflow:hidden; }
.bar > span { display:block; height:100%; background:#10b981; }
</style>

<%


CandidateDAO dao = new CandidateDAO(DBConnect.getConn());		
List<Candidate> list = dao.getCandidates();
int total = 0; for(Candidate c : list){ total += c.getVotes(); }

%>
<table class="votes-table">
  <tr>
    <th>#</th>
    <th>Candidate</th>
    <th>Post</th>
    <th>Votes</th>
    <th>Share</th>
  </tr>
  <%
  int idx = 1;
  for(Candidate l : list){
    double pct = total == 0 ? 0 : (l.getVotes() * 100.0 / total);
  %>
  <tr>
    <td><%= idx++ %></td>
    <td><%= l.getCandidate() %></td>
    <td><%= l.getPost() %></td>
    <td><b><%= l.getVotes() %></b></td>
    <td>
      <div class="bar"><span style="width:<%= String.format(java.util.Locale.US, "%.2f", pct) %>%"></span></div>
      <small><%= String.format(java.util.Locale.US, "%.2f", pct) %>%</small>
    </td>
  </tr>
  <%
  }
  %>
  <tr>
    <th colspan="3">Total</th>
    <th colspan="2"><%= total %></th>
  </tr>
</table>
%>
	
		
		
		
		
	
	
</div>	

<!--  -->

</div>
</div>

</body>
</html>
<%@ include file = "footer.jsp" %>