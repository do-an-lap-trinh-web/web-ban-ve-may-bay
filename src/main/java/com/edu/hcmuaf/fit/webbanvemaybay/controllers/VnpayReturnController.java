package com.edu.hcmuaf.fit.webbanvemaybay.controllers;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/VnpayReturnController")
public class VnpayReturnController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String responseCode = req.getParameter("vnp_ResponseCode");
        if ("00".equals(responseCode)) {
            resp.sendRedirect(req.getContextPath() + "/thanhcong.jsp");
        } else {
            resp.sendRedirect(req.getContextPath() + "/thatbai.jsp");
        }
    }
}

