package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.add;

import com.edu.hcmuaf.fit.webbanvemaybay.models.HangBay;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.HangBayService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ThemHangBayController", value = "/admin/ThemHangBayController")
public class ThemHangBayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tenHang = request.getParameter("tenHang");
        String quocGia = request.getParameter("quocGia");

        HangBay hangBay = new HangBay();
        hangBay.setTenHangBay(tenHang);
        hangBay.setQuocGia(quocGia);

        HangBayService hangBayService = new HangBayService();
        boolean isAdd = hangBayService.addHangBay(hangBay);
        if(isAdd){
            request.setAttribute("message", "thêm thành công");
        } else {
            request.setAttribute("message", "thêm thất bại");
        }

        request.getRequestDispatcher("/page/admin/hang_bay/them_hang_bay.jsp").forward(request, response);
    }
}