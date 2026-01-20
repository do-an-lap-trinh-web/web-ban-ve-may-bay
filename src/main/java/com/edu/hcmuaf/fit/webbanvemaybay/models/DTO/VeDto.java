package com.edu.hcmuaf.fit.webbanvemaybay.models.DTO;

public class VeDto {
    private int idVe;
    private String khoiHanh;
    private String haCanh;
    private String hangGhe;
    private String diemDi;
    private String diemDen;
    private String sanBayDi;
    private String sanBayDen;
    private String gia;
    private String thoiGianKhoiHanh;
    private String thoiGianHaCanh;
    private String hangBay;
    private String soHieuChuyenBay;

    @Override
    public String toString() {
        return "VeDto{" +
                "idVe=" + idVe +
                ", khoiHanh='" + khoiHanh + '\'' +
                ", haCanh='" + haCanh + '\'' +
                ", hangGhe='" + hangGhe + '\'' +
                ", diemDi='" + diemDi + '\'' +
                ", diemDen='" + diemDen + '\'' +
                ", sanBayDi='" + sanBayDi + '\'' +
                ", sanBayDen='" + sanBayDen + '\'' +
                ", gia='" + gia + '\'' +
                ", thoiGianKhoiHanh='" + thoiGianKhoiHanh + '\'' +
                ", thoiGianHaCanh='" + thoiGianHaCanh + '\'' +
                ", HangBay='" + hangBay + '\'' +
                ", soHieuChuyenBay='" + soHieuChuyenBay + '\'' +
                '}';
    }

    public int getIdVe() {
        return idVe;
    }

    public void setIdVe(int idVe) {
        this.idVe = idVe;
    }

    public String getSanBayDi() {
        return sanBayDi;
    }

    public void setSanBayDi(String sanBayDi) {
        this.sanBayDi = sanBayDi;
    }

    public String getSanBayDen() {
        return sanBayDen;
    }

    public void setSanBayDen(String sanBayDen) {
        this.sanBayDen = sanBayDen;
    }

    public String getKhoiHanh() {
        return khoiHanh;
    }

    public void setKhoiHanh(String khoiHanh) {
        this.khoiHanh = khoiHanh;
    }

    public String getHaCanh() {
        return haCanh;
    }

    public void setHaCanh(String haCanh) {
        this.haCanh = haCanh;
    }

    public String getHangGhe() {
        return hangGhe;
    }

    public void setHangGhe(String hangGhe) {
        this.hangGhe = hangGhe;
    }

    public String getDiemDi() {
        return diemDi;
    }

    public void setDiemDi(String diemDi) {
        this.diemDi = diemDi;
    }

    public String getDiemDen() {
        return diemDen;
    }

    public void setDiemDen(String diemDen) {
        this.diemDen = diemDen;
    }


    public String getGia() {
        return gia;
    }

    public void setGia(String gia) {
        this.gia = gia;
    }

    public String getThoiGianKhoiHanh() {
        return thoiGianKhoiHanh;
    }

    public void setThoiGianKhoiHanh(String thoiGianKhoiHanh) {
        this.thoiGianKhoiHanh = thoiGianKhoiHanh;
    }

    public String getThoiGianHaCanh() {
        return thoiGianHaCanh;
    }

    public void setThoiGianHaCanh(String thoiGianHaCanh) {
        this.thoiGianHaCanh = thoiGianHaCanh;
    }

    public String getHangBay() {
        return hangBay;
    }

    public void setHangBay(String hangBay) {
        this.hangBay = hangBay;
    }

    public String getSoHieuChuyenBay() {
        return soHieuChuyenBay;
    }

    public void setSoHieuChuyenBay(String soHieuChuyenBay) {
        this.soHieuChuyenBay = soHieuChuyenBay;
    }
}
