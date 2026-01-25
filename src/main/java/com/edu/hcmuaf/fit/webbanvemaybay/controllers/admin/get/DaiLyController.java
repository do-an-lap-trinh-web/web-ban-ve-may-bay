package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.get;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DaiLy;
import com.edu.hcmuaf.fit.webbanvemaybay.models.SanBay;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.DaiLyService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.SanBayService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DaiLyController", value = "/admin/DaiLyController")
public class DaiLyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaiLyService daiLyService = new DaiLyService();
        DaiLy daiLy = daiLyService.getDaiLy();
        request.setAttribute("daiLy", daiLy);
        request.getRequestDispatcher("/page/admin/thong_tin_gioi_thieu/thong_tin_gioi_thieu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}