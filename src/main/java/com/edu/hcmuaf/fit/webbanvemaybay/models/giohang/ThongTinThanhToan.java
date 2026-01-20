package com.edu.hcmuaf.fit.webbanvemaybay.models.giohang;

import java.util.List;

public class ThongTinThanhToan {
    private List<ChiTietThanhToan> listChiTietThanhToan;
    private String tongTien;

    public List<ChiTietThanhToan> getListChiTietThanhToan() {
        return listChiTietThanhToan;
    }

    public void setListChiTietThanhToan(List<ChiTietThanhToan> listChiTietThanhToan) {
        this.listChiTietThanhToan = listChiTietThanhToan;
    }

    public String getTongTien() {
        return tongTien;
    }

    public void setTongTien(String tongTien) {
        this.tongTien = tongTien;
    }
}
