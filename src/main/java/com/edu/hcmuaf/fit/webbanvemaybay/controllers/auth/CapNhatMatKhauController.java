package com.edu.hcmuaf.fit.webbanvemaybay.controllers.auth;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.UserDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
// IMPORT CLASS MÃ HÓA CỦA BẠN VÀO ĐÂY
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.HashPassword;
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

        String redirectUrl = request.getContextPath() + "/ThongTinNguoiDungController?id=" + currentUser.getId();

        if (currentUser.getUsername() != null && currentUser.getUsername().startsWith("gg_")) {
            session.setAttribute("errorPassword", "Tài khoản đăng nhập bằng Google không thể đổi mật khẩu!");
            response.sendRedirect(redirectUrl);
            return;
        }

        UserDAO userDAO = new UserDAO();
        String currentPasswordHashed = userDAO.getPasswordById(currentUser.getId());

        String matKhauCuDaMaHoa = HashPassword.hashPassword(matKhauCu);

        if (currentPasswordHashed == null || !currentPasswordHashed.equals(matKhauCuDaMaHoa)) {
            session.setAttribute("errorPassword", "Mật khẩu cũ không chính xác!");
            response.sendRedirect(redirectUrl);
            return;
        }

        if (!matKhauMoi.equals(xacNhanMatKhau)) {
            session.setAttribute("errorPassword", "Mật khẩu mới và xác nhận mật khẩu không khớp!");
            response.sendRedirect(redirectUrl);
            return;
        }

        String matKhauMoiDaMaHoa = HashPassword.hashPassword(matKhauMoi);

        boolean isUpdated = userDAO.updatePassword(currentUser.getId(), matKhauMoiDaMaHoa);

        if (isUpdated) {
            session.setAttribute("successPassword", "Đổi mật khẩu thành công!");
        } else {
            session.setAttribute("errorPassword", "Hệ thống bận, vui lòng thử lại sau!");
        }

        response.sendRedirect(redirectUrl);
    }
}