package com.edu.hcmuaf.fit.webbanvemaybay.controllers.auth;

import com.edu.hcmuaf.fit.webbanvemaybay.services.auth.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DoiMatKhauController", value = "/DoiMatKhauController")
public class DoiMatKhauController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String maXacThuc = request.getParameter("code");

        UserService userService = new UserService();
        String message = userService.doiMatKhau(username,password,email,maXacThuc);
        request.setAttribute("message", message);
        request.setAttribute("username", username);
        request.setAttribute("password", password);
        request.setAttribute("email", email);
        request.setAttribute("maXacThuc", maXacThuc);
        request.getRequestDispatcher("/page/quen_mat_khau/quen_mat_khau.jsp").forward(request, response);
    }
}