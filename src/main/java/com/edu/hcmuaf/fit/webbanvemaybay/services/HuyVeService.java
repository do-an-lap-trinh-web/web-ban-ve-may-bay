package com.edu.hcmuaf.fit.webbanvemaybay.services;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.VeDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.dao.VeDaDatDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.dao.ChuyenBayDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DatVe;
import com.edu.hcmuaf.fit.webbanvemaybay.models.Ve;
import com.edu.hcmuaf.fit.webbanvemaybay.models.ChuyenBay;

import java.util.ArrayList;
import java.util.List;
import java.time.LocalDateTime;

public class HuyVeService {
    public boolean huyVe(String idVe, int idUser) {
        VeDAO veDAO = new VeDAO();
        Ve ve = veDAO.getVeById(Integer.parseInt(idVe));
        if (ve == null) {
            return false;
        }
        ChuyenBayDAO chuyenBayDAO = new ChuyenBayDAO();
        ChuyenBay chuyenBay = chuyenBayDAO.getChuyenBayById(ve.getIdChuyenBay());
        if (chuyenBay == null || chuyenBay.getThoiGianKhoiHanh() == null) {
            return false;
        }
        try {
            String depTimeStr = chuyenBay.getThoiGianKhoiHanh().replace(" ", "T");
            if (depTimeStr.contains(".")) {
                depTimeStr = depTimeStr.substring(0, depTimeStr.indexOf("."));
            }
            LocalDateTime departureTime = LocalDateTime.parse(depTimeStr);
            if (!LocalDateTime.now().plusDays(1).isBefore(departureTime)) {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        VeDaDatDAO veDaDatDAO = new VeDaDatDAO();
        List<DatVe> listDatVe = veDaDatDAO.getAllVeDaDatByUser(idUser);
        DatVe datVe = null;
        for (DatVe datV : listDatVe) {
            if (datV.getIdVe() == Integer.parseInt(idVe)) {
                datVe = new DatVe();
                datVe.setId(datV.getId());
                datVe.setIdUser(datV.getIdUser());
                datVe.setIdVe(datV.getIdVe());
                datVe.setNgayDat(datV.getNgayDat());
                datVe.setSoLuong(datV.getSoLuong());
                break;
            }
        }
        if (datVe == null) {
            return false;
        }
        List<DatVe> listVe = new ArrayList<DatVe>();
        listVe.add(datVe);
        boolean isSetSoLuongVe = veDAO.addSoLuongVe(listVe);
        boolean isRemove = veDaDatDAO.remoteVeById(idVe, idUser);
        if (isRemove && isSetSoLuongVe) {
            return true;
        }
        return false;
    }
}
