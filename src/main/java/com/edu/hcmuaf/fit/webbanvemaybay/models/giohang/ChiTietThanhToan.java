package com.edu.hcmuaf.fit.webbanvemaybay.models.giohang;

public class ChiTietThanhToan {
    private String soHieuChuyenBay;
    private int soLuong;
    private double gia;

    public String getSoHieuChuyenBay() {
        return soHieuChuyenBay;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public void setSoHieuChuyenBay(String soHieuChuyenBay) {
        this.soHieuChuyenBay = soHieuChuyenBay;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }
}
