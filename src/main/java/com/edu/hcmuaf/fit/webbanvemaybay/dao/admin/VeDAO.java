package com.edu.hcmuaf.fit.webbanvemaybay.dao.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DBContext;
import com.edu.hcmuaf.fit.webbanvemaybay.models.Ve;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class VeDAO extends DBContext {

    public List<Ve> getVeByPage(int offset, int pageSize) {
        try {
            Jdbi jdbi = get();
            return jdbi.withHandle(h -> {
                String q = "SELECT * FROM ve LIMIT :limit OFFSET :offset";
                return h.createQuery(q)
                        .bind("limit", pageSize)
                        .bind("offset", offset)
                        .mapToBean(Ve.class)
                        .list();
            });
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int getTotalVeCount() {
        try {
            Jdbi jdbi = get();
            return jdbi.withHandle(h ->
                    h.createQuery("SELECT COUNT(*) FROM ve").mapTo(Integer.class).one()
            );
        } catch (Exception e) {
            return 0;
        }
    }
}