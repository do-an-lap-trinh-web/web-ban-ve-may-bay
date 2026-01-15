package com.edu.hcmuaf.fit.webbanvemaybay.services.auth;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.UserDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.GuiMail;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.HashPassword;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.KiemTraThongTinDangKy;

import java.time.LocalDateTime;
import java.util.Random;

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

    public boolean isUserExist(String username) {
        UserDAO userDAO = new UserDAO();
        return userDAO.isUserExist(username);
    }

    public String guiMaXacThuc(String username, String email) {
        String message = "";
        Random rd = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= 5; i++) {
            sb.append(rd.nextInt(11));
        }
        boolean isGuiMail = GuiMail.guiMaXacThuc(email, sb.toString());
        if (isGuiMail) {

            UserDAO userDAO = new UserDAO();
            boolean isThemMaXacThuc = userDAO.themMaXacThuc(username, sb.toString(), LocalDateTime.now().plusMinutes(5));
            if (isThemMaXacThuc) {
                message = "đã gửi mã xác thực, hãy kiểm tra email";
            } else {
                message = "lỗi hệ thống";
            }
        } else {
            message = "gửi mail thất bại do email không hợp lệ hoặc không tồn tại";
        }
        return message;
    }
}
