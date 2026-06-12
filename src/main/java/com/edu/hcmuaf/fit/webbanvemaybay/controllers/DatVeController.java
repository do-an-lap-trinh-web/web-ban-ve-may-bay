package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDto;
import com.edu.hcmuaf.fit.webbanvemaybay.services.TimVeService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.FormatVND;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DatVeController", value = "/DatVeController")
public class DatVeController extends HttpServlet {
    private static final int GIA_TRI_MOT_DIEM = 1000;

    private int parseSoLuongHopLe(String soLuong) {
        try {
            int soLuongParsed = Integer.parseInt(soLuong);
            return Math.max(soLuongParsed, 1);
        } catch (NumberFormatException e) {
            return 1;
        }
    }

    private int parseSoKhongAm(String value) {
        try {
            int parsed = Integer.parseInt(value);
            return Math.max(parsed, 0);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private int tinhPhanTramGiam(String voucherCode) {
        if (voucherCode == null || voucherCode.trim().isEmpty()) {
            return 0;
        }

        String code = voucherCode.trim().toUpperCase();
        if (code.equals("SALE30")) return 30;
        if (code.equals("SALE20")) return 20;
        if (code.equals("SALE15")) return 15;
        return 0;
    }

    private int getDiemThuong(HttpSession session) {
        Object diemThuong = session.getAttribute("diemThuong");
        if (diemThuong instanceof Integer) {
            return (Integer) diemThuong;
        }
        session.setAttribute("diemThuong", 0);
        return 0;
    }

    private void hienThiXacNhanDatVe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            request.setAttribute("messageLogin", "Ban phai dang nhap!");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        String idVe = request.getParameter("idVe");
        int soLuong = parseSoLuongHopLe(request.getParameter("soLuong"));
        String voucherCode = request.getParameter("voucherCode");
        int diemThuong = getDiemThuong(session);
        int diemMuonDoi = parseSoKhongAm(request.getParameter("diemDoi"));

        TimVeService timVeService = new TimVeService();
        VeDto veInfo = timVeService.getVeByIdVe(Integer.parseInt(idVe));

        com.edu.hcmuaf.fit.webbanvemaybay.dao.VeDAO veDAO = new com.edu.hcmuaf.fit.webbanvemaybay.dao.VeDAO();
        com.edu.hcmuaf.fit.webbanvemaybay.models.Ve ve = veDAO.getVeById(Integer.parseInt(idVe));

        int ptGiam = tinhPhanTramGiam(voucherCode);
        double giaGoc = ve.getGia();
        double giamGia = giaGoc * (ptGiam / 100.0) * soLuong;
        double tongSauVoucher = (giaGoc * soLuong) - giamGia;
        int diemDoi = Math.min(Math.min(diemMuonDoi, diemThuong), (int) (tongSauVoucher / GIA_TRI_MOT_DIEM));
        double giamGiaDiem = diemDoi * GIA_TRI_MOT_DIEM;
        double tongGiaVal = tongSauVoucher - giamGiaDiem;
        int diemDuKienNhan = (int) (tongGiaVal / 100000);

        request.setAttribute("veInfo", veInfo);
        request.setAttribute("tongGia", FormatVND.formatVND(tongGiaVal));
        request.setAttribute("soLuong", soLuong);
        request.setAttribute("voucherCode", voucherCode);
        request.setAttribute("giamGia", FormatVND.formatVND(giamGia));
        request.setAttribute("ptGiam", ptGiam);
        request.setAttribute("diemThuong", diemThuong);
        request.setAttribute("diemDoi", diemDoi);
        request.setAttribute("giamGiaDiem", FormatVND.formatVND(giamGiaDiem));
        request.setAttribute("diemDuKienNhan", diemDuKienNhan);
        request.setAttribute("giaTriMotDiem", GIA_TRI_MOT_DIEM);
        request.getRequestDispatcher("page/xac_nhan_dat_ve/xac_nhan_dat_ve.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        hienThiXacNhanDatVe(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        hienThiXacNhanDatVe(request, response);
    }
}
