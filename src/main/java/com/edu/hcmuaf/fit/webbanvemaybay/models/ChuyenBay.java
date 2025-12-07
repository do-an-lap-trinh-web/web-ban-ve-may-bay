package com.edu.hcmuaf.fit.webbanvemaybay.models;
import  java.util.Date;
public class ChuyenBay {
    private int id_chuyen_bay;
    private Date thoi_gian_khoi_hanh;
    private Date thoi_gian_ha_canh;
    private String ma_chuyen_bay;

    public ChuyenBay() {}

    public int getId_chuyen_bay() { return id_chuyen_bay; }
    public void setId_chuyen_bay(int id_chuyen_bay) { this.id_chuyen_bay = id_chuyen_bay; }
    public Date getThoi_gian_khoi_hanh() { return thoi_gian_khoi_hanh; }
    public void setThoi_gian_khoi_hanh(Date thoi_gian_khoi_hanh) { this.thoi_gian_khoi_hanh = thoi_gian_khoi_hanh; }
    public Date getThoi_gian_ha_canh() { return thoi_gian_ha_canh; }
    public void setThoi_gian_ha_canh(Date thoi_gian_ha_canh) { this.thoi_gian_ha_canh = thoi_gian_ha_canh; }
    public String getMa_chuyen_bay() { return ma_chuyen_bay; }
    public void setMa_chuyen_bay(String ma_chuyen_bay) { this.ma_chuyen_bay = ma_chuyen_bay; }
}
