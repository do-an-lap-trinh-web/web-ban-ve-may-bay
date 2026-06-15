package com.edu.hcmuaf.fit.webbanvemaybay.controllers.auth;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.UserDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CapNhatMatKhauController", value = "/CapNhatMatKhauController")
public class CapNhatMatKhauController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String matKhauCu = request.getParameter("matKhauCu");
        String matKhauMoi = request.getParameter("matKhauMoi");
        String xacNhanMatKhau = request.getParameter("xacNhanMatKhau");

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/page/dang_nhap/dang_nhap.jsp");
            return;
        }

        if (!currentUser.getPassword().equals(matKhauCu)) {
            session.setAttribute("errorPassword", "Mật khẩu cũ không chính xác!");
            response.sendRedirect(request.getContextPath() + "/page/profile/profile.jsp");
            return;
        }

        if (!matKhauMoi.equals(xacNhanMatKhau)) {
            session.setAttribute("errorPassword", "Mật khẩu mới và xác nhận mật khẩu không khớp!");
            response.sendRedirect(request.getContextPath() + "/page/profile/profile.jsp");
            return;
        }

        UserDAO userDAO = new UserDAO();
        boolean isUpdated = userDAO.updatePassword(currentUser.getId(), matKhauMoi);

        if (isUpdated) {
            currentUser.setPassword(matKhauMoi);
            session.setAttribute("user", currentUser);
            session.setAttribute("successPassword", "Đổi mật khẩu thành công!");
        } else {
            session.setAttribute("errorPassword", "Hệ thống bận, vui lòng thử lại sau!");
        }

        response.sendRedirect(request.getContextPath() + "/page/profile/profile.jsp");
    }
}