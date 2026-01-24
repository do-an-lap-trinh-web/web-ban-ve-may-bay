package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.models.Ve;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.VeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "VeController", value = "/VeController")
public class VeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VeService veService = new VeService();
        List<Ve> listVe = veService.getAllVe();
        request.setAttribute("listVe", listVe);
        request.getRequestDispatcher("/page/admin/quan_li_ve/quan_li_ve.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}