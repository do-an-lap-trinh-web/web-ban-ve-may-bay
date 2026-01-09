package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import org.jdbi.v3.core.Jdbi;

public class UserDAO extends DBContext {

    // tạo user mới và db
//    public String addUser(User user) {
//        try {
//            Jdbi jdbi = get();
//
//            //  kiểm tra xem có user trong db chưa
//            int isUser = jdbi.withHandle(h -> {
//                String q = "select count(*) from users where username = :username";
//                return h.createQuery(q).bind("username", user.getUsername()).mapTo(Integer.class).one();
//            });
//            if (isUser == 0) {
//                int soDong = jdbi.withHandle(h -> {
//                    String q = "";
//                    h.createUpdate(q);
//                })
//            }
//
//        }
//    }


    public String addUser(User user) {
        try {
            Jdbi jdbi = get();
            boolean isUserInDb = jdbi.withHandle(h -> {
                return h.createQuery("select count(*) from users where username=:username").bind("username", user.getUsername()).mapTo(Integer.class).one() > 0;
            });
            if (isUserInDb) {
                return "username đã tồn tại";
            }
            int res = jdbi.withHandle(h -> {
                return h.createUpdate("insert into users (id, username, password, so_dien_thoai, email, code_xac_thuc, hang_xac_thuc)" +
                        " values (:id, :username, :password, :soDienThoai, :email, :codeXacThuc, :hangXacThuc)").bindBean(user).executeAndReturnGeneratedKeys().mapTo(Integer.class).one();
            });
            jdbi.withHandle(h -> {
                return h.createUpdate("insert into thong_tin_nguoi_dung (id_user, ho, ten, dia_chi, gioi_tinh, ngay_sinh)" +
                        " values (:idUser, null, null, null, null,null)").bind("idUser", res).execute();
            });

            jdbi.withHandle(h -> {
                return h.createUpdate("insert into ve_da_dat (id_user, so_luong, id_ve, ngay_dat)" +
                        " values (:idUser, null, null, null)").bind("idUser", res).execute();
            });
            return res > 0 ? "thêm tài khoảng thành công" : "thêm tài khoảng thất bại";
        } catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }

    }
}
