package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import com.edu.hcmuaf.fit.webbanvemaybay.models.ThongTinNguoiDung;
import org.jdbi.v3.core.Jdbi;

public class ThongTinNguoiDungDAO extends DBContext{
    public ThongTinNguoiDung getThongTinNguoiDungByIdUser(String id) {
        try {
            Jdbi jdbi = get();
            return jdbi.withHandle(h -> {
                String q = "select * from thong_tin_nguoi_dung where id_user = :id";
                return h.createQuery(q).bind("id", id).mapToBean(ThongTinNguoiDung.class).findFirst().orElse(null);
            });

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
