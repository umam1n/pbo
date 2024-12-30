/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author umaml
 */
package classes;

import java.sql.*;

public class JDBC {
    // Connection properties
    private static final String DB_URL = "jdbc:mysql://localhost:3306/movies_db"; // Update "movies_db" with your database name
    private static final String DB_USER = "root"; // Your database username
    private static final String DB_PASSWORD = ""; // Your database password
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver"; // MySQL Driver

    public Connection conn; // Database connection object
    public Statement stmt; // Statement for queries
    public boolean isConnected; // Connection status
    public String message; // Connection message (success or error)

    // Constructor
    public JDBC() {
        try {
            // Load the JDBC driver
            Class.forName(JDBC_DRIVER);
            
            // Establish the connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            // Create a statement object
            stmt = conn.createStatement();
            
            // Set connection status
            isConnected = true;
            message = "Connected to the database successfully.";
        } catch (Exception e) {
            // Handle errors
            isConnected = false;
            message = "Error connecting to the database: " + e.getMessage();
        }
    }

    // Run a query (INSERT, UPDATE, DELETE)
    public int runQuery(String query) {
        try {
            return stmt.executeUpdate(query);
        } catch (SQLException e) {
            System.out.println("Error executing query: " + e.getMessage());
            return -1;
        }
    }

    // Execute SELECT query
    public ResultSet getData(String query) {
        try {
            return stmt.executeQuery(query);
        } catch (SQLException e) {
            System.out.println("Error fetching data: " + e.getMessage());
            return null;
        }
    }

    // Close the connection
    public void disconnect() {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
            message = "Disconnected from the database.";
        } catch (SQLException e) {
            message = "Error disconnecting from the database: " + e.getMessage();
        }
    }
}
