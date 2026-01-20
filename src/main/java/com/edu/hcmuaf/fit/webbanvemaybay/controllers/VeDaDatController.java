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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "VeDaDatController", value = "/VeDaDatController")
public class VeDaDatController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            request.setAttribute("messageVeDaDat", "Bạn phải đăng nhập để xem lịch sử");
            request.getRequestDispatcher("./index.jsp").forward(request, response);
            return;
        }

        DatVeService datVeService = new DatVeService();
        List<DatVe> listVeDaDat = datVeService.getAllVeDaDatByUser(user.getId());

        if (listVeDaDat == null || listVeDaDat.isEmpty()) {
            request.setAttribute("listVeDaDat", null);
        } else {
            List<VeDaDatDto> listVeDaDatDto = new ArrayList<>();
            TimVeService timVeService = new TimVeService();

            for (DatVe datVe : listVeDaDat) {
                VeDto veDto = timVeService.getVeByIdVe(datVe.getIdVe());

                if (veDto != null) {
                    VeDaDatDto veDaDatDto = new VeDaDatDto();
                    veDaDatDto.setVeDto(veDto);
                    veDaDatDto.setSoLuong(datVe.getSoLuong());
                    listVeDaDatDto.add(veDaDatDto);
                }
            }

            if (listVeDaDatDto.isEmpty()) {
                request.setAttribute("listVeDaDat", null);
            } else {
                request.setAttribute("listVeDaDat", listVeDaDatDto);
            }
        }

        request.getRequestDispatcher("page/list_ve_da_dat/list_ve_da_dat.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}