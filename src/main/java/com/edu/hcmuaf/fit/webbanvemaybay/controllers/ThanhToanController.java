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
        int ptGiam = tinhPhanTramGiam(request.getParameter("voucherCode"));
        int diemThuong = getDiemThuong(session);
        int diemMuonDoi = parseSoKhongAm(request.getParameter("diemDoi"));

        VeDAO veDAO = new VeDAO();
        double giaGoc = veDAO.getVeById(Integer.parseInt(idVe)).getGia();
        double tongSauVoucher = giaGoc * soLuong * (1 - ptGiam / 100.0);
        int diemDoi = Math.min(Math.min(diemMuonDoi, diemThuong), (int) (tongSauVoucher / GIA_TRI_MOT_DIEM));
        double tongThanhToan = tongSauVoucher - (diemDoi * GIA_TRI_MOT_DIEM);

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
