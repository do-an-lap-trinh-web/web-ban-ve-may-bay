package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import com.edu.hcmuaf.fit.webbanvemaybay.models.ChuyenBay;
import com.edu.hcmuaf.fit.webbanvemaybay.models.SanBay;
import org.jdbi.v3.core.Jdbi;

public class SanBayDAO extends DBContext{
    public SanBay getSanBayByTPAndQG(String khoiHanh, String diemDi) {
        try {
            Jdbi jdbi = get();
            SanBay sanBay = jdbi.withHandle(h -> {
                String q = "select * from san_bay where quoc_gia=:khoiHanh and thanh_pho=:diemDi";
                return h.createQuery(q).bind("khoiHanh", khoiHanh).bind("diemDi", diemDi).mapToBean(SanBay.class).findOne().orElse(null);
            });
            return sanBay;
        } catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
