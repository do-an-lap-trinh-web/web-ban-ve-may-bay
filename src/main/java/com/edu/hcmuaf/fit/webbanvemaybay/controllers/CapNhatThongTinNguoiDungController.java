package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.ThongTinNguoiDung;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.services.ThongTinNguoiDungService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.UserService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.FormatName;
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
        String id = request.getParameter("id");
        String idUser = request.getParameter("idUser");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String gioiTinh = request.getParameter("gioiTinh");
        String diaChi = request.getParameter("diaChi");
        String ngaySinh = request.getParameter("ngaySinh");

        String[] arrHoTen = FormatName.getHoTenInFullName(fullName);
        String ho =  arrHoTen[0];
        String ten =  arrHoTen[1];
        ThongTinNguoiDung thongTinNguoiDung = new ThongTinNguoiDung();
        thongTinNguoiDung.setId(Integer.parseInt(id));
        thongTinNguoiDung.setIdUser(Integer.parseInt(idUser));
        thongTinNguoiDung.setHo(ho);
        thongTinNguoiDung.setTen(ten);
        thongTinNguoiDung.setDiaChi(diaChi);
        thongTinNguoiDung.setGioiTinh(gioiTinh);
        thongTinNguoiDung.setNgaySinh(ngaySinh);

        boolean isUpdateInfo = false;
        boolean isUpdateEmail = false;

        ThongTinNguoiDungService thongTinNguoiDungService = new ThongTinNguoiDungService();
        isUpdateInfo = thongTinNguoiDungService.updateThongTinNguoiDungById(thongTinNguoiDung);

        UserService userService = new UserService();
        isUpdateEmail = userService.updateEmailById(idUser, email);

        if (isUpdateInfo && isUpdateEmail) {
            HttpSession session = request.getSession();
            session.setAttribute("messageUpdate", "Thành công");
            response.sendRedirect(request.getContextPath() + "/CapNhatThongTinNguoiDungController?id=" + idUser);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("messageUpdate", "Thất bại");
            response.sendRedirect(request.getContextPath() + "/CapNhatThongTinNguoiDungController?id=" + idUser);
        }
    }
}