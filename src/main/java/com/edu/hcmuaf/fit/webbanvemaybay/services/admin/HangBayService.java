package com.edu.hcmuaf.fit.webbanvemaybay.services.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.admin.HangBayDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.HangBay;

import java.util.List;

public class HangBayService {
    public List<HangBay> getAllHangBay() {
        HangBayDAO hangBayDAO = new HangBayDAO();
        List<HangBay> listHangBay = hangBayDAO.getAllHangBay();
        return listHangBay != null ? listHangBay : null;
    }

    public HangBay getHangBayById(int id) {
        HangBayDAO hangBayDAO = new HangBayDAO();
        HangBay hangBay = hangBayDAO.getHangBayById(id);
        return hangBay ==  null ? null : hangBay;
    }

    public boolean updateHangBay(HangBay hangBay) {
        HangBayDAO hangBayDAO = new HangBayDAO();
        return hangBayDAO.updateHangBay(hangBay);
    }

    public boolean removeHangBayById(String id) {
        HangBayDAO hangBayDAO = new HangBayDAO();
        return hangBayDAO.removeHangBayById(id);
    }
}
