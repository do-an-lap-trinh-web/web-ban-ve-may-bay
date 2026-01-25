package com.edu.hcmuaf.fit.webbanvemaybay.dao.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DBContext;
import com.edu.hcmuaf.fit.webbanvemaybay.models.ChuyenBay;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ChuyenBayDAO extends DBContext {
    public List<ChuyenBay> getChuyenBayByPage(int offset, int pageSize) {
        try {
            Jdbi jdbi = get();
            return jdbi.withHandle(h -> {
                String q = "select * from chuyen_bay LIMIT :limit OFFSET :offset";
                return h.createQuery(q)
                        .bind("limit", pageSize)
                        .bind("offset", offset)
                        .mapToBean(ChuyenBay.class)
                        .list();
            });
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int getTotalChuyenBayCount() {
        try {
            Jdbi jdbi = get();
            return jdbi.withHandle(h ->
                    h.createQuery("select count(*) from chuyen_bay").mapTo(Integer.class).one()
            );
        } catch (Exception e) {
            return 0;
        }
    }

    public boolean addChuyenBay(ChuyenBay chuyenBay) {
        try {
            Jdbi jdbi = get();
            int soLuong = jdbi.withHandle(h -> {
                String q = "insert into chuyen_bay(id, thoi_gian_khoi_hanh, thoi_gian_ha_canh, id_so_hieu_chuyen_bay) " +
                        "values (:id, :thoiGianKhoiHanh, :thoiGianHaCanh, :idSoHieuChuyenBay)";
                return h.createUpdate(q).bindBean(chuyenBay).execute();
            });
            return soLuong > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
