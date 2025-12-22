package com.edu.hcmuaf.fit.webbanvemaybay.services.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.admin.LoaiVeDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.LoaiVe;

public class LoaiVeService {
    public String addLoaiVe(LoaiVe loaiVe) {
        LoaiVeDAO loaiVeDAO = new LoaiVeDAO();
        return loaiVeDAO.addLoaiVe(loaiVe);
    }
}
