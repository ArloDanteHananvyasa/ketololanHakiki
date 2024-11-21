package com.example.t06.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JDBC implements UserRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<UserData> findAll() {
        List<UserData> results = jdbcTemplate.query("SELECT * FROM user_data", this::mapRowToUserData);

        return results;
    }

    private UserData mapRowToUserData(ResultSet resultSet, int rowNum) throws SQLException {
        return new UserData(
                resultSet.getString("userId"),
                resultSet.getString("name"),
                resultSet.getString("role"));
    }
}