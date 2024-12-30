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
import java.util.*;

public class RecommendationEngine {
    private Connection conn;

    public RecommendationEngine(Connection conn) {
        this.conn = conn;
    }

    // Fetch recommendations based on user watch history
    public List<Map<String, String>> getRecommendations(int userId) throws SQLException {
        // Step 1: Fetch the user's watch history
        String historyQuery = "SELECT m.genre FROM movies m " +
                              "JOIN user_watch_history uwh ON m.id = uwh.movie_id " +
                              "WHERE uwh.user_id = ?";
        PreparedStatement historyStmt = conn.prepareStatement(historyQuery);
        historyStmt.setInt(1, userId);
        ResultSet historyRs = historyStmt.executeQuery();

        // Step 2: Analyze genre frequency
        Map<String, Integer> genreCounts = new HashMap<>();
        while (historyRs.next()) {
            String[] genres = historyRs.getString("genre").split(", ");
            for (String genre : genres) {
                genreCounts.put(genre, genreCounts.getOrDefault(genre, 0) + 1);
            }
        }

        // Step 3: Find the top genres
        List<String> favoriteGenres = new ArrayList<>();
        genreCounts.entrySet().stream()
            .sorted((e1, e2) -> e2.getValue().compareTo(e1.getValue())) // Sort by frequency
            .limit(3) // Consider top 3 genres
            .forEach(e -> favoriteGenres.add(e.getKey()));

        // Step 4: Fetch movies matching the favorite genres but exclude already watched movies
        String recommendationQuery = "SELECT * FROM movies WHERE id NOT IN ( " +
                                     "    SELECT movie_id FROM user_watch_history WHERE user_id = ? " +
                                     ") AND (";
        for (int i = 0; i < favoriteGenres.size(); i++) {
            recommendationQuery += "genre LIKE ?";
            if (i < favoriteGenres.size() - 1) {
                recommendationQuery += " OR ";
            }
        }
        recommendationQuery += ")";

        PreparedStatement recommendationStmt = conn.prepareStatement(recommendationQuery);
        recommendationStmt.setInt(1, userId); // Exclude watched movies
        for (int i = 0; i < favoriteGenres.size(); i++) {
            recommendationStmt.setString(i + 2, "%" + favoriteGenres.get(i) + "%");
        }

        ResultSet recommendationRs = recommendationStmt.executeQuery();

        // Step 5: Format recommendations
        List<Map<String, String>> recommendations = new ArrayList<>();
        while (recommendationRs.next()) {
            Map<String, String> movie = new HashMap<>();
            movie.put("title", recommendationRs.getString("title"));
            movie.put("genre", recommendationRs.getString("genre"));
            movie.put("duration", String.valueOf(recommendationRs.getInt("duration")));
            movie.put("poster_url", recommendationRs.getString("poster_url"));
            movie.put("synopsis", recommendationRs.getString("synopsis"));
            recommendations.add(movie);
        }

        return recommendations;
    }
}
