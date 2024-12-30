<%-- 
    Document   : index
    Created on : 31 Dec 2024, 5:13:35?am
    Author     : umaml
--%>

<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Recommender</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 100px;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-5">Welcome to Movie Recommender</h1>
        
        <div class="row justify-content-center">
            <%
                // Check if the user is logged in
                Integer userId = (Integer) session.getAttribute("userId");
                String username = (String) session.getAttribute("username");

                if (userId != null) {
            %>
            <!-- User is logged in -->
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <h4>Hi, <%= username %>!</h4>
                    <p>Choose an option below:</p>
                    <a href="recommend.jsp" class="btn btn-primary btn-block mb-3">Get Recommendations</a>
                    <a href="watch_history.jsp" class="btn btn-secondary btn-block mb-3">View Watch History</a>
                    <a href="movies.jsp" class="btn btn-success btn-block mb-3">Manage Movies</a>
                    <a href="logout.jsp" class="btn btn-danger btn-block">Logout</a>
                </div>
            </div>
            <%
                } else {
            %>
            <!-- User is not logged in -->
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <h4>Start Your Journey</h4>
                    <p>Log in to explore personalized recommendations and movie history.</p>
                    <a href="login.jsp" class="btn btn-primary btn-block">Login</a>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
