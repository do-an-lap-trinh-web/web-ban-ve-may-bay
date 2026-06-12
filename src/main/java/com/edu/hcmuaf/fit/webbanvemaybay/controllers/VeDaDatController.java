package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDaDatDto;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDto;
import com.edu.hcmuaf.fit.webbanvemaybay.models.DatVe;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.services.DatVeService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.TimVeService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.FormatVND;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "VeDaDatController", value = "/VeDaDatController")
public class VeDaDatController extends HttpServlet {
    private double parseGia(String gia) {
        return Double.parseDouble(gia.replaceAll("[^0-9]", ""));
    }

    private Map<String, List<Integer>> copyVoucherDaThanhToan(HttpSession session) {
        Map<String, List<Integer>> voucherDaThanhToan = (Map<String, List<Integer>>) session.getAttribute("voucherDaThanhToan");
        Map<String, List<Integer>> voucherCopy = new HashMap<>();

        if (voucherDaThanhToan == null) {
            return voucherCopy;
        }

        for (Map.Entry<String, List<Integer>> entry : voucherDaThanhToan.entrySet()) {
            voucherCopy.put(entry.getKey(), new ArrayList<>(entry.getValue()));
        }
        return voucherCopy;
    }

    private String chuanHoaNgayDat(String ngayDat) {
        if (ngayDat == null) {
            return "";
        }
        return ngayDat.replace("T", " ");
    }

    private void apDungVoucherDaThanhToan(VeDto veDto, DatVe datVe, Map<String, List<Integer>> voucherCopy) {
        String key = datVe.getIdVe() + "|" + datVe.getSoLuong() + "|" + chuanHoaNgayDat(datVe.getNgayDat());
        List<Integer> danhSachGiamGia = voucherCopy.get(key);

        if (danhSachGiamGia == null || danhSachGiamGia.isEmpty()) {
            return;
        }

        int ptGiam = danhSachGiamGia.remove(0);
        if (ptGiam <= 0) {
            return;
        }

        double giaSauGiam = parseGia(veDto.getGia()) * (1 - ptGiam / 100.0);
        veDto.setGia(FormatVND.formatVND(giaSauGiam));
    }

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
            Map<String, List<Integer>> voucherCopy = copyVoucherDaThanhToan(session);

            for (DatVe datVe : listVeDaDat) {
                VeDto veDto = timVeService.getVeByIdVe(datVe.getIdVe());

                if (veDto != null) {
                    apDungVoucherDaThanhToan(veDto, datVe, voucherCopy);
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
