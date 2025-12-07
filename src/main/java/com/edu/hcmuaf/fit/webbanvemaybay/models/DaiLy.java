package com.edu.hcmuaf.fit.webbanvemaybay.models;

public class DaiLy {
    private int id_dai_ly;
    private String dia_chi;
    private String so_dien_thoai;
    private String email;
    private String link_fb;
    private String link_yt;
    private String link_tiktok;

    public DaiLy(int id_dai_ly, String dia_chi, String so_dien_thoai, String email, String link_fb, String link_yt, String link_tiktok) {
        this.id_dai_ly = id_dai_ly;
        this.dia_chi = dia_chi;
        this.so_dien_thoai = so_dien_thoai;
        this.email = email;
        this.link_fb = link_fb;
        this.link_yt = link_yt;
        this.link_tiktok = link_tiktok;
    }

    public DaiLy() {
    }

    public int getId_dai_ly() {
        return id_dai_ly;
    }

    public void setId_dai_ly(int id_dai_ly) {
        this.id_dai_ly = id_dai_ly;
    }

    public String getDia_chi() {
        return dia_chi;
    }

    public void setDia_chi(String dia_chi) {
        this.dia_chi = dia_chi;
    }

    public String getSo_dien_thoai() {
        return so_dien_thoai;
    }

    public void setSo_dien_thoai(String so_dien_thoai) {
        this.so_dien_thoai = so_dien_thoai;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLink_fb() {
        return link_fb;
    }

    public void setLink_fb(String link_fb) {
        this.link_fb = link_fb;
    }

    public String getLink_yt() {
        return link_yt;
    }

    public void setLink_yt(String link_yt) {
        this.link_yt = link_yt;
    }

    public String getLink_tiktok() {
        return link_tiktok;
    }

    public void setLink_tiktok(String link_tiktok) {
        this.link_tiktok = link_tiktok;
    }
}
