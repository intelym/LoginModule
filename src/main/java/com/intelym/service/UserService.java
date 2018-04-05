package com.intelym.service;

import com.intelym.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
