<%-- 
    Document   : movies
    Created on : 31 Dec 2024, 6:30:00 AM
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
    <title>Manage Movies</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: #ffffff;
        }
        .container {
            background-color: #1e1e1e;
            padding: 20px;
            border-radius: 8px;
        }
        .movie-card {
            background-color: #292929;
            border: none;
            border-radius: 5px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.5);
            margin-bottom: 20px;
        }
        .movie-card img {
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            height: 300px;
            object-fit: cover;
        }
        .movie-card-body {
            padding: 15px;
        }
        .movie-title {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .btn {
            background-color: #007bff;
            color: #ffffff;
            border: none;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-danger {
            background-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #a71d2a;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Manage Movies</h1>

        <div class="my-4">
            <form method="POST" action="movies.jsp">
                <div class="row">
                    <div class="col-md-3">
                        <input type="text" name="title" class="form-control bg-dark text-white" placeholder="Movie Title" required>
                    </div>
                    <div class="col-md-3">
                        <input type="text" name="genre" class="form-control bg-dark text-white" placeholder="Genre (comma-separated)" required>
                    </div>
                    <div class="col-md-2">
                        <input type="number" name="duration" class="form-control bg-dark text-white" placeholder="Duration (mins)" required>
                    </div>
                    <div class="col-md-3">
                        <input type="text" name="poster_url" class="form-control bg-dark text-white" placeholder="Poster URL" required>
                    </div>
                    <div class="col-md-6 mt-2">
                        <textarea name="synopsis" class="form-control bg-dark text-white" placeholder="Synopsis" rows="2" required></textarea>
                    </div>
                    <div class="col-md-2 mt-2">
                        <button type="submit" name="action" value="add" class="btn btn-success w-100">Add Movie</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="row">
            <%
                Connection conn = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies_db", "root", "");

                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        String action = request.getParameter("action");
                        if ("add".equals(action)) {
                            String title = request.getParameter("title");
                            String genre = request.getParameter("genre");
                            int duration = Integer.parseInt(request.getParameter("duration"));
                            String posterUrl = request.getParameter("poster_url");
                            String synopsis = request.getParameter("synopsis");

                            PreparedStatement stmt = conn.prepareStatement(
                                "INSERT INTO movies (title, genre, duration, poster_url, synopsis) VALUES (?, ?, ?, ?, ?)");
                            stmt.setString(1, title);
                            stmt.setString(2, genre);
                            stmt.setInt(3, duration);
                            stmt.setString(4, posterUrl);
                            stmt.setString(5, synopsis);
                            stmt.executeUpdate();
                        } else if ("delete".equals(action)) {
                            int id = Integer.parseInt(request.getParameter("id"));
                            PreparedStatement stmt = conn.prepareStatement("DELETE FROM movies WHERE id = ?");
                            stmt.setInt(1, id);
                            stmt.executeUpdate();
                        } else if ("add_to_history".equals(action)) {
                            int movieId = Integer.parseInt(request.getParameter("id"));
                            PreparedStatement stmt = conn.prepareStatement(
                                "INSERT INTO user_watch_history (user_id, movie_id) VALUES (?, ?)");
                            stmt.setInt(1, userId);
                            stmt.setInt(2, movieId);
                            stmt.executeUpdate();
                        }
                    }

                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM movies");
                    while (rs.next()) {
            %>
            <div class="col-md-4">
                <div class="movie-card">
                    <img src="<%= rs.getString("poster_url") %>" alt="<%= rs.getString("title") %>" class="w-100">
                    <div class="movie-card-body">
                        <p class="movie-title"><%= rs.getString("title") %></p>
                        <p><strong>Genre:</strong> <%= rs.getString("genre") %></p>
                        <p><strong>Duration:</strong> <%= rs.getInt("duration") %> mins</p>
                        <p><%= rs.getString("synopsis") %></p>
                        <div class="d-flex justify-content-between">
                            <form method="POST" action="movies.jsp" class="d-inline">
                                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                <button type="submit" name="action" value="add_to_history" class="btn btn-primary btn-sm">Add to Watch History</button>
                            </form>
                            <form method="POST" action="movies.jsp" class="d-inline">
                                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                <button type="submit" name="action" value="delete" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </div>
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

        <a href="dashboard.jsp" class="btn btn-secondary mt-4">Back to Dashboard</a>
    </div>
</body>
</html>
