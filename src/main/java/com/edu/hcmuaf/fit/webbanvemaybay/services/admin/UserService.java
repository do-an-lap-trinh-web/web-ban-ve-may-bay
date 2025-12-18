package com.edu.hcmuaf.fit.webbanvemaybay.services.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DBContext;
import com.edu.hcmuaf.fit.webbanvemaybay.dao.admin.UserDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;

import java.util.List;

public class UserService {

    public List<User> getAllUser() {
        UserDAO userDAO = new UserDAO();
        return userDAO.getListUser();
    }

}
