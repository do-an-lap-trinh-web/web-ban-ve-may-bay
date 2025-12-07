package com.edu.hcmuaf.fit.webbanvemaybay.models;

public class Ve {
    private int id_ve;
    private int id_chuyen_bay;
    private double gia;
    private int so_luong_ton;
    private int id_loai_ve;
    public Ve() {
    }
    public Ve(int id_ve, int id_chuyen_bay, double gia, int so_luong_ton, int id_loai_ve) {
        this.id_ve = id_ve;
        this.id_chuyen_bay = id_chuyen_bay;
        this.gia = gia;
        this.so_luong_ton = so_luong_ton;
        this.id_loai_ve = id_loai_ve;
    }

    public int getId_ve() {
        return id_ve;
    }

    public void setId_ve(int id_ve) {
        this.id_ve = id_ve;
    }

    public int getId_chuyen_bay() {
        return id_chuyen_bay;
    }

    public void setId_chuyen_bay(int id_chuyen_bay) {
        this.id_chuyen_bay = id_chuyen_bay;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public int getSo_luong_ton() {
        return so_luong_ton;
    }

    public void setSo_luong_ton(int so_luong_ton) {
        this.so_luong_ton = so_luong_ton;
    }

    public int getId_loai_ve() {
        return id_loai_ve;
    }

    public void setId_loai_ve(int id_loai_ve) {
        this.id_loai_ve = id_loai_ve;
    }
}
