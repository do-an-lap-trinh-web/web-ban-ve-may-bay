package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.models.SoHieuChuyenBay;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.SoHieuChuyenBayService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ThemSoHieuChuyenBayController", value = "/admin/ThemSoHieuChuyenBayController")
public class ThemSoHieuChuyenBayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SoHieuChuyenBay soHieuChuyenBay = new SoHieuChuyenBay();
        soHieuChuyenBay.setMaChuyenBay(request.getParameter("maChuyenBay"));
        String idSanBayDi = request.getParameter("idSanBayDi");
        String idSanBayDen = request.getParameter("idSanBayDen");
        String idHangBay = request.getParameter("idHangBay");
        if ("".equals(idSanBayDi.trim()) || "".equals(idSanBayDen.trim()) || "".equals(idHangBay.trim())) {
            request.setAttribute("message", "Các trường không được để trống");
            request.getRequestDispatcher("/page/admin/so_hieu_chuyen_bay/them_so_hieu_chuyen_bay.jsp").forward(request, response);
        } else {
            soHieuChuyenBay.setIdSanBayDi(Integer.parseInt(idSanBayDi.trim()));
            soHieuChuyenBay.setIdSanBayDen(Integer.parseInt(idSanBayDen.trim()));
            soHieuChuyenBay.setIdHangBay(Integer.parseInt(idHangBay.trim()));

            String message = "";
            SoHieuChuyenBayService soHieuChuyenBayService = new SoHieuChuyenBayService();
            message = soHieuChuyenBayService.addSoHieuChuyenBay(soHieuChuyenBay);
            request.setAttribute("message", message);
            request.getRequestDispatcher("/page/admin/so_hieu_chuyen_bay/them_so_hieu_chuyen_bay.jsp").forward(request, response);
        }

    }
}