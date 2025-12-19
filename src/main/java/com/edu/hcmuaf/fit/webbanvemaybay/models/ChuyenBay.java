package com.edu.hcmuaf.fit.webbanvemaybay.models;
import  java.util.Date;
public class ChuyenBay {
    private int id;
    private String thoiGianKhoiHanh;
    private String thoiGianHaCanh;
    private String maChuyenBay;

    public ChuyenBay() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getThoiGianKhoiHanh() { return thoiGianKhoiHanh; }
    public void setThoiGianKhoiHanh(String thoiGianKhoiHanh) { this.thoiGianKhoiHanh = thoiGianKhoiHanh; }
    public String getThoiGianHaCanh() { return thoiGianHaCanh; }
    public void setThoiGianHaCanh(String thoiGianHaCanh) { this.thoiGianHaCanh = thoiGianHaCanh; }
    public String getMaChuyenBay() { return maChuyenBay; }
    public void setMaChuyenBay(String maChuyenBay) { this.maChuyenBay = maChuyenBay; }
}