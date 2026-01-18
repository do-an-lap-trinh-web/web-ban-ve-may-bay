package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import com.edu.hcmuaf.fit.webbanvemaybay.models.ChuyenBay;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ChuyenBayDAO extends DBContext {
    public List<ChuyenBay> getListChuyenBayByNgayDi(String ngayDi) {
        try{
            Jdbi jdbi = get();
            List<ChuyenBay> listChuyenBay = jdbi.withHandle(h -> {
                String q = "select * from chuyen_bay where date(thoi_gian_khoi_hanh)=:ngayDi";
                return h.createQuery(q).bind("ngayDi", ngayDi).mapToBean(ChuyenBay.class).list();
            });
            return listChuyenBay;
        } catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
