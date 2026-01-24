package com.edu.hcmuaf.fit.webbanvemaybay.services.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.admin.SanBayDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.SanBay;

import java.util.List;

public class SanBayService {
    public List<SanBay> getAllSanBay() {
        SanBayDAO sanBayDAO = new SanBayDAO();
        return sanBayDAO.getAllSanBay();
    }
}
