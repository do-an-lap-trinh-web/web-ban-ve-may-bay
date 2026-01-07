package com.edu.hcmuaf.fit.webbanvemaybay.dao.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DBContext;
import com.edu.hcmuaf.fit.webbanvemaybay.models.SoHieuChuyenBay;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class SoHieuChuyenBayDAO extends DBContext {
//    private int id;
//    private String maChuyenBay;
//    private int idSanBayDi;
//    private int idSanBayDen;
//    private int idHangBay;

    // lấy tất cả các chuyến bay
    public List<SoHieuChuyenBay> getListSoHieuChuyenBay() {
        Jdbi jdbi = get();
        List<SoHieuChuyenBay> listSoHieuChuyenBay = jdbi.withHandle(h -> {
            String q = "select id as id, ma_chuyen_bay as maChuyenBay, id_san_bay_di as idSanBayDi, id_san_bay_den as idSanBayDen, id_hang_bay as idHangBay from " +
                    "so_hieu_chuyen_bay";
            return h.createQuery(q).mapToBean(SoHieuChuyenBay.class).list();
        });
        return listSoHieuChuyenBay;
    }
}
