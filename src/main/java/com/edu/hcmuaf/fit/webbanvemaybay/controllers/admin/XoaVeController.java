package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.SanBayService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.VeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "XoaVeController", value = "/admin/XoaVeController")
public class XoaVeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id =  request.getParameter("id");

        VeService veService = new VeService();
        boolean isRemove = veService.removeVeById(id);
        HttpSession session = request.getSession();
        if (isRemove) {
            session.setAttribute("messageRemove", "xoá thành công");
        } else {
            session.setAttribute("messageRemove", "xoá thất bại");
        }
        response.sendRedirect(request.getContextPath() + "/admin/VeController");
    }
}