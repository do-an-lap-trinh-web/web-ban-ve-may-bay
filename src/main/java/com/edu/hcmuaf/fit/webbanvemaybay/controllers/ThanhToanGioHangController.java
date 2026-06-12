package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.models.DatVe;
import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import com.edu.hcmuaf.fit.webbanvemaybay.models.giohang.GioHangItem;
import com.edu.hcmuaf.fit.webbanvemaybay.services.DatVeService;
import com.edu.hcmuaf.fit.webbanvemaybay.services.core.FormatVND;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ThanhToanGioHangController", value = "/ThanhToanGioHangController")
public class ThanhToanGioHangController extends HttpServlet {
    private static final DateTimeFormatter NGAY_DAT_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    private static final int GIA_TRI_MOT_DIEM = 1000;
    private static final double TY_LE_DOI_DIEM_TOI_DA = 0.1;

    private static class Voucher {
        private final String code;
        private final String airlineKeyword;
        private final double minOrder;
        private final int percent;
        private final double fixedDiscount;
        private final double maxDiscount;

        private Voucher(String code, String airlineKeyword, double minOrder, int percent, double fixedDiscount, double maxDiscount) {
            this.code = code;
            this.airlineKeyword = airlineKeyword;
            this.minOrder = minOrder;
            this.percent = percent;
            this.fixedDiscount = fixedDiscount;
            this.maxDiscount = maxDiscount;
        }

        private boolean isAirlineVoucher() {
            return airlineKeyword != null && !airlineKeyword.trim().isEmpty();
        }
    }

    private static final Voucher[] VOUCHERS = {
            new Voucher("FLIGHT50K", null, 1500000, 0, 50000, 50000),
            new Voucher("BAY100K", null, 3000000, 0, 100000, 100000),
            new Voucher("WEEKEND5", null, 2000000, 5, 0, 150000),
            new Voucher("VNA200K", "Vietnam Airlines", 5000000, 0, 200000, 200000)
    };

    private int parseSoLuongHopLe(String soLuong) {
        try {
            int soLuongParsed = Integer.parseInt(soLuong);
            return Math.max(soLuongParsed, 1);
        } catch (NumberFormatException e) {
            return 1;
        }
    }

