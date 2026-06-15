package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DaiLy;
import com.edu.hcmuaf.fit.webbanvemaybay.models.YeuCauHoTro;
import com.edu.hcmuaf.fit.webbanvemaybay.services.DaiLyService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ThongTinLienHeController", value = "/ThongTinLienHeController")
public class ThongTinLienHeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaiLyService daiLyService = new DaiLyService();
        DaiLy daiLy = daiLyService.getDaiLy();
        request.setAttribute("daiLy", daiLy);
        request.getRequestDispatcher("/page/lien_he/lien_he.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String hoTen = request.getParameter("hoTen");
        String email = request.getParameter("email");
        String noiDung = request.getParameter("noiDung");

        YeuCauHoTro yc = new YeuCauHoTro();
        yc.setHoTen(hoTen);
        yc.setEmail(email);
        yc.setNoiDung(noiDung);

        com.edu.hcmuaf.fit.webbanvemaybay.dao.YeuCauHoTroDAO ycDAO = new com.edu.hcmuaf.fit.webbanvemaybay.dao.YeuCauHoTroDAO();
        boolean isSuccess = ycDAO.insertYeuCau(yc);

        if (isSuccess) {
            request.getSession().setAttribute("contactMessage", "Gửi yêu cầu hỗ trợ thành công! Chúng tôi sẽ liên hệ lại sớm nhất.");
        } else {
            request.getSession().setAttribute("contactMessage", "Gửi yêu cầu thất bại. Vui lòng kiểm tra lại thông tin.");
        }

        response.sendRedirect(request.getContextPath() + "/ThongTinLienHeController");
    }
}