package com.example.t06.User;

import java.util.List;

public interface UserRepository {
    List<UserData> findAll();
}