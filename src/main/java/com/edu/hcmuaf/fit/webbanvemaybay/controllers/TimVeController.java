package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDto;
import com.edu.hcmuaf.fit.webbanvemaybay.services.TimVeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;

@WebServlet(name = "TimVeController", value = "/TimVeController")
public class TimVeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String khoiHanh = request.getParameter("khoi_hanh");
        String haCanh = request.getParameter("ha_canh");
        String hang_ghe = request.getParameter("hang_ghe");
        String diemDi = request.getParameter("diem_di");
        String diemDen =  request.getParameter("diem_den");
        String isXepVe = request.getParameter("is_xep_ve");
        String ngayDi = request.getParameter("ngay_di");
        boolean xepVe = "on".equals(isXepVe) ? true : false;

        String loaiHinh = request.getParameter("loai_hinh");
        String ngayVe = request.getParameter("ngay_ve");
        String ngayVeLinhHoat = request.getParameter("ngay_ve_linh_hoat");

        boolean isRoundTrip = "round_trip".equals(loaiHinh);
        boolean isReturnFlexible = "on".equals(ngayVeLinhHoat);

        if (isNgayTrongQuaKhu(ngayDi)) {
            request.setAttribute("message", "Ngay khoi hanh khong duoc nho hon ngay hien tai.");
            request.setAttribute("listVeRes", null);
            request.getRequestDispatcher("page/list_ve/list_ve.jsp").forward(request, response);
            return;
        }

        if (isRoundTrip && isNgayVeKhongHopLe(ngayDi, ngayVe)) {
            request.setAttribute("message", "Ngay ve phai lon hon hoac bang ngay khoi hanh va khong duoc o qua khu.");
            request.setAttribute("listVeRes", null);
            request.getRequestDispatcher("page/list_ve/list_ve.jsp").forward(request, response);
            return;
        }

        TimVeService timVeService = new TimVeService();
        List<VeDto> listVeRes = timVeService.getListVeByFilter(
                khoiHanh, haCanh, hang_ghe, diemDi, diemDen, xepVe, ngayDi
        );
        request.setAttribute("listVeRes", listVeRes);

        if (isRoundTrip && ngayVe != null && !ngayVe.isEmpty()) {
            List<VeDto> listVeReturn = null;
            if (isReturnFlexible) {
                String tuNgay = ngayVe;
                String denNgay = ngayVe;
                try {
                    LocalDate date = LocalDate.parse(ngayVe);
                    LocalDate ngayKhoiHanh = LocalDate.parse(ngayDi);
                    LocalDate ngayBatDauTim = date.minusDays(3);
                    if (ngayBatDauTim.isBefore(ngayKhoiHanh)) {
                        ngayBatDauTim = ngayKhoiHanh;
                    }
                    tuNgay = ngayBatDauTim.toString();
                    denNgay = date.plusDays(3).toString();
                } catch (Exception e) {
                }
                listVeReturn = timVeService.getListVeByFilterRange(
                        haCanh, khoiHanh, hang_ghe, diemDen, diemDi, xepVe, tuNgay, denNgay
                );
            } else {
                listVeReturn = timVeService.getListVeByFilter(
                        haCanh, khoiHanh, hang_ghe, diemDen, diemDi, xepVe, ngayVe
                );
            }
            request.setAttribute("listVeReturn", listVeReturn);
            request.setAttribute("isRoundTrip", true);
            request.setAttribute("ngayVe", ngayVe);
            request.setAttribute("isReturnFlexible", isReturnFlexible);
        }

        request.getRequestDispatcher("page/list_ve/list_ve.jsp").forward(request, response);
    }

    private boolean isNgayTrongQuaKhu(String ngay) {
        try {
            return LocalDate.parse(ngay).isBefore(LocalDate.now());
        } catch (DateTimeParseException | NullPointerException e) {
            return true;
        }
    }

    private boolean isNgayVeKhongHopLe(String ngayDi, String ngayVe) {
        try {
            LocalDate ngayKhoiHanh = LocalDate.parse(ngayDi);
            LocalDate ngayTroVe = LocalDate.parse(ngayVe);
            return ngayTroVe.isBefore(LocalDate.now()) || ngayTroVe.isBefore(ngayKhoiHanh);
        } catch (DateTimeParseException | NullPointerException e) {
            return true;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
