<%-- 
    Document   : login
    Created on : 31 Dec 2024, 5:04:56?am
    Author     : umaml
--%>

<%@ page import="java.sql.*" %>
<%@ page import="classes.JDBC" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Login</h2>
        <%
            String errorMessage = "";
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                JDBC db = new JDBC();
                if (db.isConnected) {
                    try {
                        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
                        PreparedStatement ps = db.conn.prepareStatement(query);
                        ps.setString(1, username);
                        ps.setString(2, password);
                        ResultSet rs = ps.executeQuery();

                        if (rs.next()) {
                            session.setAttribute("userId", rs.getInt("id"));
                            session.setAttribute("username", username);
                            response.sendRedirect("dashboard.jsp");
                        } else {
                            errorMessage = "Invalid username or password!";
                        }
                    } catch (Exception e) {
                        errorMessage = "Error: " + e.getMessage();
                    } finally {
                        db.disconnect();
                    }
                }
            }
        %>
        <% if (!errorMessage.isEmpty()) { %>
            <div class="alert alert-danger"><%= errorMessage %></div>
        <% } %>
        <form action="login.jsp" method="post">
            <div class="mb-3">
                <label>Username</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>
</body>
</html>
