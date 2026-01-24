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

    public boolean addVe(Ve ve) {
        try {
            Jdbi jdbi = get();
            int soLuong = jdbi.withHandle(h -> {
                String q = "insert into ve(id, id_chuyen_bay, gia, so_luong_ton, id_loai_ve) values (:id, :idChuyenBay, :gia, :soLuongTon, :idLoaiVe)";
                return h.createUpdate(q).bindBean(ve).execute();
            });
            return soLuong > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Ve getVeById(String id) {
        try {
            Jdbi jdbi = get();
            return jdbi.withHandle(h -> {
                String q = "select * from ve where id = :id";
                return h.createQuery(q).bind("id", id).mapToBean(Ve.class).findFirst().orElse(null);
            });
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean updateVeById(Ve ve) {
        try {
            Jdbi jdbi = get();
            int soLuong = jdbi.withHandle(h -> {
                String q = "update ve set id_chuyen_bay = :idChuyenBay, id_loai_ve=:idLoaiVe, gia=:gia, so_luong_ton=:soLuongTon where id = :id";
                return h.createUpdate(q).bind("idChuyenBay", ve.getIdChuyenBay())
                        .bind("idLoaiVe", ve.getIdLoaiVe())
                        .bind("gia", ve.getGia())
                        .bind("soLuongTon", ve.getSoLuongTon())
                        .bind("id", ve.getId())
                        .execute();
            });
            return soLuong > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removeVeById(String id) {
        try {
            Jdbi jdbi = get();
            int soLuong = jdbi.withHandle(h -> {
                String q = "delete from ve where id = :id";
                return h.createUpdate(q).bind("id", id).execute();
            });
            return soLuong > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}