package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.models.Ve;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.VeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SuaVeController", value = "/admin/SuaVeController")
public class SuaVeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        VeService veService = new VeService();
        Ve ve = veService.getVeById(id);

        request.setAttribute("ve", ve);
        request.getRequestDispatcher("/page/admin/quan_ly_ve/sua_ve.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String idChuyenBay = request.getParameter("idChuyenBay");
        String idLoaiVe = request.getParameter("idLoaiVe");
        String gia =  request.getParameter("gia");
        String soLuongTon = request.getParameter("soLuongTon");

        Ve ve = new Ve();
        ve.setId(Integer.parseInt(id));
        ve.setIdChuyenBay(Integer.parseInt(idChuyenBay));
        ve.setIdLoaiVe(Integer.parseInt(idLoaiVe));
        ve.setGia(Integer.parseInt(gia));
        ve.setSoLuongTon(Integer.parseInt(soLuongTon));

        VeService veService = new VeService();
        boolean isUpdate = veService.updateVeById(ve);
        if (isUpdate) {
            request.setAttribute("message", "thành công");
        } else {
            request.setAttribute("message", "Thất bại");
        }
        request.setAttribute("ve", ve);
        request.getRequestDispatcher("/page/admin/quan_ly_ve/sua_ve.jsp").forward(request, response);
    }
}