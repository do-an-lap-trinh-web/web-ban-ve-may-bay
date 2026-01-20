package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import com.edu.hcmuaf.fit.webbanvemaybay.models.SanBay;
import com.edu.hcmuaf.fit.webbanvemaybay.models.SoHieuChuyenBay;
import org.jdbi.v3.core.Jdbi;

import java.util.ArrayList;
import java.util.List;

public class SoHieuChuyenBayDAO extends DBContext {
    public List<SoHieuChuyenBay> getListSoHieuChuyenBayBySanBayDiAndSanBayDen(List<SanBay> sanBayDi, List<SanBay> sanBayDen) {
        try {
            Jdbi jdbi = get();
            List<SoHieuChuyenBay> listSoHieuChuyenBay = new ArrayList<>();
            for (int i = 0; i < sanBayDi.size(); i++) {
                int idSanBayDi = sanBayDi.get(i).getId();
                for (int j = 0; j < sanBayDen.size(); j++) {
                    int idSanBayDen = sanBayDen.get(j).getId();
                    SoHieuChuyenBay soHieuChuyenBay = jdbi.withHandle(h -> {
                        String q = "select * from so_hieu_chuyen_bay where id_san_bay_di=:idSanBayDi and id_san_bay_den=:idSanBayDen";
                        return h.createQuery(q).bind("idSanBayDi", idSanBayDi).bind("idSanBayDen", idSanBayDen)
                                .mapToBean(SoHieuChuyenBay.class).findFirst().orElse(null);
                    });
                    if (soHieuChuyenBay != null) {
                        listSoHieuChuyenBay.add(soHieuChuyenBay);
                    }
                }
            }
            return listSoHieuChuyenBay;
//            List<SoHieuChuyenBay> listSoHieuChuyenBay = jdbi.withHandle(h -> {
//                String q = "select * from so_hieu_chuyen_bay where id_san_bay_di=:idSanBayDi and id_san_bay_den=:idSanBayDen";
//                return h.createQuery(q).bind("idSanBayDi", idSanBayDi).bind("idSanBayDen", idSanBayDen)
//                        .mapToBean(SoHieuChuyenBay.class).list();
//            });
//            return listSoHieuChuyenBay;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public SoHieuChuyenBay getSoHieuChuyenBayById(int idSoHieuChuyenBay) {
        try {
            Jdbi jdbi = get();
            SoHieuChuyenBay soHieuChuyenBay = jdbi.withHandle(h -> {
                String q = "select * from so_hieu_chuyen_bay where id=:idSoHieuChuyenBay";
                return h.createQuery(q).bind("idSoHieuChuyenBay", idSoHieuChuyenBay).mapToBean(SoHieuChuyenBay.class).one();
            });
            return soHieuChuyenBay;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
