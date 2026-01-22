package com.edu.hcmuaf.fit.webbanvemaybay.controllers.auth;

import com.edu.hcmuaf.fit.webbanvemaybay.services.auth.UserService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.GuiMail;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Random;

@WebServlet(name = "GuiMaXacThucController", value = "/GuiMaXacThucController")
public class GuiMaXacThucController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserService userService = new UserService();
        boolean isUser = userService.isUserAndEmailExist(username, email);
        String message = "";
        if (isUser) {
            message = userService.guiMaXacThuc(username, email);
        } else {
            message = "username, email sai hoặc không tồn tại";
        }
        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("password", password);
        request.setAttribute("message", message);
        request.getRequestDispatcher("/page/quen_mat_khau/quen_mat_khau.jsp").forward(request, response);
    }
}