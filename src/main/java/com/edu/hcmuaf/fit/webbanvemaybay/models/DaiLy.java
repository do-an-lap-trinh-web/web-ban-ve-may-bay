package com.edu.hcmuaf.fit.webbanvemaybay.models;

public class DaiLy {
    private int id;
    private String diaChi;
    private String soDienThoai;
    private String email;
    private String linkFb;
    private String linkYt;
    private String linkTiktok;

    public DaiLy() {}

    // Getters & Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDiaChi() { return diaChi; }
    public void setDiaChi(String diaChi) { this.diaChi = diaChi; }
    public String getSoDienThoai() { return soDienThoai; }
    public void setSoDienThoai(String soDienThoai) { this.soDienThoai = soDienThoai; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getLinkFb() { return linkFb; }
    public void setLinkFb(String linkFb) { this.linkFb = linkFb; }
    public String getLinkYt() { return linkYt; }
    public void setLinkYt(String linkYt) { this.linkYt = linkYt; }
    public String getLinkTiktok() { return linkTiktok; }
    public void setLinkTiktok(String linkTiktok) { this.linkTiktok = linkTiktok; }
}