package com.edu.hcmuaf.fit.webbanvemaybay.dao.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DBContext;
import com.edu.hcmuaf.fit.webbanvemaybay.models.HangBay;
import org.jdbi.v3.core.Jdbi;

public class HangBayDAO extends DBContext {
    public HangBay getHangbayById(int id) {
        try {
            Jdbi jdbi = get();
            HangBay hangBay = jdbi.withHandle(h -> {
                String q = "select * from hang_bay where id=:id";
                return h.createQuery(q).bind("id", id).mapToBean(HangBay.class).one();
            });
            return hangBay;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
