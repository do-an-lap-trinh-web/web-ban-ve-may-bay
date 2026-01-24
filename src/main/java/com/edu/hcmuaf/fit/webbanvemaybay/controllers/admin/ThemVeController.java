package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.models.Ve;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.VeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ThemVeController", value = "/admin/ThemVeController")
public class ThemVeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idChuyenbay = request.getParameter("idChuyenBay");
        String gia = request.getParameter("gia");
        String soLuong = request.getParameter("soLuong");
        String idLoaiVe = request.getParameter("idLoaiVe");

        Ve ve = new Ve();
        ve.setGia(Double.parseDouble(gia));
        ve.setIdChuyenBay(Integer.parseInt(idChuyenbay));
        ve.setIdLoaiVe(Integer.parseInt(idLoaiVe));
        ve.setSoLuongTon(Integer.parseInt(soLuong));

        VeService veService = new VeService();
        boolean isAdd = veService.addVe(ve);

        if (isAdd) {
            request.setAttribute("message", "Thành công");
        } else {
            request.setAttribute("message", "Thất bại");
        }
        request.getRequestDispatcher("/page/admin/quan_ly_ve/them_ve.jsp").forward(request, response);
    }
}