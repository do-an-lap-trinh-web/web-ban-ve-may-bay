package com.edu.hcmuaf.fit.webbanvemaybay.models.DTO;

public class DeXuatVeDto {
    private VeDto veDto;
    private int soLuongTon;
    private String voucherCode;
    private int phanTramGiam;
    private String giaDaGiam;

    public VeDto getVeDto() {
        return veDto;
    }

    public void setVeDto(VeDto veDto) {
        this.veDto = veDto;
    }

    public int getSoLuongTon() {
        return soLuongTon;
    }

    public void setSoLuongTon(int soLuongTon) {
        this.soLuongTon = soLuongTon;
    }

    public String getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode;
    }

    public int getPhanTramGiam() {
        return phanTramGiam;
    }

    public void setPhanTramGiam(int phanTramGiam) {
        this.phanTramGiam = phanTramGiam;
    }

    public String getGiaDaGiam() {
        return giaDaGiam;
    }

    public void setGiaDaGiam(String giaDaGiam) {
        this.giaDaGiam = giaDaGiam;
    }
}
