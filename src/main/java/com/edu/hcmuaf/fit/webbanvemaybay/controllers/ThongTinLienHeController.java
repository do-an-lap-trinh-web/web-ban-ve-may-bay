package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DaiLy;
import com.edu.hcmuaf.fit.webbanvemaybay.services.DaiLyService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ThongTinLienHeController", value = "/ThongTinLienHeController")
public class ThongTinLienHeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaiLyService daiLyService = new DaiLyService();
        DaiLy daiLy = daiLyService.getDaiLy();
        request.setAttribute("daiLy", daiLy);
        request.getRequestDispatcher("/page/lien_he/lien_he.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}