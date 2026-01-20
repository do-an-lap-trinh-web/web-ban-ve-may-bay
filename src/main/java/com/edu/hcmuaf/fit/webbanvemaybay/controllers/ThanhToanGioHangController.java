package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DatVe;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.models.giohang.GioHangItem;
import com.edu.hcmuaf.fit.webbanvemaybay.services.DatVeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ThanhToanGioHangController", value = "/ThanhToanGioHangController")
public class ThanhToanGioHangController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<GioHangItem> listGioHangItem = (List<GioHangItem>) session.getAttribute("gioHang");
        User user = (User) session.getAttribute("user");

        if (listGioHangItem == null) {
            request.setAttribute("messageThanhToan", "không có vé nào trong giỏ hàng");
            request.getRequestDispatcher("/page/gio_hang/gio_hang.jsp").forward(request, response);
            return;
        }


        List<DatVe> datVeList = new ArrayList<>();
        for (int i = 0; i < listGioHangItem.size(); i++) {
            DatVe datVe = new DatVe();
            datVe.setIdUser(user.getId());
            datVe.setNgayDat(LocalDateTime.now().toString());
            datVe.setSoLuong(listGioHangItem.get(i).getSoLuong());
            datVe.setIdVe(listGioHangItem.get(i).getVeDto().getIdVe());
            datVeList.add(datVe);
        }
        DatVeService datVeService = new DatVeService();
        boolean isDatVe = datVeService.datListVeByUser(datVeList);
        if (isDatVe) {
            session.setAttribute("gioHang", null);
            request.setAttribute("messageThanhToan", "Thanh toán thành công");
            response.sendRedirect(request.getContextPath() + "/VeDaDatController");
            return;
        }
        request.setAttribute("messageThanhToan", "Lỗi, không thể thanh toán");
        request.getRequestDispatcher("/page/gio_hang/gio_hang.jsp").forward(request, response);
    }
}