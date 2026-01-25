package com.edu.hcmuaf.fit.webbanvemaybay.controllers.auth;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "VerifyController", value = "/VerifyController")
public class VerifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String code = request.getParameter("code");

        UserDAO userDAO = new UserDAO();
        boolean isSuccess = userDAO.verifyUser(email, code);

        if (isSuccess) {
            request.setAttribute("message", "Xác thực thành công! Bạn có thể đăng nhập.");
            request.getRequestDispatcher("page/dang_nhap/dang_nhap.jsp").forward(request, response);
        } else {
            response.getWriter().println("Link xác thực không hợp lệ hoặc đã hết hạn!");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}