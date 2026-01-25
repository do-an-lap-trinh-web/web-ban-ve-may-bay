package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.remove;

import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.ChuyenBayService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.VeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = " XoaChuyenBayController", value = "/admin/XoaChuyenBayController")
public class XoaChuyenBayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id =  request.getParameter("id");

        ChuyenBayService chuyenBayService = new ChuyenBayService();
        boolean isRemove = chuyenBayService.removeChuyenBayById(id);
        HttpSession session = request.getSession();
        if (isRemove) {
            session.setAttribute("messageRemove", "xoá thành công");
        } else {
            session.setAttribute("messageRemove", "xoá thất bại");
        }
        response.sendRedirect(request.getContextPath() + "/admin/ChuyenBayController");
    }
}