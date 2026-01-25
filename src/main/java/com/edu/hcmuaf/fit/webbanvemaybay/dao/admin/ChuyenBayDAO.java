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
}
