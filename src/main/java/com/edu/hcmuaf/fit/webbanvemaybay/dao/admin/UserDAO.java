package com.edu.hcmuaf.fit.webbanvemaybay.dao.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DBContext;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.PreparedBatch;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.statement.SqlQuery;


import java.util.List;
import java.util.Objects;

public class UserDAO extends DBContext {
    // lấy danh sách user trong database
    public List<User> getListUser() {
        return get().withHandle(h -> {
            return h.createQuery("select id, username, password, so_dien_thoai as soDienThoai, " +
                    "email, code_xac_thuc as codeXacThuc, hang_xac_thuc as hangXacThuc " +
                    "from users").mapToBean(User.class).list();
        });
    }
//
//    private int id;
//    private String username;
//    private String password;
//    private String soDienThoai;
//    private String email;
//    private String codeXacThuc;
//    private String hangXacThuc;

    // thêm user vào trong database
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
                        " values (:id, :username, :password, :soDienThoai, :email, :codeXacThuc, :hangXacThuc)").bindBean(user).execute();
            });
            return res > 0 ? "thêm tài khoảng thành công" : "thêm thài khoảng thất bại";
        } catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }

    }

    // xoá user khỏi database
    public String removeUser(String id) {
        try {
            Jdbi jdbi = get();
            int isRemoveInTableThongTinNguoiDung = jdbi.withHandle(h -> {
                return h.createUpdate("delete from thong_tin_nguoi_dung where id_user=:id").bind("id", id).execute();
            });
            int isRemoveInTableVeDaDat = jdbi.withHandle(h -> {
                return h.createUpdate("delete from ve_da_dat where id_user=:id").bind("id", id).execute();
            });
            int isRemoveInTableUsers = jdbi.withHandle(h -> {
                return h.createUpdate("delete from users where id=:id").bind("id", id).execute();
            });
            if (isRemoveInTableUsers > 0) {
                return "xoá user có id: " + id + " thành công";
            } else {
                return "xoá user có id: " + id + " thất bại vì không tồn tại user";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "xoá user có id: " + id + " thất bại do lỗi hệ thống";

        }
    }
}

