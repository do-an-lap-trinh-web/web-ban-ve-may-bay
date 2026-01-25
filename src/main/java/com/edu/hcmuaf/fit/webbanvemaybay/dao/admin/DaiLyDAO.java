package com.edu.hcmuaf.fit.webbanvemaybay.dao.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DBContext;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DaiLy;
import org.jdbi.v3.core.Jdbi;

public class DaiLyDAO extends DBContext {
    public DaiLy getDaiLy() {
        try {
            Jdbi jdbi = get();
            return jdbi.withHandle(h -> {
                String q = "select * from dai_ly";
                return h.createQuery(q).mapToBean(DaiLy.class).findFirst().orElse(null);
            });
        }  catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean upDateDaiLyById(DaiLy daiLy) {
        try {
            Jdbi jdbi = get();
            return jdbi.withHandle(h -> {
                String q = "update dai_ly set dia_chi=:diaChi, so_dien_thoai=:soDienThoai, email=:email, link_fb=:linkFb, link_yt=:linkYt, " +
                        "link_tiktok=:linkTiktok where id=:id";
                return h.createUpdate(q)
                        .bind("id", daiLy.getId())
                        .bind("diaChi", daiLy.getDiaChi())
                        .bind("soDienThoai",  daiLy.getSoDienThoai())
                        .bind("email", daiLy.getEmail())
                        .bind("linkFb", daiLy.getLinkFb())
                        .bind("linkYt", daiLy.getLinkYt())
                        .bind("linkTiktok", daiLy.getLinkTiktok()).execute();
            }) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
