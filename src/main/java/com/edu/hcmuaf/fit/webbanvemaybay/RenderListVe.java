package com.edu.hcmuaf.fit.webbanvemaybay;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name = "RenderListVe", value = "/RenderListVe")
public class RenderListVe extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String di = request.getParameter("diem_di");
        String den = request.getParameter("diem_den");
        String sort = request.getParameter("is_xep_ve");
        String ngayDi = request.getParameter("ngay_di");

        String url = request.getContextPath() + "/page/list_ve/index.html"
                + "?diem_di=" + URLEncoder.encode(di, "UTF-8")
                + "&diem_den=" + URLEncoder.encode(den, "UTF-8")
                + "&is_xep_ve=" + (sort != null ? "on" : "off")
                + "&ngay_di=" + ngayDi;

        response.sendRedirect(url);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}