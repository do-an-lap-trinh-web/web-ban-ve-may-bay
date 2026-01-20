package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.services.HuyVeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "HuyVeController", value = "/HuyVeController")
public class HuyVeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idVe = request.getParameter("idVe");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        HuyVeService huyVeService = new HuyVeService();
        boolean isHuyVe = huyVeService.huyVe(idVe, user.getId());
        if (isHuyVe) {
            response.sendRedirect(request.getContextPath() + "/VeDaDatController");
            return;
        }
        request.setAttribute("messageHuyVe", "Lỗi, không thể huỷ vé");
        request.getRequestDispatcher("/page/list_ve_da_dat/list_ve_da_dat.jsp").forward(request, response);
    }
}