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
        String ho = request.getParameter("ho");
        String ten = request.getParameter("ten");
        String ngaySinh = request.getParameter("ngaySinh");
        String gioiTinh = request.getParameter("gioiTinh");
        User  user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setSoDienThoai(soDienThoai);
        user.setHo(ho);
        user.setTen(ten);
        user.setNgaySinh(ngaySinh);
        user.setGioiTinh(gioiTinh);
        user.setCodeXacThuc(null);
        user.setHangXacThuc(null);
        user.setRole("user");

        UserService userService = new UserService();
        String message = userService.register(user);
        String successMsg = "Hãy xác nhận tài khoản của bạn bằng các nhấn vào link được gửi trong email";

        if (message.equals(successMsg)) {
            request.setAttribute("message", message);
            request.getRequestDispatcher("page/dang_nhap/dang_nhap.jsp").forward(request, response);
        } else {
            request.setAttribute("userOldData", user);
            request.setAttribute("message", message);
            request.getRequestDispatcher("page/dang_ky/dang_ky.jsp").forward(request, response);
        }
    }
}