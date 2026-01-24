package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.get;

import com.edu.hcmuaf.fit.webbanvemaybay.models.SanBay;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.SanBayService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SanBayController", value = "/admin/SanBayController")
public class SanBayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SanBayService sanBayService = new SanBayService();
        List<SanBay> listSanBay = sanBayService.getAllSanBay();
        request.setAttribute("listSanBay", listSanBay);
        request.getRequestDispatcher("/page/admin/quan_ly_san_bay/quan_ly_san_bay.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}