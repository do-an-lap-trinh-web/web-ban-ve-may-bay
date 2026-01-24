package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.search;

import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "TimKiemUserController", value = "/admin/TimKiemUserController")
public class TimKiemUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("input");

        UserService userService = new UserService();
        List<User> listUser = userService.getUserByInput(input);

        request.setAttribute("listUsers", listUser);
        request.getRequestDispatcher("/page/admin/quan_ly_users/quan_ly_users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}