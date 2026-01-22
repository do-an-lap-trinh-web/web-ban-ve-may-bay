package com.edu.hcmuaf.fit.webbanvemaybay.services.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.admin.LoaiVeDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.LoaiVe;

import java.util.ArrayList;
import java.util.List;

public class LoaiVeService {
    public String addLoaiVe(LoaiVe loaiVe) {
        LoaiVeDAO loaiVeDAO = new LoaiVeDAO();
        return loaiVeDAO.addLoaiVe(loaiVe);
    }

    public List<LoaiVe> getAllLoaiVe() {
        LoaiVeDAO loaiVeDAO = new LoaiVeDAO();
        List<LoaiVe> listLoaiVe = loaiVeDAO.getAllLoaiVe();
        return listLoaiVe;
    }

    public String xoaLoaiVe(String idLoaiVe) {
        LoaiVeDAO loaiVeDAO = new LoaiVeDAO();
        return loaiVeDAO.xoaLoaiVe(idLoaiVe);
    }

    public LoaiVe getLoaiVeById(String id) {
        LoaiVeDAO loaiVeDAO = new LoaiVeDAO();
        return loaiVeDAO.getLoaiVeById(id);
    }

    public boolean updateLoaiVe(LoaiVe loaiVe) {
        LoaiVeDAO loaiVeDAO = new LoaiVeDAO();
        return loaiVeDAO.updateLoaiVe(loaiVe);
    }
}
