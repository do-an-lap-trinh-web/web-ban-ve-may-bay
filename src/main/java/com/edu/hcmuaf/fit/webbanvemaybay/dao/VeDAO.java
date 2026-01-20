package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import com.edu.hcmuaf.fit.webbanvemaybay.models.Ve;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class VeDAO extends DBContext {
    public List<Ve> getListVeByHangGhe(String idLoaiVe) {
        try {
            Jdbi jdbi = get();
            List<Ve> listVe = jdbi.withHandle(h -> {
                String q = "select * from ve where id_loai_ve=:idLoaiVe and so_luong_ton > 0";
                return h.createQuery(q).bind("idLoaiVe", idLoaiVe).mapToBean(Ve.class).list();
            });
            return listVe;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Ve getVeById(int id) {
        try {
            Jdbi jdbi = get();
            Ve ve = jdbi.withHandle(h -> {
                String q = "select * from ve where id = :id";
                return h.createQuery(q).bind("id", id).mapToBean(Ve.class).findOne().orElse(null);
            });
            return ve;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
