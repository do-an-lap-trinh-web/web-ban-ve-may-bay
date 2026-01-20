package com.edu.hcmuaf.fit.webbanvemaybay.models.giohang;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDto;

public class GioHangItem {
    private VeDto veDto;
    private int soLuong;

    @Override
    public String toString() {
        return "GioHangItem{" +
                "veDto=" + veDto.toString() +
                ", soLuong=" + soLuong +
                '}';
    }

    public VeDto getVeDto() {
        return veDto;
    }

    public void setVeDto(VeDto veDto) {
        this.veDto = veDto;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
}
