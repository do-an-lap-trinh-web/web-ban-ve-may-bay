package com.edu.hcmuaf.fit.webbanvemaybay.services;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.VeDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.dao.VeDaDatDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DatVe;

import java.util.ArrayList;
import java.util.List;

public class HuyVeService {
    public boolean huyVe(String idVe, int idUser) {
        VeDaDatDAO veDaDatDAO = new VeDaDatDAO();
        List<DatVe> listDatVe = veDaDatDAO.getAllVeDaDatByUser(idUser);
        DatVe datVe = new DatVe();
        for (DatVe datV : listDatVe) {
            if (datV.getIdVe() == Integer.parseInt(idVe)) {
                datVe.setId(datV.getId());
                datVe.setIdUser(datV.getIdUser());
                datVe.setIdVe(datV.getIdVe());
                datVe.setNgayDat(datV.getNgayDat());
                datVe.setSoLuong(datV.getSoLuong());
                break;
            }
        }
        List<DatVe> listVe = new ArrayList<DatVe>();
        listVe.add(datVe);
        VeDAO veDAO = new VeDAO();
        boolean isSetSoLuongVe = veDAO.addSoLuongVe(listVe);
        boolean isRemove = veDaDatDAO.remoteVeById(idVe, idUser);
        if (isRemove && isSetSoLuongVe) {
            return true;
        }
        return false;
    }
}
