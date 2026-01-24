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

    public boolean addSanBay(SanBay sanBay) {
        try {
            Jdbi jdbi = get();
            int soLuong = jdbi.withHandle(h -> {
                String q = "insert into san_bay(id, ten_san_bay, thanh_pho, quoc_gia) values (:id, :tenSanBay, :thanhPho, :quocGia)";
                return h.createUpdate(q).bindBean(sanBay).execute();
            });
            return soLuong > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
