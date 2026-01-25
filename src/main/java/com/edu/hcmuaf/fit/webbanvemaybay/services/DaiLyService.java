package com.edu.hcmuaf.fit.webbanvemaybay.services;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.DaiLyDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DaiLy;

public class DaiLyService {
    public DaiLy getDaiLy() {
        DaiLyDAO daiLyDAO = new DaiLyDAO();
        return daiLyDAO.getDaiLy();
    }
}
