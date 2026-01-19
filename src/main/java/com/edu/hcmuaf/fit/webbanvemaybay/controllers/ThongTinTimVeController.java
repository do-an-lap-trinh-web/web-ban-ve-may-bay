package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.ThongTinTimVeDto;
import com.edu.hcmuaf.fit.webbanvemaybay.services.TimVeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ThongTinTimVeController", value = "/ThongTinTimVeController")
public class ThongTinTimVeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String khoiHanh = request.getParameter("khoiHanh");
        String haCanh = request.getParameter("haCanh");

        TimVeService timVeService = new TimVeService();
        ThongTinTimVeDto thongTinTimVeDto = timVeService.getThongTinTimVeDto(khoiHanh, haCanh);
        request.setAttribute("thongTinTimVeDto", thongTinTimVeDto);
        request.getRequestDispatcher("page/tim_ve/tim_ve.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}