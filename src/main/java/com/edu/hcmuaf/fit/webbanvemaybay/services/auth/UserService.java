package com.edu.hcmuaf.fit.webbanvemaybay.services.auth;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.UserDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.HashPassword;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.KiemTraThongTinDangKy;

public class UserService {


    // thêm user
    public String register(User user) {
        UserDAO userDAO = new UserDAO();
        KiemTraThongTinDangKy kiemTraThongTinDangKy = new KiemTraThongTinDangKy();
        String message = kiemTraThongTinDangKy.kiemTraThongTinDangKy(user);
        if (!message.equals("200")) {
            return message;
        }
        String passwordHash = HashPassword.hashPassword(user.getPassword());
        user.setPassword(passwordHash);
        return userDAO.addUser(user);
    }

    public User login(String username, String password) {
        UserDAO userDAO = new UserDAO();
        String passwordHash = HashPassword.hashPassword(password);
        User user = userDAO.kiemTraUser(username, passwordHash);
        if (user != null) {
            user.setCodeXacThuc(null);
            user.setHangXacThuc(null);
            user.setPassword(null);
            return user;
        }
        return null;
    }
}
