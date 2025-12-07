package com.edu.hcmuaf.fit.webbanvemaybay.models;
import java.util.Date;
public class DatVe {
    private int id_dat_ve;
    private int id_user;
    private int so_luong;
    private int id_ve;
    private Date ngay_dat;

    public DatVe() {}

    public int getId_dat_ve() { return id_dat_ve; }
    public void setId_dat_ve(int id_dat_ve) { this.id_dat_ve = id_dat_ve; }
    public int getId_user() { return id_user; }
    public void setId_user(int id_user) { this.id_user = id_user; }
    public int getSo_luong() { return so_luong; }
    public void setSo_luong(int so_luong) { this.so_luong = so_luong; }
    public int getId_ve() { return id_ve; }
    public void setId_ve(int id_ve) { this.id_ve = id_ve; }
    public Date getNgay_dat() { return ngay_dat; }
    public void setNgay_dat(Date ngay_dat) { this.ngay_dat = ngay_dat; }
}