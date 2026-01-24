package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import com.edu.hcmuaf.fit.webbanvemaybay.models.ThongTinNguoiDung;
import org.jdbi.v3.core.Jdbi;

public class ThongTinNguoiDungDAO extends DBContext{
    public ThongTinNguoiDung getThongTinNguoiDungByIdUser(String id) {
        try {
            Jdbi jdbi = get();
            return jdbi.withHandle(h -> {
                String q = "select * from thong_tin_nguoi_dung where id_user = :id";
                return h.createQuery(q).bind("id", id).mapToBean(ThongTinNguoiDung.class).findFirst().orElse(null);
            });

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean updateThongTinNguoiDungById(ThongTinNguoiDung thongTinNguoiDung) {
        try {
            Jdbi jdbi = get();
            int soLuong = jdbi.withHandle(h -> {
                String q = "update thong_tin_nguoi_dung set ho = :ho, ten=:ten, dia_chi=:diaChi, gioi_tinh=:gioiTinh, ngay_sinh=:ngaySinh where id = :id";
                return h.createUpdate(q)
                        .bind("ho", thongTinNguoiDung.getHo())
                        .bind("ten", thongTinNguoiDung.getTen())
                        .bind("diaChi",  thongTinNguoiDung.getDiaChi())
                        .bind("gioiTinh", thongTinNguoiDung.getGioiTinh())
                        .bind("ngaySinh", thongTinNguoiDung.getNgaySinh())
                        .bind("id", thongTinNguoiDung.getId())
                        .execute();
            });
            return soLuong > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
