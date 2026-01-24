package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.search;

import com.edu.hcmuaf.fit.webbanvemaybay.models.HangBay;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.HangBayService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "TimKiemHangBayController", value = "/admin/TimKiemHangBayController")
public class TimKiemHangBayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("input");
        HangBayService hangBayService = new HangBayService();
        List<HangBay> listHangBay = hangBayService.getHangBayByInput(input);

        request.setAttribute("listHangBay", listHangBay);
        request.getRequestDispatcher("/page/admin/hang_bay/hang_bay.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}