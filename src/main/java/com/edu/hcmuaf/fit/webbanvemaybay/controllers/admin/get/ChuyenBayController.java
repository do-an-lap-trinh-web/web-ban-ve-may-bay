package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.get;

import com.edu.hcmuaf.fit.webbanvemaybay.models.ChuyenBay;
import com.edu.hcmuaf.fit.webbanvemaybay.models.HangBay;
import com.edu.hcmuaf.fit.webbanvemaybay.models.Ve;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.ChuyenBayService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.HangBayService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.VeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ChuyenBayController", value = "/admin/ChuyenBayController")
public class ChuyenBayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int pageSize = 8;

        String pageStr = request.getParameter("page");
        if (pageStr != null && !pageStr.isEmpty()) {
            page = Integer.parseInt(pageStr);
        }

        ChuyenBayService chuyenBayService = new ChuyenBayService();
        List<ChuyenBay> listChuyenBay = chuyenBayService.getChuyenBayByPage(page, pageSize);
        int totalPages = chuyenBayService.getTotalPages(pageSize);

        request.setAttribute("listChuyenBay", listChuyenBay);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("/page/admin/quan_ly_chuyen_bay/quan_ly_chuyen_bay.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}