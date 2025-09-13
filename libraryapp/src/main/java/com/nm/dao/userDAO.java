package com.nm.dao;



import com.nm.model.user;
import java.sql.*;

public class userDAO {
	 private String jdbcURL = "jdbc:mysql://localhost:3306/librarydb";
	 private String jdbcUsername = "root";
	 private String jdbcPassword = "Nmsql_006";

    public userDAO() {}

    protected Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public boolean registerUser(user user) {
        String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
        try (Connection con = getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public user loginUser(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection con = getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new user(rs.getInt("id"), rs.getString("name"), email, password);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
