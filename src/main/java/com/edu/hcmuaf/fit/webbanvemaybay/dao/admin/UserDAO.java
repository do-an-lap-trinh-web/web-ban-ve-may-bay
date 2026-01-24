package com.edu.hcmuaf.fit.webbanvemaybay.dao.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DBContext;
import com.edu.hcmuaf.fit.webbanvemaybay.models.ThongTinNguoiDung;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import org.jdbi.v3.core.Jdbi;


import java.util.List;

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
                return h.createUpdate("insert into users (id, username, password, so_dien_thoai, email, code_xac_thuc, hang_xac_thuc, role)" +
                        " values (:id, :username, :password, :soDienThoai, :email, :codeXacThuc, :hangXacThuc, :role)").bindBean(user).executeAndReturnGeneratedKeys().mapTo(Integer.class).one();
            });
            jdbi.withHandle(h -> {
//                private int idUser;
//                private String ho;
//                private String ten;
//                private String diaChi;
//                private String gioiTinh;
//                private String ngaySinh;
//                private int id;
                return h.createUpdate("insert into thong_tin_nguoi_dung (id_user, ho, ten, dia_chi, gioi_tinh, ngay_sinh)" +
                        " values (:idUser, null, null, null, null,null)").bind("idUser", res).execute();
            });

            jdbi.withHandle(h -> {
//                private int id;
//                private int idUser;
//                private int soLuong;
//                private int idVe;
//                private String ngayDat;
                return h.createUpdate("insert into ve_da_dat (id_user, so_luong, id_ve, ngay_dat)" +
                        " values (:idUser, null, null, null)").bind("idUser", res).execute();
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

    public User getUserById(int userId) {
        Jdbi jdbi = DBContext.get();
        return jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM users WHERE id = :id").bind("id", userId).mapToBean(User.class).findFirst().orElse(null);
        });
    }

    public ThongTinNguoiDung getChiTietNguoiDung(int userId) {
        Jdbi jdbi = DBContext.get();
        return jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM thong_tin_nguoi_dung WHERE id_user = :id").bind("id", userId).mapToBean(ThongTinNguoiDung.class).findFirst().orElse(null);
        });
    }

    public void updateUser(User user, ThongTinNguoiDung details) {
        try {
            Jdbi jdbi = DBContext.get();
            jdbi.useHandle(handle -> {
                String sqlUser = "UPDATE users SET email = :email, so_dien_thoai = :sdt, role = :role WHERE id = :id";
                handle.createUpdate(sqlUser).bind("email", user.getEmail()).bind("sdt", user.getSoDienThoai()).bind("role", user.getRole()).bind("id", user.getId()).execute();

//            String sqlDetails = "INSERT INTO thong_tin_nguoi_dung (id_user, ho, ten, dia_chi, gioi_tinh, ngay_sinh) " +
//                    "VALUES (:idUser, :ho, :ten, :diaChi, :gioiTinh, :ngaySinh) " +
//                    "ON DUPLICATE KEY UPDATE " +
//                    "ho = :ho, ten = :ten, dia_chi = :diaChi, gioi_tinh = :gioiTinh, ngay_sinh = :ngaySinh";
                String q = "update thong_tin_nguoi_dung set ho = :ho, " +
                        "ten = :ten, dia_chi = :diaChi, " +
                        "gioi_tinh = :gioiTinh, ngay_sinh = :ngaySinh where id_user=:idUser";
                handle.createUpdate(q).bind("idUser", details.getIdUser()).bind("ho", details.getHo()).bind("ten", details.getTen()).
                        bind("diaChi", details.getDiaChi()).
                        bind("gioiTinh", details.getGioiTinh()).bind("ngaySinh", details.getNgaySinh())
                        .execute();
            });
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public List<User> getUserByInput(String input) {
        try {
            Jdbi jdbi = get();
            String textInput = "%"  + input + "%";
            return jdbi.withHandle(h -> {
                String q = "select * from users where id = :input or username like :textInput or email like :textInput or so_dien_thoai like :textInput";
                return h.createQuery(q).bind("input", input).bind("textInput", textInput).mapToBean(User.class).list();
            });

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

