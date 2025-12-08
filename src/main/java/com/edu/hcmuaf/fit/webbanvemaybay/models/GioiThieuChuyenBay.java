package com.edu.hcmuaf.fit.webbanvemaybay.models;

public class GioiThieuChuyenBay {
    private int idGioiThieu;
    private String img;
    private int idSanBayDi;
    private int idSanBayDen;
    private String moTa;

    public GioiThieuChuyenBay() {}

    public int getIdGioiThieu() { return idGioiThieu; }
    public void setIdGioiThieu(int idGioiThieu) { this.idGioiThieu = idGioiThieu; }
    public String getImg() { return img; }
    public void setImg(String img) { this.img = img; }
    public int getIdSanBayDi() { return idSanBayDi; }
    public void setIdSanBayDi(int idSanBayDi) { this.idSanBayDi = idSanBayDi; }
    public int getIdSanBayDen() { return idSanBayDen; }
    public void setIdSanBayDen(int idSanBayDen) { this.idSanBayDen = idSanBayDen; }
    public String getMoTa() { return moTa; }
    public void setMoTa(String moTa) { this.moTa = moTa; }
}