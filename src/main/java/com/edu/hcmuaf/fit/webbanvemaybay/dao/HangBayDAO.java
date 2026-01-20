package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import com.edu.hcmuaf.fit.webbanvemaybay.models.HangBay;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class HangBayDAO extends DBContext {
    public HangBay getHangBayById(int id) {
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

    public List<HangBay> getAllHangBay() {
        try {
            Jdbi jdbi = get();
            List<HangBay> listHangBay = jdbi.withHandle(h -> {
                String q = "select * from hang_bay";
                return h.createQuery(q).mapToBean(HangBay.class).list();
            });
            return listHangBay;
        }  catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
