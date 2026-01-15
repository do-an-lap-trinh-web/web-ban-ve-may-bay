package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import org.jdbi.v3.core.Jdbi;

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
}
