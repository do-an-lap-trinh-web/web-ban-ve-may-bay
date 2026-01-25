package com.edu.hcmuaf.fit.webbanvemaybay.services.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.admin.ChuyenBayDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.ChuyenBay;

import java.util.List;

public class ChuyenBayService {

    public List<ChuyenBay> getChuyenBayByPage(int page, int pageSize) {
        ChuyenBayDAO chuyenBayDAO = new ChuyenBayDAO();
        int offset = (page - 1) * pageSize;
        return chuyenBayDAO.getChuyenBayByPage(offset, pageSize);
    }

    public int getTotalPages(int pageSize) {
        ChuyenBayDAO chuyenBayDAO = new ChuyenBayDAO();
        int totalRecords = chuyenBayDAO.getTotalChuyenBayCount();
        return (int) Math.ceil((double) totalRecords / pageSize);
    }

    public boolean addChuyenBay(ChuyenBay chuyenBay) {
        ChuyenBayDAO chuyenBayDAO = new ChuyenBayDAO();
        return chuyenBayDAO.addChuyenBay(chuyenBay);
    }

    public ChuyenBay getChuyenBayById(String id) {
        ChuyenBayDAO chuyenBayDAO = new ChuyenBayDAO();
        return chuyenBayDAO.getChuyenBayById(id);
    }

    public boolean updateChuyenBayById(ChuyenBay chuyenBay) {
        ChuyenBayDAO chuyenBayDAO = new ChuyenBayDAO();
        return chuyenBayDAO.updateChuyenBayById(chuyenBay);
    }

    public boolean removeChuyenBayById(String id) {
        ChuyenBayDAO chuyenBayDAO = new ChuyenBayDAO();
        return chuyenBayDAO.removeChuyenBayById(id);
    }
}
