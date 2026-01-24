package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDto;
import com.edu.hcmuaf.fit.webbanvemaybay.models.giohang.GioHangItem;
import com.edu.hcmuaf.fit.webbanvemaybay.models.giohang.ChiTietThanhToan;
import com.edu.hcmuaf.fit.webbanvemaybay.models.giohang.ThongTinThanhToan;
import com.edu.hcmuaf.fit.webbanvemaybay.services.TimVeService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.FormatVND;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GioHangController", value = "/GioHangController")
public class GioHangController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            request.setAttribute("messageLogin", "Bạn phải đăng nhập!");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("page/gio_hang/gio_hang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            request.setAttribute("messageLogin", "Bạn phải đăng nhập!");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }
        String idVe = request.getParameter("idVe");
        String action = request.getParameter("action");

        TimVeService timVeService = new TimVeService();
        VeDto veInfo = timVeService.getVeByIdVe(Integer.parseInt(idVe));

        if (action.equals("add")) {
            List<GioHangItem> listGioHang = (List<GioHangItem>) session.getAttribute("gioHang");
            double tongTien = 0;
            if (listGioHang != null) {
                boolean isItemInGioHang = false;
                for (GioHangItem item : listGioHang) {
                    if (item.getVeDto().getIdVe() == Integer.parseInt(idVe)) {
                        item.setSoLuong(item.getSoLuong() + 1);
                        isItemInGioHang = true;
                    }
                }
                if (isItemInGioHang == false) {
                    GioHangItem gioHangItem = new GioHangItem();
                    gioHangItem.setSoLuong(1);
                    gioHangItem.setVeDto(veInfo);
                    listGioHang.add(gioHangItem);
                    session.setAttribute("gioHang", listGioHang);
                }

                for (GioHangItem item : listGioHang) {
                    tongTien += Double.parseDouble(item.getVeDto().getGia().replace(".", "")) * item.getSoLuong();
                }
                session.setAttribute("tongTien", FormatVND.formatVND(tongTien));
            } else {
                List<GioHangItem> newListGioHang = new ArrayList<GioHangItem>();
                GioHangItem gioHangItem = new GioHangItem();
                gioHangItem.setSoLuong(1);
                gioHangItem.setVeDto(veInfo);
                tongTien += Double.parseDouble(gioHangItem.getVeDto().getGia().replace(".", ""));
                newListGioHang.add(gioHangItem);
                session.setAttribute("gioHang", newListGioHang);
            }
            session.setAttribute("tongTien", FormatVND.formatVND(tongTien));
            System.out.println(session.getAttribute("gioHang"));
            request.getRequestDispatcher("page/gio_hang/gio_hang.jsp").forward(request, response);
        }

        if (action.equals("update")) {
            String soLuong = request.getParameter("soLuong");
            List<GioHangItem> listGioHang = (List<GioHangItem>) session.getAttribute("gioHang");
            double tongTien = 0;
            for (GioHangItem item : listGioHang) {
                if (item.getVeDto().getIdVe() == Integer.parseInt(idVe)) {
                    item.setSoLuong(Integer.parseInt(soLuong));
                    break;
                }
            }
            for (GioHangItem item : listGioHang) {
                tongTien += Double.parseDouble(item.getVeDto().getGia().replace(".", "")) * item.getSoLuong();
            }
            session.setAttribute("tongTien", FormatVND.formatVND(tongTien));
            session.setAttribute("gioHang", listGioHang);
            System.out.println(session.getAttribute("gioHang"));
            request.getRequestDispatcher("page/gio_hang/gio_hang.jsp").forward(request, response);
        }
    }
}