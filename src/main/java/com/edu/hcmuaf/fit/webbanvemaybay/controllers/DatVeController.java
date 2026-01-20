package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDto;
import com.edu.hcmuaf.fit.webbanvemaybay.services.TimVeService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.FormatVND;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DatVeController", value = "/DatVeController")
public class DatVeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idVe = request.getParameter("idVe");
        String soLuong = request.getParameter("soLuong");

        TimVeService timVeService = new TimVeService();
        VeDto veInfo = timVeService.getVeByIdVe(Integer.parseInt(idVe));

        request.setAttribute("veInfo", veInfo);
        request.setAttribute("tongGia", veInfo.getGia());
        request.setAttribute("soLuong", soLuong);
        request.getRequestDispatcher("page/xac_nhan_dat_ve/xac_nhan_dat_ve.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idVe = request.getParameter("idVe");
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));

        TimVeService timVeService = new TimVeService();
        VeDto veInfo = timVeService.getVeByIdVe(Integer.parseInt(idVe));

        request.setAttribute("veInfo", veInfo);
        double tongGia = Double.parseDouble(veInfo.getGia().replace(".", "")) * soLuong;
        request.setAttribute("tongGia", FormatVND.formatVND(tongGia));
        request.setAttribute("soLuong", soLuong);
        request.getRequestDispatcher("page/xac_nhan_dat_ve/xac_nhan_dat_ve.jsp").forward(request, response);
    }
}