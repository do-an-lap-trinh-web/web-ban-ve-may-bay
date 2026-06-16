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
    private static final double TY_LE_DOI_DIEM_TOI_DA = 0.1;

    private static class Voucher {
        private final String code;
        private final String airlineKeyword;
        private final double minOrder;
        private final int percent;
        private final double fixedDiscount;
        private final double maxDiscount;

        private Voucher(String code, String airlineKeyword, double minOrder, int percent, double fixedDiscount, double maxDiscount) {
            this.code = code;
            this.airlineKeyword = airlineKeyword;
            this.minOrder = minOrder;
            this.percent = percent;
            this.fixedDiscount = fixedDiscount;
            this.maxDiscount = maxDiscount;
        }

        private boolean appliesToAirline(String airline) {
            return airlineKeyword == null || (airline != null && airline.contains(airlineKeyword));
        }
    }

    private static final Voucher[] VOUCHERS = {
            new Voucher("FLIGHT50K", null, 1500000, 0, 50000, 50000),
            new Voucher("BAY100K", null, 3000000, 0, 100000, 100000),
            new Voucher("WEEKEND5", null, 2000000, 5, 0, 150000),
            new Voucher("VNA200K", "Vietnam Airlines", 5000000, 0, 200000, 200000)
    };

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

    private Voucher timVoucher(String voucherCode) {
        if (voucherCode == null || voucherCode.trim().isEmpty()) {
            return null;
        }

        String code = voucherCode.trim().toUpperCase();
        for (Voucher voucher : VOUCHERS) {
            if (voucher.code.equals(code)) {
                return voucher;
            }
        }
        return null;
    }

    private double tinhTienGiamVoucher(Voucher voucher, double tongGoc, String hangBay) {
        if (voucher == null || tongGoc < voucher.minOrder || !voucher.appliesToAirline(hangBay)) {
            return 0;
        }

        double tienGiam = voucher.fixedDiscount;
        if (voucher.percent > 0) {
            tienGiam = tongGoc * voucher.percent / 100.0;
        }
        return Math.min(Math.min(tienGiam, voucher.maxDiscount), tongGoc);
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
            request.setAttribute("messageLogin", "Bạn phải đăng nhập!");
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

        Voucher voucher = timVoucher(voucherCode);
        double giaGoc = ve.getGia();
        double tongGoc = giaGoc * soLuong;
        double giamGia = tinhTienGiamVoucher(voucher, tongGoc, veInfo.getHangBay());
        double tongSauVoucher = tongGoc - giamGia;
        int diemDoiToiDaTheoDon = (int) Math.floor((tongSauVoucher * TY_LE_DOI_DIEM_TOI_DA) / GIA_TRI_MOT_DIEM);
        int diemDoi = Math.min(Math.min(diemMuonDoi, diemThuong), diemDoiToiDaTheoDon);
        double giamGiaDiem = diemDoi * GIA_TRI_MOT_DIEM;
        double tongGiaVal = tongSauVoucher - giamGiaDiem;
        int diemDuKienNhan = (int) (tongGiaVal / 100000);

        request.setAttribute("veInfo", veInfo);
        request.setAttribute("tongGia", FormatVND.formatVND(tongGiaVal));
        request.setAttribute("soLuong", soLuong);
        request.setAttribute("voucherCode", voucher == null || giamGia <= 0 ? "" : voucher.code);
        request.setAttribute("giamGia", FormatVND.formatVND(giamGia));
        request.setAttribute("ptGiam", voucher == null ? 0 : voucher.percent);
        request.setAttribute("diemThuong", diemThuong);
        request.setAttribute("diemDoi", diemDoi);
        request.setAttribute("giamGiaDiem", FormatVND.formatVND(giamGiaDiem));
        request.setAttribute("diemDuKienNhan", diemDuKienNhan);
        request.setAttribute("giaTriMotDiem", GIA_TRI_MOT_DIEM);
        request.setAttribute("giamGiaVoucher", giamGia);
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
