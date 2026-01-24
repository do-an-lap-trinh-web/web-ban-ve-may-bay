package com.edu.hcmuaf.fit.webbanvemaybay.services;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.ThongTinNguoiDungDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.ThongTinNguoiDung;

public class ThongTinNguoiDungService {
    public ThongTinNguoiDung getThongTinNguoiDungByIdUser(String id) {
        ThongTinNguoiDungDAO thongTinNguoiDungDAO = new ThongTinNguoiDungDAO();
        return thongTinNguoiDungDAO.getThongTinNguoiDungByIdUser(id);
    }
}
