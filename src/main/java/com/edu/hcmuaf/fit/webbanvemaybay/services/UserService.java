package com.edu.hcmuaf.fit.webbanvemaybay.services;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.UserDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;

public class UserService {
    public User getUserById(String id) {
        UserDAO userDAO = new UserDAO();
        return userDAO.getUserById(id);
    }
}
