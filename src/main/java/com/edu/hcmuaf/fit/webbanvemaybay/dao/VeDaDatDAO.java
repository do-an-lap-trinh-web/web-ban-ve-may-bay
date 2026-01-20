package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDto;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DatVe;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class VeDaDatDAO extends DBContext {
    public boolean addVeDaDat(DatVe datVe) {
        try {
            Jdbi jdbi = get();
            int soLuong = jdbi.withHandle(h -> {
                String q = "insert into ve_da_dat(id, id_user, so_luong, id_ve, ngay_dat) " +
                        "values (:id, :idUser, :soLuong, :idVe, :ngayDat)";
                return h.createUpdate(q).bindBean(datVe).execute();
            });
            if (soLuong > 0) {
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<DatVe> getAllVeDaDatByUser(int idUser) {
        try {
            Jdbi jdbi = get();
            List<DatVe> listVeDaDat = jdbi.withHandle(h -> {
                String q = "select * from ve_da_dat where id_user = :idUser";
                return h.createQuery(q).bind("idUser", idUser).mapToBean(DatVe.class).list();
            });
            return listVeDaDat;
        }  catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
