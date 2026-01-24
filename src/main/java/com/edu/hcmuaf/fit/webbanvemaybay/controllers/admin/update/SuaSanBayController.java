package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.update;

import com.edu.hcmuaf.fit.webbanvemaybay.models.SanBay;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.SanBayService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SuaSanBayController", value = "/admin/SuaSanBayController")
public class SuaSanBayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        SanBayService sanBayService = new SanBayService();
        SanBay sanBay = sanBayService.getSanBayById(id);
        request.setAttribute("sanBay",sanBay);
        request.getRequestDispatcher("/page/admin/quan_ly_san_bay/sua_san_bay.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String tenSanBay = request.getParameter("tenSanBay");
        String thanhPho = request.getParameter("thanhPho");
        String quocGia = request.getParameter("quocGia");

        SanBay sanBay = new SanBay();
        sanBay.setId(Integer.parseInt(id));
        sanBay.setTenSanBay(tenSanBay);
        sanBay.setThanhPho(thanhPho);
        sanBay.setQuocGia(quocGia);

        SanBayService sanBayService = new SanBayService();
        boolean isUpdate = sanBayService.updateSanBayById(sanBay);
        if(isUpdate){
            request.setAttribute("message", "Thành công");
            SanBay newSanBay = sanBayService.getSanBayById(id);
            request.setAttribute("sanBay",newSanBay);
        } else {
            request.setAttribute("message", "Thất bại");
            SanBay newSanBay = sanBayService.getSanBayById(id);
            request.setAttribute("sanBay",newSanBay);
        }
        request.getRequestDispatcher("/page/admin/quan_ly_san_bay/sua_san_bay.jsp").forward(request,response);
    }
}