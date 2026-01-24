package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.search;

import com.edu.hcmuaf.fit.webbanvemaybay.models.SoHieuChuyenBay;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.SoHieuChuyenBayService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "TimKiemSoHieuChuyenBayController", value = "/admin/TimKiemSoHieuChuyenBayController")
public class TimKiemSoHieuChuyenBayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("input");

        SoHieuChuyenBayService soHieuChuyenBayService = new SoHieuChuyenBayService();
        List<SoHieuChuyenBay> listSoHieuChuyenBay = soHieuChuyenBayService.getSoHieuChuyenBayByInput(input);
        request.setAttribute("listSoHieuChuyenBay", listSoHieuChuyenBay);
        request.getRequestDispatcher("/page/admin/so_hieu_chuyen_bay/so_hieu_chuyen_bay.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}