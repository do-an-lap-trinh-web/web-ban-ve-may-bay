package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import com.edu.hcmuaf.fit.webbanvemaybay.models.YeuCauHoTro;
import org.jdbi.v3.core.Jdbi;

public class YeuCauHoTroDAO extends DBContext {

    public boolean insertYeuCau(YeuCauHoTro yc) {
        try {
            Jdbi jdbi = get();
            return jdbi.withHandle(h -> {
                String q = "INSERT INTO yeu_cau_ho_tro (ho_ten, email, noi_dung) VALUES (:hoTen, :email, :noiDung)";
                return h.createUpdate(q)
                        .bind("hoTen", yc.getHoTen())
                        .bind("email", yc.getEmail())
                        .bind("noiDung", yc.getNoiDung())
                        .execute();
            }) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}