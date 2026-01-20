package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import com.edu.hcmuaf.fit.webbanvemaybay.models.LoaiVe;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class LoaiVeDAO extends DBContext{
    public String getIdLoaiVeByName(String hangGhe) {
        try {
            Jdbi jdbi = get();
            String id = jdbi.withHandle(h -> {
                String q = "select id from loai_ve where ten_loai_ve=:hangGhe";
                return h.createQuery(q).bind("hangGhe", hangGhe).mapTo(String.class).findOne().orElse(null);
            });
            return id;
        } catch (Exception e) {
            return null;
        }
    }

    public List<String> getListLoaiVe() {
        try {
            Jdbi jdbi = get();
            List<String> listLoaiVe = jdbi.withHandle(h -> {
                String q = "select ten_loai_ve from loai_ve";
                return h.createQuery(q).mapTo(String.class).list();
            });
            return listLoaiVe;
        } catch (Exception e) {
            return null;
        }
    }

    public LoaiVe getLoaiVeById(int idLoaiVe) {
        try {
            Jdbi jdbi = get();
            LoaiVe loaiVe = jdbi.withHandle(h -> {
                String q = "select * from loai_ve where id=:idLoaiVe";
                return h.createQuery(q).bind("idLoaiVe", idLoaiVe).mapToBean(LoaiVe.class).one();
            });
            return loaiVe;
        } catch (Exception e) {
            return null;
        }
    }
}
