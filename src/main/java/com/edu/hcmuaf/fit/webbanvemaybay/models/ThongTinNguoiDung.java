package com.edu.hcmuaf.fit.webbanvemaybay.models;
import java.util.Date;

public class ThongTinNguoiDung {
    private int idUser;
    private String ho;
    private String ten;
    private String diaChi;
    private String gioiTinh;
    private String ngaySinh;
    private int id;

    public ThongTinNguoiDung() {}

    public int getIdUser() { return idUser; }
    public void setIdUser(int idUser) { this.idUser = idUser; }
    public String getHo() { return ho; }
    public void setHo(String ho) { this.ho = ho; }
    public String getTen() { return ten; }
    public void setTen(String ten) { this.ten = ten; }
    public String getDiaChi() { return diaChi; }
    public void setDiaChi(String diaChi) { this.diaChi = diaChi; }
    public String getGioiTinh() { return gioiTinh; }
    public void setGioiTinh(String gioiTinh) { this.gioiTinh = gioiTinh; }
    public String getNgaySinh() { return ngaySinh; }
    public void setNgaySinh(String ngaySinh) { this.ngaySinh = ngaySinh; }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}