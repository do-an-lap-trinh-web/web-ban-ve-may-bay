package com.edu.hcmuaf.fit.webbanvemaybay.controllers.admin.update;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DaiLy;
import com.edu.hcmuaf.fit.webbanvemaybay.services.admin.DaiLyService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SuaDaiLyController", value = "/admin/SuaDaiLyController")
public class SuaDaiLyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String diaChi = request.getParameter("diaChi");
        String tenDiaChi = request.getParameter("tenDiaChi");
        String soDienThoai = request.getParameter("soDienThoai");
        String email = request.getParameter("email");
        String linkFb = request.getParameter("linkFb");
        String linkYt = request.getParameter("linkYt");
        String linkTiktok =  request.getParameter("linkTiktok");

        int safeId = 1;
        if (id != null && !id.trim().isEmpty()) {
            safeId = Integer.parseInt(id.trim());
        }

        DaiLy daiLy = new DaiLy();
        daiLy.setId(safeId);
        daiLy.setEmail(email);
        daiLy.setDiaChi(diaChi);
        daiLy.setTenDiaChi(tenDiaChi);
        daiLy.setSoDienThoai(soDienThoai);
        daiLy.setLinkFb(linkFb);
        daiLy.setLinkYt(linkYt);
        daiLy.setLinkTiktok(linkTiktok);

        DaiLyService daiLyService = new DaiLyService();
        boolean isUpdate = daiLyService.updateDaiLyById(daiLy);

        if (isUpdate) {
            request.setAttribute("message", "Thành công");
            request.setAttribute("daiLy", daiLyService.getDaiLy());
            request.getRequestDispatcher("/page/admin/thong_tin_gioi_thieu/thong_tin_gioi_thieu.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Thất bại");
            request.setAttribute("daiLy", daiLy);
            request.getRequestDispatcher("/page/admin/thong_tin_gioi_thieu/thong_tin_gioi_thieu.jsp").forward(request, response);
        }
    }
}