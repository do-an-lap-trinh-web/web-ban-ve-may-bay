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
}
