package com.edu.hcmuaf.fit.webbanvemaybay.models;

public class LoaiVe {
    private int id;
    private String tenLoaiVe;
    private String moTa;

    public LoaiVe() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getTenLoaiVe() { return tenLoaiVe; }
    public void setTenLoaiVe(String tenLoaiVe) { this.tenLoaiVe = tenLoaiVe; }
    public String getMoTa() { return moTa; }
    public void setMoTa(String moTa) { this.moTa = moTa; }
}