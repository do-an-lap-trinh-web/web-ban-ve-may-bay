package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import com.edu.hcmuaf.fit.webbanvemaybay.models.SanBay;
import com.edu.hcmuaf.fit.webbanvemaybay.models.SoHieuChuyenBay;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class SoHieuChuyenBayDAO extends DBContext{
    public List<SoHieuChuyenBay> getListSoHieuChuyenBayBySanBayDiAndSanBayDen(int idSanBayDi, int idSanBayDen) {
        try {
            Jdbi jdbi = get();
            List<SoHieuChuyenBay> listSoHieuChuyenBay = jdbi.withHandle(h -> {
                String q = "select * from so_hieu_chuyen_bay where id_san_bay_di=:idSanBayDi and id_san_bay_den=:idSanBayDen";
                return h.createQuery(q).bind("idSanBayDi", idSanBayDi).bind("idSanBayDen", idSanBayDen)
                        .mapToBean(SoHieuChuyenBay.class).list();
            });
            return listSoHieuChuyenBay;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