    private int parseSoKhongAm(String value) {
        try {
            int parsed = Integer.parseInt(value);
            return Math.max(parsed, 0);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private int getDiemThuong(HttpSession session) {
        Object diemThuong = session.getAttribute("diemThuong");
        if (diemThuong instanceof Integer) {
            return (Integer) diemThuong;
        }
        session.setAttribute("diemThuong", 0);
        return 0;
    }

    private Voucher timVoucher(String voucherCode) {
        if (voucherCode == null || voucherCode.trim().isEmpty()) {
            return null;
        }

        String code = voucherCode.trim().toUpperCase();
        for (Voucher voucher : VOUCHERS) {
            if (voucher.code.equals(code)) {
                return voucher;
            }
        }
        return null;
    }

    private double parseGia(String gia) {
        return Double.parseDouble(gia.replaceAll("[^0-9]", ""));
    }

    private double tinhTongGoc(List<GioHangItem> listGioHangItem) {
        double tongGoc = 0;
        for (GioHangItem item : listGioHangItem) {
            tongGoc += parseGia(item.getVeDto().getGia()) * item.getSoLuong();
        }
        return tongGoc;
    }

    private double tinhTongDuDieuKienVoucher(List<GioHangItem> listGioHangItem, Voucher voucher) {
        if (voucher == null) {
            return 0;
        }

        double tongDuDieuKien = 0;
        for (GioHangItem item : listGioHangItem) {
            if (!voucher.isAirlineVoucher() || item.getVeDto().getHangBay().contains(voucher.airlineKeyword)) {
                tongDuDieuKien += parseGia(item.getVeDto().getGia()) * item.getSoLuong();
            }
        }
        return tongDuDieuKien;
    }

    private double tinhTienGiamVoucher(List<GioHangItem> listGioHangItem, Voucher voucher, double tongGoc) {
        if (voucher == null || tongGoc < voucher.minOrder) {
            return 0;
        }

        double tongDuDieuKien = tinhTongDuDieuKienVoucher(listGioHangItem, voucher);
        if (tongDuDieuKien <= 0) {
            return 0;
        }

        double tienGiam = voucher.fixedDiscount;
        if (voucher.percent > 0) {
            tienGiam = tongDuDieuKien * voucher.percent / 100.0;
        }
        return Math.min(Math.min(tienGiam, voucher.maxDiscount), tongDuDieuKien);
    }

    private int demDongDuDieuKienVoucher(List<GioHangItem> listGioHangItem, Voucher voucher) {
        if (voucher == null) {
            return 0;
        }

        int soDong = 0;
        for (GioHangItem item : listGioHangItem) {
            if (!voucher.isAirlineVoucher() || item.getVeDto().getHangBay().contains(voucher.airlineKeyword)) {
                soDong++;
            }
        }
        return soDong;
    }

    private void dongBoSoLuongTuRequest(HttpServletRequest request, List<GioHangItem> listGioHangItem) {
        String[] idVeList = request.getParameterValues("idVe");
        String[] soLuongList = request.getParameterValues("soLuong");

        if (idVeList == null || soLuongList == null || idVeList.length != soLuongList.length) {
            return;
        }

        for (int i = 0; i < idVeList.length; i++) {
            int idVe;
            try {
                idVe = Integer.parseInt(idVeList[i]);
            } catch (NumberFormatException e) {
                continue;
            }

            int soLuong = parseSoLuongHopLe(soLuongList[i]);
            for (GioHangItem item : listGioHangItem) {
                if (item.getVeDto().getIdVe() == idVe) {
                    item.setSoLuong(soLuong);
                    break;
                }
            }
        }
    }

    private void luuGiaDaThanhToan(HttpSession session, int idVe, int soLuong, String ngayDat, double giaMotVeDaThanhToan) {
        Map<String, List<String>> giaDaThanhToan = (Map<String, List<String>>) session.getAttribute("giaDaThanhToan");
        if (giaDaThanhToan == null) {
            giaDaThanhToan = new HashMap<>();
        }

        String key = idVe + "|" + soLuong + "|" + ngayDat;
        List<String> danhSachGia = giaDaThanhToan.get(key);
        if (danhSachGia == null) {
            danhSachGia = new ArrayList<>();
            giaDaThanhToan.put(key, danhSachGia);
        }
        danhSachGia.add(0, FormatVND.formatVND(giaMotVeDaThanhToan));
        session.setAttribute("giaDaThanhToan", giaDaThanhToan);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            request.setAttribute("messageLogin", "Bạn phải đăng nhập!");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        List<GioHangItem> listGioHangItem = (List<GioHangItem>) session.getAttribute("gioHang");
        User user = (User) session.getAttribute("user");

        if (listGioHangItem == null || listGioHangItem.isEmpty()) {
            request.setAttribute("messageThanhToan", "Không có vé nào trong giỏ hàng");
            request.getRequestDispatcher("/page/gio_hang/gio_hang.jsp").forward(request, response);
            return;
        }

        dongBoSoLuongTuRequest(request, listGioHangItem);
        session.setAttribute("gioHang", listGioHangItem);

        Voucher voucher = timVoucher(request.getParameter("voucherCode"));
        int diemThuong = getDiemThuong(session);
        int diemMuonDoi = parseSoKhongAm(request.getParameter("diemDoi"));
        double tongGoc = tinhTongGoc(listGioHangItem);
        double tienGiamVoucher = tinhTienGiamVoucher(listGioHangItem, voucher, tongGoc);
        double tongSauVoucher = tongGoc - tienGiamVoucher;
        int diemDoiToiDaTheoDon = (int) Math.floor((tongSauVoucher * TY_LE_DOI_DIEM_TOI_DA) / GIA_TRI_MOT_DIEM);
        int diemDoi = Math.min(Math.min(diemMuonDoi, diemThuong), diemDoiToiDaTheoDon);
        double tienDoiDiem = diemDoi * GIA_TRI_MOT_DIEM;
        double tongThanhToan = tongSauVoucher - tienDoiDiem;

        List<DatVe> datVeList = new ArrayList<>();
        for (GioHangItem item : listGioHangItem) {
            DatVe datVe = new DatVe();
            datVe.setIdUser(user.getId());
            datVe.setNgayDat(LocalDateTime.now().format(NGAY_DAT_FORMATTER));
            datVe.setSoLuong(item.getSoLuong());
            datVe.setIdVe(item.getVeDto().getIdVe());
            datVeList.add(datVe);
        }

        DatVeService datVeService = new DatVeService();
        boolean isDatVe = datVeService.datListVeByUser(datVeList);
        if (isDatVe) {
            double tongDuDieuKienVoucher = tinhTongDuDieuKienVoucher(listGioHangItem, voucher);
            int soDongVoucherConLai = demDongDuDieuKienVoucher(listGioHangItem, voucher);
            double voucherConLai = tienGiamVoucher;
            double diemConLai = tienDoiDiem;
            for (int i = 0; i < listGioHangItem.size(); i++) {
                GioHangItem item = listGioHangItem.get(i);
                DatVe datVe = datVeList.get(i);
                double giaGocMotVe = parseGia(item.getVeDto().getGia());
                double tienGocDong = giaGocMotVe * datVe.getSoLuong();
                boolean dongDuDieuKienVoucher = voucher == null || !voucher.isAirlineVoucher() || item.getVeDto().getHangBay().contains(voucher.airlineKeyword);
                double voucherPhanBo;

                if (dongDuDieuKienVoucher && tongDuDieuKienVoucher > 0) {
                    if (soDongVoucherConLai == 1) {
                        voucherPhanBo = voucherConLai;
                    } else {
                        voucherPhanBo = Math.floor(tienGiamVoucher * (tienGocDong / tongDuDieuKienVoucher));
                        voucherConLai -= voucherPhanBo;
                    }
                    soDongVoucherConLai--;
                } else {
                    voucherPhanBo = 0;
                }

                double tienSauVoucherDong = tienGocDong - voucherPhanBo;
                double diemPhanBo;
                if (i == listGioHangItem.size() - 1) {
                    diemPhanBo = diemConLai;
                } else if (tongSauVoucher > 0) {
                    diemPhanBo = Math.floor(tienDoiDiem * (tienSauVoucherDong / tongSauVoucher));
                    diemConLai -= diemPhanBo;
                } else {
                    diemPhanBo = 0;
                }

                double giaMotVeDaThanhToan = (tienSauVoucherDong - diemPhanBo) / datVe.getSoLuong();
                luuGiaDaThanhToan(session, datVe.getIdVe(), datVe.getSoLuong(), datVe.getNgayDat(), giaMotVeDaThanhToan);
            }

            int diemNhan = (int) (tongThanhToan / 100000);
            session.setAttribute("diemThuong", diemThuong - diemDoi + diemNhan);
            session.setAttribute("gioHang", null);
            request.setAttribute("messageThanhToan", "Thanh toán thành công");
            response.sendRedirect(request.getContextPath() + "/VeDaDatController");
            return;
        }

        request.setAttribute("messageThanhToan", "Lỗi, không thể thanh toán");
        request.getRequestDispatcher("/page/gio_hang/gio_hang.jsp").forward(request, response);
    }
}
