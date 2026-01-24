package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.search;

import com.edu.hcmuaf.fit.webbanvemaybay.models.LoaiVe;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.LoaiVeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "TimKiemLoaiVeController", value = "/admin/TimKiemLoaiVeController")
public class TimKiemLoaiVeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("input");
        List<LoaiVe> listLoaiVe = new ArrayList<LoaiVe>();
        LoaiVeService loaiVeService = new LoaiVeService();
        listLoaiVe = loaiVeService.getLoaiVeByInput(input);
        String message;
        if (listLoaiVe == null) {
            message = "không có loại vé nào trong database";
        }
        request.setAttribute("listLoaiVe", listLoaiVe);
        request.getRequestDispatcher("/page/admin/loai_ve/loai_ve.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}