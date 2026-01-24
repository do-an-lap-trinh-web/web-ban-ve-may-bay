package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.models.SanBay;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.SanBayService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ThemSanBayController", value = "/admin/ThemSanBayController")
public class ThemSanBayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tenSanBay = request.getParameter("tenSanBay");
        String thanhPho = request.getParameter("thanhPho");
        String quocGia = request.getParameter("quocGia");

        SanBay sanBay = new SanBay();
        sanBay.setTenSanBay(tenSanBay);
        sanBay.setThanhPho(thanhPho);
        sanBay.setQuocGia(quocGia);

        SanBayService sanBayService = new SanBayService();
        boolean isAdd = sanBayService.addSanBay(sanBay);
        if (isAdd) {
            request.setAttribute("message", "Thành công");
        } else {
            request.setAttribute("message", "Thất bại");
        }
        request.getRequestDispatcher("/page/admin/quan_ly_san_bay/them_san_bay.jsp").forward(request, response);
    }
}