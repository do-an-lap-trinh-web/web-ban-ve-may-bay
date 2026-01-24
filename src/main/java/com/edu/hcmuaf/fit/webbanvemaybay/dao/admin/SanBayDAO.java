package com.edu.hcmuaf.fit.webbanvemaybay.dao.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DBContext;
import com.edu.hcmuaf.fit.webbanvemaybay.models.SanBay;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class SanBayDAO extends DBContext {
    public List<SanBay> getAllSanBay() {
        try {
            Jdbi jdbi = get();
            List<SanBay> listSanBay = jdbi.withHandle(h -> {
                String q = "select * from san_bay";
                return h.createQuery(q).mapToBean(SanBay.class).list();
            });
            return listSanBay;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
