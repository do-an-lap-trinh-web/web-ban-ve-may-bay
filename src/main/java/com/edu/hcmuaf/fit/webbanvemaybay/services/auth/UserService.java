package com.edu.hcmuaf.fit.webbanvemaybay.services.auth;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.admin.UserDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
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
        return userDAO.addUser(user);
    }
}
