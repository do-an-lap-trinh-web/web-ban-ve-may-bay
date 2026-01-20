package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.LoaiVeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "XoaLoaiVe", value = "/XoaLoaiVe")
public class XoaLoaiVeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idLoaiVe = request.getParameter("idLoaiVe");
        LoaiVeService loaiVeService = new LoaiVeService();
        String message;
        message = loaiVeService.xoaLoaiVe(idLoaiVe);
        request.setAttribute("message", message);
        request.getRequestDispatcher("/LoaiVe").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}