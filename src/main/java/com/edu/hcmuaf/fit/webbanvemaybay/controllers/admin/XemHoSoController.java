package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.UserService;
import com.edu.hcmuaf.fit.webbanvemaybay.models.ThongTinNguoiDung;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "xemHoSo", value = "/admin/xemHoSo")
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
                response.sendRedirect(request.getContextPath() + "/user-controller");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/user-controller");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
