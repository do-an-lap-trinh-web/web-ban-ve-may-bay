package com.edu.hcmuaf.fit.webbanvemaybay.services.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.admin.VeDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.Ve;

import java.util.List;

public class VeService {
    public List<Ve> getAllVe() {
        VeDAO veDAO = new VeDAO();
        return veDAO.getAllVe();
    }
}
