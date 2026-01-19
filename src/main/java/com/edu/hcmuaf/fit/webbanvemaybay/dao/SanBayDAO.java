package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import com.edu.hcmuaf.fit.webbanvemaybay.models.ChuyenBay;
import com.edu.hcmuaf.fit.webbanvemaybay.models.SanBay;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

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

    public List<String> getListSanBayName() {
        try {
            Jdbi jdbi = get();
            List<String> listSanBayName = jdbi.withHandle(h -> {
                String q = "select quoc_gia from san_bay group by quoc_gia";
                return h.createQuery(q).mapTo(String.class).list();
            });
            return listSanBayName;
        } catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<String> getListTPByQuocGia(String quocGia) {
        try {
            Jdbi jdbi = get();
            return jdbi.withHandle(h -> {
                String q = "select thanh_pho from san_bay where quoc_gia=:quocGia";
                return h.createQuery(q).bind("quocGia", quocGia).mapTo(String.class).list();
            });
        } catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
