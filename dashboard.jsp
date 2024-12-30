<%-- 
    Document   : dashboard
    Created on : 31 Dec 2024, 5:05:16?am
    Author     : umaml
--%>

<%@ page import="java.sql.*" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Welcome, <%= session.getAttribute("username") %></h1>
        <div class="d-flex justify-content-between">
            <a href="recommend.jsp" class="btn btn-primary">Get Recommendations</a>
            <a href="watch_history.jsp" class="btn btn-secondary">View Watch History</a>
            <a href="movies.jsp" class="btn btn-success">Manage Movies</a>
            <a href="logout.jsp" class="btn btn-danger">Logout</a>
        </div>
    </div>
</body>
</html>
