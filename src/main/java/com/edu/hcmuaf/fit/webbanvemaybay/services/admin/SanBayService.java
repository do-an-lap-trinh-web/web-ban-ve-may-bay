package com.edu.hcmuaf.fit.webbanvemaybay.services.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.admin.SanBayDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.SanBay;

import java.util.List;

public class SanBayService {
    public List<SanBay> getAllSanBay() {
        SanBayDAO sanBayDAO = new SanBayDAO();
        return sanBayDAO.getAllSanBay();
    }

    public boolean addSanBay(SanBay sanBay) {
        SanBayDAO sanBayDAO = new SanBayDAO();
        return sanBayDAO.addSanBay(sanBay);
    }

    public SanBay getSanBayById(String id) {
        SanBayDAO sanBayDAO = new SanBayDAO();
        return sanBayDAO.getSanBayById(id);
    }

    public boolean updateSanBayById(SanBay sanBay) {
        SanBayDAO sanBayDAO = new SanBayDAO();
        return sanBayDAO.updateSanBayById(sanBay);
    }

    public boolean removeSanBayById(String id) {
        SanBayDAO sanBayDAO = new SanBayDAO();
        return sanBayDAO.removeSanBayById(id);
    }
}
