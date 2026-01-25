package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.update;

import com.edu.hcmuaf.fit.webbanvemaybay.models.ChuyenBay;
import com.edu.hcmuaf.fit.webbanvemaybay.models.Ve;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.ChuyenBayService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.VeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SuaChuyenBayController", value = "/admin/SuaChuyenBayController")
public class SuaChuyenBayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        ChuyenBayService chuyenBayService = new ChuyenBayService();
        ChuyenBay chuyenBay = chuyenBayService.getChuyenBayById(id);

        request.setAttribute("chuyenBay", chuyenBay);
        request.getRequestDispatcher("/page/admin/quan_ly_chuyen_bay/sua_chuyen_bay.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String thoiGianKhoiHanh = request.getParameter("thoiGianKhoiHanh");
        String thoiGianHaCanh = request.getParameter("thoiGianHaCanh");
        String idSoHieuChuyenBay = request.getParameter("idSoHieuChuyenBay");


        ChuyenBay  chuyenBay = new ChuyenBay();
        chuyenBay.setId(Integer.parseInt(id));
        chuyenBay.setThoiGianKhoiHanh(thoiGianKhoiHanh);
        chuyenBay.setThoiGianHaCanh(thoiGianHaCanh);
        chuyenBay.setIdSoHieuChuyenBay(Integer.parseInt(idSoHieuChuyenBay));

        ChuyenBayService chuyenBayService = new ChuyenBayService();
        boolean isUpdate = chuyenBayService.updateChuyenBayById(chuyenBay);
        if (isUpdate) {
            request.setAttribute("message", "thành công");
        } else {
            request.setAttribute("message", "Thất bại");
        }
        request.setAttribute("chuyenBay", chuyenBay);
        request.getRequestDispatcher("/page/admin/quan_ly_chuyen_bay/sua_chuyen_bay.jsp").forward(request, response);
    }
}