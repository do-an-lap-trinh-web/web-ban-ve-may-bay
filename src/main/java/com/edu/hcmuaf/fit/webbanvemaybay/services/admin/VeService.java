package com.edu.hcmuaf.fit.webbanvemaybay.services.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.admin.VeDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.Ve;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.FormatVND;

import java.util.List;

public class VeService {
    VeDAO veDAO = new VeDAO();

    public List<Ve> getVeByPage(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return veDAO.getVeByPage(offset, pageSize);
    }

    public int getTotalPages(int pageSize) {
        int totalRecords = veDAO.getTotalVeCount();
        return (int) Math.ceil((double) totalRecords / pageSize);
    }

    public boolean addVe(Ve ve) {
        return veDAO.addVe(ve);
    }

    public Ve getVeById(String id) {
        return veDAO.getVeById(id);
    }

    public boolean updateVeById(Ve ve) {
        return veDAO.updateVeById(ve);
    }

    public boolean removeVeById(String id) {
        return veDAO.removeVeById(id);
    }

    public List<Ve> getVeByPageAndInput(int page, int pageSize, String input) {
        int offset = (page - 1) * pageSize;
        return veDAO.getVeByPageAndInput(offset, pageSize, input);
    }

    public int getTotalPagesByInput(int pageSize, String input) {
        int totalRecords = veDAO.getTotalVeCountByInput(input);
        return (int) Math.ceil((double) totalRecords / pageSize);
    }
}
