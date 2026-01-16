package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin;

import com.edu.hcmuaf.fit.webbanvemaybay.models.ThongTinNguoiDung;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "suaUser", value = "/suaUser")
public class SuaUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            int userId = Integer.parseInt(idParam);
            UserService service = new UserService();

            User user = service.getUserById(userId);
            ThongTinNguoiDung details = service.getChiTietNguoiDung(userId);

            request.setAttribute("user", user);
            request.setAttribute("details", details);

            request.getRequestDispatcher("/page/admin/quan_ly_users/sua_ho_so.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/user-controller");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String email = request.getParameter("email");
            String sdt = request.getParameter("soDienThoai");
            String role = request.getParameter("role");

            String ho = request.getParameter("ho");
            String ten = request.getParameter("ten");
            String gioiTinh = request.getParameter("gioiTinh");
            String ngaySinh = request.getParameter("ngaySinh");
            String diaChi = request.getParameter("diaChi");

            User user = new User();
            user.setId(id);
            user.setEmail(email);
            user.setSoDienThoai(sdt);
            user.setRole(role);

            ThongTinNguoiDung details = new ThongTinNguoiDung();
            details.setHo(ho);
            details.setTen(ten);
            details.setGioiTinh(gioiTinh);
            details.setNgaySinh(ngaySinh);
            details.setDiaChi(diaChi);

            UserService service = new UserService();
            service.updateUserProfile(user, details);

            response.sendRedirect(request.getContextPath() + "/user-controller");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/user-controller");        }
    }
}