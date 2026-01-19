package com.edu.hcmuaf.fit.webbanvemaybay.models.DTO;

import java.util.List;

public class ThongTinTimVeDto {
    private List<String> listKhoiHanh;
    private List<String> listHaCanh;
    private List<String> listHangGhe;
    private List<String> listDiemDi;
    private List<String> listDiemDen;

    public List<String> getListKhoiHanh() {
        return listKhoiHanh;
    }

    public void setListKhoiHanh(List<String> listKhoiHanh) {
        this.listKhoiHanh = listKhoiHanh;
    }

    public List<String> getListHaCanh() {
        return listHaCanh;
    }

    public void setListHaCanh(List<String> listHaCanh) {
        this.listHaCanh = listHaCanh;
    }

    public List<String> getListHangGhe() {
        return listHangGhe;
    }

    public void setListHangGhe(List<String> listHangGhe) {
        this.listHangGhe = listHangGhe;
    }

    public List<String> getListDiemDi() {
        return listDiemDi;
    }

    public void setListDiemDi(List<String> listDiemDi) {
        this.listDiemDi = listDiemDi;
    }

    public List<String> getListDiemDen() {
        return listDiemDen;
    }

    public void setListDiemDen(List<String> listDiemDen) {
        this.listDiemDen = listDiemDen;
    }

    @Override
    public String toString() {
        return "ThongTinTimVeDto{" +
                "listKhoiHanh=" + listKhoiHanh +
                ", listHaCanh=" + listHaCanh +
                ", listHangGhe=" + listHangGhe +
                ", listDiemDi=" + listDiemDi +
                ", listDiemDen=" + listDiemDen +
                '}';
    }
}
