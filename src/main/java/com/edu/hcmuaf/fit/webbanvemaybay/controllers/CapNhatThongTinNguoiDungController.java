package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.ThongTinNguoiDung;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.services.ThongTinNguoiDungService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "CapNhatThongTinNguoiDung", value = "/CapNhatThongTinNguoiDungController")
public class CapNhatThongTinNguoiDungController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        UserService userService = new UserService();
        User user = userService.getUserById(id);
        ThongTinNguoiDungService thongTinNguoiDungService = new ThongTinNguoiDungService();
        ThongTinNguoiDung thongTinNguoiDung = thongTinNguoiDungService.getThongTinNguoiDungByIdUser(id);
        request.setAttribute("info", thongTinNguoiDung);
        request.setAttribute("user", user);

        request.getRequestDispatcher("/page/cap_nhat_thong_tin_khach_hang/cap_nhat_thong_tin_khach_hang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("id");
        String idUserStr = request.getParameter("idUser");

        int id = (idStr != null && !idStr.isEmpty()) ? Integer.parseInt(idStr) : 0;
        int idUser = (idUserStr != null && !idUserStr.isEmpty()) ? Integer.parseInt(idUserStr) : 0;

        if (idUser == 0) {
            User loggedInUser = (User) request.getSession().getAttribute("user");
            if (loggedInUser != null) {
                idUser = loggedInUser.getId();
            }
        }

        String ho = request.getParameter("ho");
        String ten = request.getParameter("ten");
        String email = request.getParameter("email");
        String gioiTinh = request.getParameter("gioiTinh");
        String diaChi = request.getParameter("diaChi");
        String ngaySinh = request.getParameter("ngaySinh");

        ThongTinNguoiDung thongTinNguoiDung = new ThongTinNguoiDung();
        thongTinNguoiDung.setId(id);
        thongTinNguoiDung.setIdUser(idUser);
        thongTinNguoiDung.setHo(ho);
        thongTinNguoiDung.setTen(ten);
        thongTinNguoiDung.setDiaChi(diaChi);
        thongTinNguoiDung.setGioiTinh(gioiTinh);
        thongTinNguoiDung.setNgaySinh(ngaySinh);

        ThongTinNguoiDungService thongTinNguoiDungService = new ThongTinNguoiDungService();
        boolean isUpdateInfo = thongTinNguoiDungService.updateThongTinNguoiDungById(thongTinNguoiDung);

        UserService userService = new UserService();
        boolean isUpdateEmail = userService.updateEmailById(String.valueOf(idUser), email);

        HttpSession session = request.getSession();
        if (isUpdateInfo && isUpdateEmail) {
            session.setAttribute("messageUpdate", "Cập nhật thông tin thành công!");
        } else {
            session.setAttribute("messageUpdate", "Có lỗi xảy ra, vui lòng thử lại!");
        }

        response.sendRedirect(request.getContextPath() + "/CapNhatThongTinNguoiDungController?id=" + idUser);
    }
}