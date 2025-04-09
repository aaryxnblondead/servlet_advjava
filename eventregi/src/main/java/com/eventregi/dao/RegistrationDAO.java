package com.eventregi.dao;

import com.eventregi.model.Registration;

import java.sql.*;

public class RegistrationDAO {
    
    public boolean createRegistration(Registration registration) {
        String sql = "INSERT INTO registrations (event_id, name, email, phone) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, registration.getEventId());
            pstmt.setString(2, registration.getName());
            pstmt.setString(3, registration.getEmail());
            pstmt.setString(4, registration.getPhone());
            
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
