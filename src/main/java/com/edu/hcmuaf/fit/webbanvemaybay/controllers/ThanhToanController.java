package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDaDatDto;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDto;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DatVe;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.dao.VeDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.services.DatVeService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.TimVeService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.FormatVND;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ThanhToanController", value = "/ThanhToanController")
public class ThanhToanController extends HttpServlet {
    private static final DateTimeFormatter NGAY_DAT_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
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

    private int getDiemThuong(HttpSession session) {
        Object diemThuong = session.getAttribute("diemThuong");
        if (diemThuong instanceof Integer) {
            return (Integer) diemThuong;
        }
        session.setAttribute("diemThuong", 0);
        return 0;
    }

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

    private void luuVoucherDaThanhToan(HttpSession session, int idVe, int soLuong, String ngayDat, int ptGiam) {
        if (ptGiam <= 0) {
            return;
        }

        Map<String, List<Integer>> voucherDaThanhToan = (Map<String, List<Integer>>) session.getAttribute("voucherDaThanhToan");
        if (voucherDaThanhToan == null) {
            voucherDaThanhToan = new HashMap<>();
        }

        String key = idVe + "|" + soLuong + "|" + ngayDat;
        List<Integer> danhSachGiamGia = voucherDaThanhToan.get(key);
        if (danhSachGiamGia == null) {
            danhSachGiamGia = new ArrayList<>();
            voucherDaThanhToan.put(key, danhSachGiamGia);
        }
        danhSachGiamGia.add(0, ptGiam);
        session.setAttribute("voucherDaThanhToan", voucherDaThanhToan);
    }

    private void luuGiaDaThanhToan(HttpSession session, int idVe, int soLuong, String ngayDat, double giaMotVeDaThanhToan) {
        Map<String, List<String>> giaDaThanhToan = (Map<String, List<String>>) session.getAttribute("giaDaThanhToan");
        if (giaDaThanhToan == null) {
            giaDaThanhToan = new HashMap<>();
        }

        String key = idVe + "|" + soLuong + "|" + ngayDat;
        List<String> danhSachGia = giaDaThanhToan.get(key);
        if (danhSachGia == null) {
            danhSachGia = new ArrayList<>();
            giaDaThanhToan.put(key, danhSachGia);
        }
        danhSachGia.add(0, FormatVND.formatVND(giaMotVeDaThanhToan));
        session.setAttribute("giaDaThanhToan", giaDaThanhToan);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        VeDAO veDAO = new VeDAO();
        double giaGoc = veDAO.getVeById(Integer.parseInt(idVe)).getGia();

        TimVeService timVeService = new TimVeService();
        VeDto veInfo = timVeService.getVeByIdVe(Integer.parseInt(idVe));

        Voucher voucher = timVoucher(voucherCode);
        double tongGoc = giaGoc * soLuong;
        double giamGia = tinhTienGiamVoucher(voucher, tongGoc, veInfo != null ? veInfo.getHangBay() : null);
        double tongSauVoucher = tongGoc - giamGia;
        int diemDoi = Math.min(Math.min(diemMuonDoi, diemThuong), (int) Math.floor((tongSauVoucher * 0.1) / GIA_TRI_MOT_DIEM));
        double tongThanhToan = tongSauVoucher - (diemDoi * GIA_TRI_MOT_DIEM);
        int ptGiam = voucher != null ? voucher.percent : 0;

        User user = (User) session.getAttribute("user");
        if (user != null) {
            DatVe datVe = new DatVe();
            datVe.setIdVe(Integer.parseInt(idVe));
            datVe.setSoLuong(soLuong);
            datVe.setNgayDat(LocalDateTime.now().format(NGAY_DAT_FORMATTER));
            datVe.setIdUser(user.getId());
            DatVeService datVeService = new DatVeService();
            boolean isDatVe = datVeService.datVeByUser(datVe);
            if (isDatVe) {
                int diemNhan = (int) (tongThanhToan / 100000);
                session.setAttribute("diemThuong", diemThuong - diemDoi + diemNhan);
                luuVoucherDaThanhToan(session, datVe.getIdVe(), datVe.getSoLuong(), datVe.getNgayDat(), ptGiam);
                luuGiaDaThanhToan(session, datVe.getIdVe(), datVe.getSoLuong(), datVe.getNgayDat(), tongThanhToan / datVe.getSoLuong());
                response.sendRedirect(request.getContextPath() + "/VeDaDatController");
            }
            request.setAttribute("message", "Lỗi đặt vé");
        } else {
            request.setAttribute("message", "bạn phải đăng nhập trước khi đặt vé");
            request.getRequestDispatcher("page/dang_nhap/dang_nhap.jsp").forward(request, response);
        }
    }
}
