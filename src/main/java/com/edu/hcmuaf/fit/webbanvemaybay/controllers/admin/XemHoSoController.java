package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.UserService;
import com.edu.hcmuaf.fit.webbanvemaybay.models.ThongTinNguoiDung;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "xemHoSo", value = "/xemHoSo")
public class XemHoSoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam != null) {
            try {
                int userId = Integer.parseInt(idParam);

                UserService userService = new UserService();

                User user = userService.getUserById(userId);
                ThongTinNguoiDung details = userService.getChiTietNguoiDung(userId);

                request.setAttribute("user", user);
                request.setAttribute("details", details);

                request.getRequestDispatcher("/page/admin/quan_ly_users/xem_ho_so.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/admin/quan-ly-users");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/quan-ly-users");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
