package com.edu.hcmuaf.fit.webbanvemaybay.models;

public class GioiThieuChuyenBay {
    private int id_gioi_thieu;
    private String img;
    private String id_san_bay_di;
    private String id_san_bay_den;
    private String mo_ta;

    public GioiThieuChuyenBay() {}

    public int getId_gioi_thieu() { return id_gioi_thieu; }
    public void setId_gioi_thieu(int id_gioi_thieu) { this.id_gioi_thieu = id_gioi_thieu; }
    public String getImg() { return img; }
    public void setImg(String img) { this.img = img; }
    public String getId_san_bay_di() { return id_san_bay_di; }
    public void setId_san_bay_di(String id_san_bay_di) { this.id_san_bay_di = id_san_bay_di; }
    public String getId_san_bay_den() { return id_san_bay_den; }
    public void setId_san_bay_den(String id_san_bay_den) { this.id_san_bay_den = id_san_bay_den; }
    public String getMo_ta() { return mo_ta; }
    public void setMo_ta(String mo_ta) { this.mo_ta = mo_ta; }
}
