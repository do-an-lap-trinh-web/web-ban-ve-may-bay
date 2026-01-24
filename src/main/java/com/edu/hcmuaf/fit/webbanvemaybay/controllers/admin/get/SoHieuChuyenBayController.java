package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.get;

import com.edu.hcmuaf.fit.webbanvemaybay.models.SoHieuChuyenBay;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.SoHieuChuyenBayService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SoHieuChuyenBayController", value = "/admin/SoHieuChuyenBayController")
public class SoHieuChuyenBayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SoHieuChuyenBayService soHieuChuyenBayService = new SoHieuChuyenBayService();
        List<SoHieuChuyenBay> listSoHieuChuyenBay = soHieuChuyenBayService.getListSoHieuChuyenBay();
        request.setAttribute("listSoHieuChuyenBay", listSoHieuChuyenBay);
        request.getRequestDispatcher("/page/admin/so_hieu_chuyen_bay/so_hieu_chuyen_bay.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}