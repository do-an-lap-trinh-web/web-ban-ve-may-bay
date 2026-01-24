package com.edu.hcmuaf.fit.webbanvemaybay.dao.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DBContext;
import com.edu.hcmuaf.fit.webbanvemaybay.models.Ve;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class VeDAO extends DBContext {
    public List<Ve> getAllVe() {
        try {
            Jdbi jdbi = get();
            return jdbi.withHandle(h -> {
                String q = "select * from ve";
                return h.createQuery(q).mapToBean(Ve.class).list();
            });
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
