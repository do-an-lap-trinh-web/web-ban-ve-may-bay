package com.edu.hcmuaf.fit.webbanvemaybay.dao.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DBContext;
import com.edu.hcmuaf.fit.webbanvemaybay.models.SoHieuChuyenBay;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Jdbi;

import java.io.IOException;
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

    // thêm mố số hiệu chuyến bay mới
    public String addSoHieuChuyenBay(SoHieuChuyenBay soHieuChuyenBay) {
        try {
            Jdbi jdbi = get();

            // lấy id sân bay đi trong bản san_bay
            int isIdSanBayDi = jdbi.withHandle(h -> {
                String q = "select count(*) from san_bay where id = :id";
                return h.createQuery(q).bind("id", soHieuChuyenBay.getIdSanBayDi()).mapTo(Integer.class).one();
            });
            int isIdSanBayDen = jdbi.withHandle(h -> {
                String q = "select count(*) from san_bay where id = :id";
                return h.createQuery(q).bind("id", soHieuChuyenBay.getIdSanBayDen()).mapTo(Integer.class).one();
            });
            int isHangBay = jdbi.withHandle(h -> {
                String q = "select count(*) from hang_bay where id = :id";
                return h.createQuery(q).bind("id", soHieuChuyenBay.getIdHangBay()).mapTo(Integer.class).one();
            });
            if (isIdSanBayDi <= 0) {
                return "id sân bay đi không tồn tại";
            }
            if (isIdSanBayDen <= 0) {
                return "id sân bay đến không tồn tại";
            }
            if (isHangBay <= 0) {
                return "id hãng bay không tồn tại";
            }
            jdbi.withHandle(h -> {
                String q = "insert into so_hieu_chuyen_bay (ma_chuyen_bay, id_san_bay_di, id_san_bay_den, id_hang_bay) values " +
                        "(:maChuyenBay, :idSanBayDi, :idSanBayDen, :idHangBay)";
                return h.createUpdate(q).bindBean(soHieuChuyenBay).execute();
            });
            return "Thêm SHCB: " + soHieuChuyenBay.getMaChuyenBay() + " thành công";
        } catch (Exception e) {
            return "thêm thất bại do lỗi hệ thống";
        }
    }
}
