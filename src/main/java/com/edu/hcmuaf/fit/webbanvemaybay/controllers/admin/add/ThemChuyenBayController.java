package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.add;

import com.edu.hcmuaf.fit.webbanvemaybay.models.ChuyenBay;
import com.edu.hcmuaf.fit.webbanvemaybay.models.SoHieuChuyenBay;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.ChuyenBayService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ThemChuyenBayController", value = "/admin/ThemChuyenBayController")
public class ThemChuyenBayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String thoiGianKhoiHanh = request.getParameter("thoiGianKhoiHanh");
        String thoiGianHaCanh = request.getParameter("thoiGianHaCanh");
        String idSoHieuChuyenBay = request.getParameter("idSoHieuChuyenBay");

        ChuyenBay chuyenBay = new ChuyenBay();
        chuyenBay.setThoiGianKhoiHanh(thoiGianKhoiHanh);
        chuyenBay.setThoiGianHaCanh(thoiGianHaCanh);
        chuyenBay.setIdSoHieuChuyenBay(Integer.parseInt(idSoHieuChuyenBay));

        ChuyenBayService chuyenBayService = new ChuyenBayService();
        boolean isAdd = chuyenBayService.addChuyenBay(chuyenBay);
        if (isAdd) {
            request.setAttribute("message", "Thành công");
        } else {
            request.setAttribute("message", "Thất bại");
        }
        request.getRequestDispatcher("/page/admin/quan_ly_chuyen_bay/them_chuyen_bay.jsp").forward(request, response);
    }
}