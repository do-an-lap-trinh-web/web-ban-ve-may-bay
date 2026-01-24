package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.search;

import com.edu.hcmuaf.fit.webbanvemaybay.models.SanBay;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.SanBayService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "TimKiemSanBayController", value = "/admin/TimKiemSanBayController")
public class TimKiemSanBayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("input");
        SanBayService sanBayService = new SanBayService();
        List<SanBay> listSanBay = sanBayService.getSanBayByInput(input);
        request.setAttribute("listSanBay", listSanBay);
        request.getRequestDispatcher("/page/admin/quan_ly_san_bay/quan_ly_san_bay.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}