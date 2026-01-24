package com.edu.hcmuaf.fit.webbanvemaybay.services.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.admin.VeDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.Ve;

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
}
