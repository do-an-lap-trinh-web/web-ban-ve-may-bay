package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.models.HangBay;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.HangBayService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SuaHangBayController", value = "/admin/SuaHangBayController")
public class SuaHangBayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        HangBayService hangBayService=new HangBayService();
        HangBay hangBay = hangBayService.getHangBayById(Integer.parseInt(id));

        request.setAttribute("hangBay",hangBay);
        request.getRequestDispatcher("/page/admin/hang_bay/sua_hang_bay.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String tenHangBay=request.getParameter("tenHangBay");
        String quocGia =  request.getParameter("quocGia");

        HangBayService hangBayService=new HangBayService();
        HangBay hangBay = new HangBay();
        hangBay.setId(Integer.parseInt(id));
        hangBay.setTenHangBay(tenHangBay);
        hangBay.setQuocGia(quocGia);
        boolean isUpdate = hangBayService.updateHangBay(hangBay);
        if (isUpdate) {
            request.setAttribute("message","thành công");
            request.setAttribute("hangBay",hangBayService.getHangBayById(Integer.parseInt(id)));
            request.getRequestDispatcher("/page/admin/hang_bay/sua_hang_bay.jsp").forward(request,response);
        } else {
            request.setAttribute("message", "thất bại");
            request.setAttribute("hangBay", hangBay);
        }
    }
}