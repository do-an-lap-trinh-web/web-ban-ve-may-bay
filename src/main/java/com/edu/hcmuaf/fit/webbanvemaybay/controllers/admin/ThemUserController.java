package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "themUser", value = "/themUser")
public class ThemUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();
        User user = new User();
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password").toString());
        user.setEmail(request.getParameter("email"));
        user.setSoDienThoai(request.getParameter("soDienThoai"));
        user.setCodeXacThuc(null);
        user.setHangXacThuc(null);
        String res = userService.addUser(user);
        request.setAttribute("message", res);

        request.getRequestDispatcher("/page/admin/quan_ly_users/them_user.jsp").forward(request, response);
    }
}