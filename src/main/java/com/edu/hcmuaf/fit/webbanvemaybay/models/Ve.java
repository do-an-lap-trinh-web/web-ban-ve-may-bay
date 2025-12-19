package com.edu.hcmuaf.fit.webbanvemaybay.models;

public class Ve {
    private int id;
    private int idChuyenBay;
    private double gia;
    private int soLuongTon;
    private int idLoaiVe;

    public Ve() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public int getIdChuyenBay() { return idChuyenBay; }
    public void setIdChuyenBay(int idChuyenBay) { this.idChuyenBay = idChuyenBay; }
    public double getGia() { return gia; }
    public void setGia(double gia) { this.gia = gia; }
    public int getSoLuongTon() { return soLuongTon; }
    public void setSoLuongTon(int soLuongTon) { this.soLuongTon = soLuongTon; }
    public int getIdLoaiVe() { return idLoaiVe; }
    public void setIdLoaiVe(int idLoaiVe) { this.idLoaiVe = idLoaiVe; }
}