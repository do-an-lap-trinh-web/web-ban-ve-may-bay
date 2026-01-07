package com.edu.hcmuaf.fit.webbanvemaybay.services.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.admin.SoHieuChuyenBayDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.SoHieuChuyenBay;

import java.util.List;

public class SoHieuChuyenBayService {

    private SoHieuChuyenBayDAO soHieuChuyenBayDAO = new SoHieuChuyenBayDAO();

    public List<SoHieuChuyenBay> getListSoHieuChuyenBay() {
        return soHieuChuyenBayDAO.getListSoHieuChuyenBay();
    }

    public String addSoHieuChuyenBay(SoHieuChuyenBay soHieuChuyenBay) {
        if ("".equals(soHieuChuyenBay.getMaChuyenBay())) {
            return "Mã chuyến bay không được để trống";
        }
        return soHieuChuyenBayDAO.addSoHieuChuyenBay(soHieuChuyenBay);
    }
}
