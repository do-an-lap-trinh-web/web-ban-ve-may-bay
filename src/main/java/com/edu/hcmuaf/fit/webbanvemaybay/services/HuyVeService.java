package com.edu.hcmuaf.fit.webbanvemaybay.services;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.VeDaDatDAO;

public class HuyVeService {
    public boolean huyVe(String idVe, int idUser) {
        VeDaDatDAO veDaDatDAO = new VeDaDatDAO();
        boolean isRemove = veDaDatDAO.remoteVeById(idVe, idUser);
        if (isRemove) {
            return true;
        }
        return false;
    }
}
