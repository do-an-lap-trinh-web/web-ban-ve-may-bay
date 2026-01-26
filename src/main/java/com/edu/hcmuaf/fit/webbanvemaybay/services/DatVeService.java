package com.edu.hcmuaf.fit.webbanvemaybay.services;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.VeDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.dao.VeDaDatDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDaDatDto;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDto;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DatVe;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.VeService;

import java.util.ArrayList;
import java.util.List;

public class DatVeService {


    public Boolean datVeByUser(DatVe datVe) {
        VeDaDatDAO veDaDatDAO = new VeDaDatDAO();
        boolean isAdd = veDaDatDAO.addVeDaDat(datVe);
        VeDAO veDAO = new VeDAO();
        List<DatVe> listDatVe =  new ArrayList<>();
        listDatVe.add(datVe);
        boolean isSetSoLuongVe = veDAO.setSoLuongVe(listDatVe);
        if (isAdd && isSetSoLuongVe) {
            return true;
        }
        return false;
    }

    public List<DatVe> getAllVeDaDatByUser(int id) {
        VeDaDatDAO veDaDatDAO = new VeDaDatDAO();
        return veDaDatDAO.getAllVeDaDatByUser(id);
    }

    public boolean datListVeByUser(List<DatVe> datVeList) {
        VeDaDatDAO veDaDatDAO = new VeDaDatDAO();
        int soLuong = 0;
        for (DatVe datVe : datVeList) {
            boolean isAdd = veDaDatDAO.addVeDaDat(datVe);
            if (isAdd) {
                soLuong++;
            }
        }
        VeDAO veDAO = new VeDAO();
        boolean isSetSoLuongVe = veDAO.setSoLuongVe(datVeList);
        if ((soLuong == datVeList.size()) && isSetSoLuongVe) {
            return true;
        }
        return false;
    }
}
