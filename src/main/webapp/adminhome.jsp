
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
<link rel="icon" href="image/user.png" type="image/png">

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

// Build joint leaders (all candidates tied for 1st) per post
java.util.Map<String, Integer> maxByPost = new java.util.HashMap<String, Integer>();
java.util.Map<String, java.util.List<Candidate>> leadersByPost = new java.util.HashMap<String, java.util.List<Candidate>>();
for (Candidate c : list) {
    String post = c.getPost();
    if(post == null) post = "";
    Integer curMax = maxByPost.get(post);
    int v = c.getVotes();
    if (curMax == null || v > curMax) {
        maxByPost.put(post, v);
        java.util.List<Candidate> l = new java.util.ArrayList<Candidate>();
        l.add(c);
        leadersByPost.put(post, l);
    } else if (v == curMax) {
        leadersByPost.get(post).add(c);
    }
}

%>
<h2>Category Leaders</h2>
<table class="votes-table">
  <tr>
    <th>Post</th>
    <th>Leader</th>
    <th>Votes</th>
  </tr>
  <%
    for (java.util.Map.Entry<String, java.util.List<Candidate>> e : leadersByPost.entrySet()) {
      String post = e.getKey();
      java.util.List<Candidate> leaders = e.getValue();
      int mv = maxByPost.get(post);
      StringBuilder names = new StringBuilder();
      for (int i = 0; i < leaders.size(); i++) {
        if (i > 0) names.append(", ");
        names.append(leaders.get(i).getCandidate());
      }
  %>
  <tr>
    <td><%= (post == null || post.isEmpty()) ? "(Unspecified)" : post %></td>
    <td><b><%= names.toString() %></b></td>
    <td><%= mv %></td>
  </tr>
  <% } %>
</table>

<h2>All Candidates</h2>
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