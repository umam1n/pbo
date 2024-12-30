<%-- 
    Document   : watch_history
    Created on : 31 Dec 2024, 5:06:53?am
    Author     : umaml
--%>

<%@ page import="java.sql.*" %>
<%@ page import="classes.JDBC" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Watch History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">User Watch History</h1>
        <table class="table table-bordered mt-4">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Movie Title</th>
                    <th>Genre</th>
                    <th>Duration (mins)</th>
                    <th>Watched Date</th>
                    <th>Synopsis</th>
                </tr>
            </thead>
            <tbody>
                <%
                    JDBC db = new JDBC();
                    if (db.isConnected) {
                        try {
                            // Replace '1' with dynamic user ID if needed
                            String query = "SELECT u.username AS user_name, m.title AS movie_title, m.genre AS movie_genre, " +
                                           "m.duration AS movie_duration, m.synopsis AS movie_synopsis, uwh.watched_at AS watched_date " +
                                           "FROM user_watch_history uwh " +
                                           "JOIN users u ON uwh.user_id = u.id " +
                                           "JOIN movies m ON uwh.movie_id = m.id " +
                                           "WHERE u.id = ? ORDER BY uwh.watched_at DESC";
                            PreparedStatement ps = db.conn.prepareStatement(query);
                            ps.setInt(1, 1); // Replace with dynamic user ID from session
                            ResultSet rs = ps.executeQuery();

                            while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("user_name") %></td>
                    <td><%= rs.getString("movie_title") %></td>
                    <td><%= rs.getString("movie_genre") %></td>
                    <td><%= rs.getInt("movie_duration") %></td>
                    <td><%= rs.getTimestamp("watched_date") %></td>
                    <td><%= rs.getString("movie_synopsis") %></td>
                </tr>
                <%
                            }
                        } catch (Exception e) {
                            out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                        } finally {
                            db.disconnect();
                        }
                    } else {
                        out.println("<tr><td colspan='6'>Error: " + db.message + "</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
