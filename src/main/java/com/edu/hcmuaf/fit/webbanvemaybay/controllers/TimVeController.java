package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDto;
import com.edu.hcmuaf.fit.webbanvemaybay.services.TimVeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "TimVeController", value = "/TimVeController")
public class TimVeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String khoiHanh = request.getParameter("khoi_hanh");
        String haCanh = request.getParameter("ha_canh");
        String hang_ghe = request.getParameter("hang_ghe");
        String diemDi = request.getParameter("diem_di");
        String diemDen =  request.getParameter("diem_den");
        String isXepVe = request.getParameter("is_xep_ve");
        String ngayDi = request.getParameter("ngay_di");
        boolean xepVe = "on".equals(isXepVe) ? true : false;

        TimVeService timVeService = new TimVeService();
        List<VeDto> listVeRes = timVeService.getListVeByFilter(
                khoiHanh, haCanh, hang_ghe, diemDi, diemDen, xepVe, ngayDi
        );
        System.out.println(listVeRes.toString());
        request.setAttribute("listVeRes", listVeRes);
        request.getRequestDispatcher("page/list_ve/list_ve.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}