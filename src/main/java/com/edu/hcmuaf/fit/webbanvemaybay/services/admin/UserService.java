package com.edu.hcmuaf.fit.webbanvemaybay.services.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DBContext;
import com.edu.hcmuaf.fit.webbanvemaybay.dao.admin.UserDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.models.ThongTinNguoiDung;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.HashPassword;

import java.util.List;

public class UserService {

    // hàm lấy tất các user trong database
    public List<User> getAllUser() {
        UserDAO userDAO = new UserDAO();
        return userDAO.getListUser();
    }


    // hàm thêm một user vào database
    public String addUser(User user) {
        UserDAO userDAO = new UserDAO();
        user.setPassword(HashPassword.hashPassword(user.getPassword()));
        return userDAO.addUser(user);
    }

    // hàm xoá user trong database
    public String removeUser(String id) {
        UserDAO userDAO = new UserDAO();
        return userDAO.removeUser(id);
    }

    public User getUserById(int userId) {
        UserDAO userDAO = new UserDAO();
        return userDAO.getUserById(userId);
    }

    // Hàm lấy thông tin chi tiết
    public ThongTinNguoiDung getChiTietNguoiDung(int userId) {
        UserDAO userDAO = new UserDAO();
        return userDAO.getChiTietNguoiDung(userId);
    }

    public void updateUserProfile(User user, ThongTinNguoiDung details) {
        UserDAO userDAO = new UserDAO();
        userDAO.updateUser(user, details);
    }

    public List<User> getUserByInput(String input) {
        UserDAO userDAO = new UserDAO();
        return userDAO.getUserByInput(input);
    }
}
