package com.edu.hcmuaf.fit.webbanvemaybay.models;
import java.util.Date;
public class DatVe {
    private int idDatVe;
    private int idUser;
    private int soLuong;
    private int idVe;
    private String ngayDat;

    public DatVe() {}

    public int getIdDatVe() { return idDatVe; }
    public void setIdDatVe(int idDatVe) { this.idDatVe = idDatVe; }
    public int getIdUser() { return idUser; }
    public void setIdUser(int idUser) { this.idUser = idUser; }
    public int getSoLuong() { return soLuong; }
    public void setSoLuong(int soLuong) { this.soLuong = soLuong; }
    public int getIdVe() { return idVe; }
    public void setIdVe(int idVe) { this.idVe = idVe; }
    public String getNgayDat() { return ngayDat; }
    public void setNgayDat(String ngayDat) { this.ngayDat = ngayDat; }
}