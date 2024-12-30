<%-- 
    Document   : recommend.jsp
    Created on : 31 Dec 2024, 5:05:41?am
    Author     : umaml
--%>
<%@ page import="classes.RecommendationEngine" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Movie Recommendations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Recommended Movies for You</h1>
        <div class="row mt-4">
            <%
                Connection conn = null;
                try {
                    // Connect to the database
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies_db", "root", "");

                    // Create the recommendation engine
                    RecommendationEngine engine = new RecommendationEngine(conn);

                    // Get recommendations for the logged-in user
                    int userId = (Integer) session.getAttribute("userId");
                    List<Map<String, String>> recommendations = engine.getRecommendations(userId);

                    // Display recommendations
                    for (Map<String, String> movie : recommendations) {
            %>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="<%= movie.get("poster_url") %>" class="card-img-top" alt="<%= movie.get("title") %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= movie.get("title") %></h5>
                        <p class="card-text"><%= movie.get("synopsis") %></p>
                        <p><strong>Genre:</strong> <%= movie.get("genre") %></p>
                        <p><strong>Duration:</strong> <%= movie.get("duration") %> mins</p>
                    </div>
                </div>
            </div>
            <%
                    }
                } catch (Exception e) {
                    out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
                } finally {
                    if (conn != null) {
                        try {
                            conn.close();
                        } catch (SQLException ignore) {}
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
