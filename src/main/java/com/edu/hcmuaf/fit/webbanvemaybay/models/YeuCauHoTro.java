package com.edu.hcmuaf.fit.webbanvemaybay.models;

import java.io.Serializable;
import java.sql.Timestamp;

public class YeuCauHoTro implements Serializable {
    private int id;
    private String hoTen;
    private String email;
    private String noiDung;
    private Timestamp ngayGui;

    public YeuCauHoTro() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getHoTen() { return hoTen; }
    public void setHoTen(String hoTen) { this.hoTen = hoTen; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getNoiDung() { return noiDung; }
    public void setNoiDung(String noiDung) { this.noiDung = noiDung; }

    public Timestamp getNgayGui() { return ngayGui; }
    public void setNgayGui(Timestamp ngayGui) { this.ngayGui = ngayGui; }
}