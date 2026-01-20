package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDaDatDto;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDto;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DatVe;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.services.DatVeService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.TimVeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "ThanhToanController", value = "/ThanhToanController")
public class ThanhToanController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idVe = request.getParameter("idVe");
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            DatVe datVe = new DatVe();
            datVe.setIdVe(Integer.parseInt(idVe));
            datVe.setSoLuong(soLuong);
            datVe.setNgayDat(LocalDateTime.now().toString());
            datVe.setIdUser(user.getId());
            DatVeService datVeService = new DatVeService();
            boolean isDatVe = datVeService.datVeByUser(datVe);
            if (isDatVe) {
                response.sendRedirect(request.getContextPath() + "/VeDaDatController");
            }
            request.setAttribute("message", "Lỗi đặt vé");
        } else {
            request.setAttribute("message", "bạn phải đăng nhập trước khi đặt vé");
            request.getRequestDispatcher("page/dang_nhap/dang_nhap.jsp").forward(request, response);
        }
    }
}