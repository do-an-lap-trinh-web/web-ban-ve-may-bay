package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.models.LoaiVe;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.LoaiVeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoaiVe", value = "/LoaiVe")
public class LoaiVeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<LoaiVe> listLoaiVe = new ArrayList<LoaiVe>();
        LoaiVeService loaiVeService = new LoaiVeService();
        listLoaiVe = loaiVeService.getAllLoaiVe();
        String message;
        if (listLoaiVe == null) {
            message = "không có loại vé nào trong database";
        }
        request.setAttribute("listLoaiVe", listLoaiVe);
        request.getRequestDispatcher("/page/admin/loai_ve/loai_ve.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tenLoaiVe = request.getParameter("tenLoaiVe");
        String moTa = request.getParameter("moTa");
        LoaiVe loaiVe = new LoaiVe();
        loaiVe.setTenLoaiVe(tenLoaiVe);
        loaiVe.setMoTa(moTa);
        LoaiVeService loaiVeService = new LoaiVeService();
        String res = loaiVeService.addLoaiVe(loaiVe);
        request.setAttribute("message", res);
        request.getRequestDispatcher("/page/admin/loai_ve/them_loai_ve.jsp").forward(request, response);
    }
}