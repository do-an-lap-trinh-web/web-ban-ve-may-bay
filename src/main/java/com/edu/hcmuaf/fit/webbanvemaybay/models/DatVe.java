package com.edu.hcmuaf.fit.webbanvemaybay.models;
import java.util.Date;
public class DatVe {
    private int id;
    private int idUser;
    private int soLuong;
    private int idVe;
    private String ngayDat;

    public DatVe() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() { return idUser; }
    public void setIdUser(int idUser) { this.idUser = idUser; }
    public int getSoLuong() { return soLuong; }
    public void setSoLuong(int soLuong) { this.soLuong = soLuong; }
    public int getIdVe() { return idVe; }
    public void setIdVe(int idVe) { this.idVe = idVe; }
    public String getNgayDat() { return ngayDat; }
    public void setNgayDat(String ngayDat) { this.ngayDat = ngayDat; }
}