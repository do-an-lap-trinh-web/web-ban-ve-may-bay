package com.edu.hcmuaf.fit.webbanvemaybay.dao.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DBContext;
import com.edu.hcmuaf.fit.webbanvemaybay.models.LoaiVe;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class LoaiVeDAO extends DBContext {


    // hàm thêm một loại vé vào database
    public String addLoaiVe(LoaiVe loaiVe) {
        try {
            Jdbi jdbi = get();
            jdbi.withHandle(h -> h.createUpdate("insert into loai_ve(ten_loai_ve, mo_ta) values (:tenLoaiVe, :moTa)").bindBean(loaiVe).execute());
            return "thêm loại vé thành công";
        } catch (Exception e) {
            e.printStackTrace();
            return "lỗi thêm vé vào database " + e.getMessage();
        }

    }

    public List<LoaiVe> getAllLoaiVe() {
        try {
            Jdbi jdbi = get();
            List<LoaiVe> listLoaiVe = jdbi.withHandle(h -> {
                return h.createQuery("select id, ten_loai_ve as tenLoaiVe, mo_ta as moTa from loai_ve").mapToBean(LoaiVe.class).list();
            });
            return listLoaiVe;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public String xoaLoaiVe(String idLoaiVe) {
        try {
            Jdbi jdbi = get();
            int deleteInVeDaDat = jdbi.withHandle(h -> {
                return h.createUpdate("delete from ve_da_dat where id_ve in (" +
                        "select id from ve where id_loai_ve = :id)").bind("id", idLoaiVe).execute();
            });
            int deleteInVe = jdbi.withHandle(h -> {
                return h.createUpdate("delete from ve where id_loai_ve=:id").bind("id", idLoaiVe).execute();
            });
            int delete = jdbi.withHandle(h -> {
                return h.createUpdate("delete from loai_ve where id=:id").bind("id", idLoaiVe).execute();
            });
            String message;
            if (delete > 0) {
               message = "xoá thành công " + delete;
            } else {
                message = "xoá thất bại " + delete;
            }
            return message;
        } catch (Exception e) {
            e.printStackTrace();
            return " xoá thât bại do lỗi hệ thống " + e.getMessage();
        }
    }

    public LoaiVe getLoaiVeById(String id) {
        try {
            Jdbi jdbi = get();
            LoaiVe loaiVe = jdbi.withHandle(h -> {
                String q = "select * from loai_ve where id=:id";
                return h.createQuery(q).bind("id", id).mapToBean(LoaiVe.class).findFirst().orElse(null);
            });
            return loaiVe;
        }  catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
