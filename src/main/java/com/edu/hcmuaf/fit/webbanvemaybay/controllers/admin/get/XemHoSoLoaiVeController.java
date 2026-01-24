package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.get;

import com.edu.hcmuaf.fit.webbanvemaybay.models.LoaiVe;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.LoaiVeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "XemHoSoLoaiVeController", value = "/admin/XemHoSoLoaiVeController")
public class XemHoSoLoaiVeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        LoaiVeService loaiVeService = new LoaiVeService();
        LoaiVe loaiVe = loaiVeService.getLoaiVeById(id);
        request.setAttribute("loaiVe", loaiVe);
        request.getRequestDispatcher("/page/admin/loai_ve/ho_so_loai_ve.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}