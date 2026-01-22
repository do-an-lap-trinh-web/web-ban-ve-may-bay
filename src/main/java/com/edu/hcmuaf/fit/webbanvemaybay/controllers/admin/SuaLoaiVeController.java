package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.models.LoaiVe;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.LoaiVeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SuaLoaiVeController", value = "/admin/SuaLoaiVeController")
public class SuaLoaiVeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        LoaiVeService loaiVeService = new LoaiVeService();
        LoaiVe loaiVe = loaiVeService.getLoaiVeById(id);
        request.setAttribute("loaiVe", loaiVe);
        request.getRequestDispatcher("/page/admin/loai_ve/sua_loai_ve.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String tenLoaiVe =  request.getParameter("tenLoaiVe");
        String moTa = request.getParameter("moTa");
        LoaiVe loaiVe = new LoaiVe();
        loaiVe.setId(Integer.parseInt(id));
        loaiVe.setTenLoaiVe(tenLoaiVe);
        loaiVe.setMoTa(moTa);
        LoaiVeService loaiVeService = new LoaiVeService();
        boolean isUpdate = loaiVeService.updateLoaiVe(loaiVe);
        if (isUpdate) {
            request.setAttribute("message", "thành công");
        } else {
            request.setAttribute("message", "thất bại");
        }

        request.getRequestDispatcher("/page/admin/loai_ve/sua_loai_ve.jsp").forward(request, response);
    }
}