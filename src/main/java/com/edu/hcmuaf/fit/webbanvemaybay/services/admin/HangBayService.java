package com.edu.hcmuaf.fit.webbanvemaybay.services.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.HangBayDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.HangBay;

import java.util.List;

public class HangBayService {
    public List<HangBay> getAllHangBay() {
        HangBayDAO hangBayDAO = new HangBayDAO();
        List<HangBay> listHangBay = hangBayDAO.getAllHangBay();
        return listHangBay != null ? listHangBay : null;
    }
}
