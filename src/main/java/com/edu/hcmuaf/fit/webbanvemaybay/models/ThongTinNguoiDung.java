package com.edu.hcmuaf.fit.webbanvemaybay.models;
import java.util.Date;

public class ThongTinNguoiDung {
    private int id_user;
    private String ho;
    private String ten;
    private String dia_chi;
    private String gioi_tinh;
    private Date ngay_sinh;
    private String id_nguoi_dung;

    public ThongTinNguoiDung() {}

    public int getId_user() { return id_user; }
    public void setId_user(int id_user) { this.id_user = id_user; }
    public String getHo() { return ho; }
    public void setHo(String ho) { this.ho = ho; }
    public String getTen() { return ten; }
    public void setTen(String ten) { this.ten = ten; }
    public String getDia_chi() { return dia_chi; }
    public void setDia_chi(String dia_chi) { this.dia_chi = dia_chi; }
    public String getGioi_tinh() { return gioi_tinh; }
    public void setGioi_tinh(String gioi_tinh) { this.gioi_tinh = gioi_tinh; }
    public Date getNgay_sinh() { return ngay_sinh; }
    public void setNgay_sinh(Date ngay_sinh) { this.ngay_sinh = ngay_sinh; }
    public String getId_nguoi_dung() { return id_nguoi_dung; }
    public void setId_nguoi_dung(String id_nguoi_dung) { this.id_nguoi_dung = id_nguoi_dung; }
}