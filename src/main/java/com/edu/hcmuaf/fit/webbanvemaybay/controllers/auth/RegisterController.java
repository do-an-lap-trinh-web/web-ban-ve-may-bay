package com.edu.hcmuaf.fit.webbanvemaybay.controllers.auth;

import com.edu.hcmuaf.fit.webbanvemaybay.models.User;

import com.edu.hcmuaf.fit.webbanvemaybay.services.auth.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "RegisterController", value = "/RegisterController")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String soDienThoai = request.getParameter("soDienThoai");
        User  user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setSoDienThoai(soDienThoai);
        user.setCodeXacThuc(null);
        user.setHangXacThuc(null);

        UserService userService = new UserService();
        String message = userService.register(user);
        request.setAttribute("message", message);
        request.getRequestDispatcher("page/dang_ky/dang_ky.jsp").forward(request, response);
    }
}