package com.edu.hcmuaf.fit.webbanvemaybay.controllers;

import com.edu.hcmuaf.fit.webbanvemaybay.dao.VeDAO;
import com.edu.hcmuaf.fit.webbanvemaybay.models.Ve;
import com.edu.hcmuaf.fit.webbanvemaybay.utils.HmacSHA512;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/VnpayCreatePaymentController")
public class VnpayCreatePaymentController extends HttpServlet {

    private static final String VNP_TMN_CODE = "AFCWFY70";
    private static final String VNP_HASH_SECRET = "K3RHVRTYZA8MJ9GDUU4M5SIT94FBMVQK";

    private static final String VNP_PAY_URL = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    private static final String VNP_RETURN_URL = "http://localhost:8080/web_ban_ve_may_bay/VnpayReturnController";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idVeStr = req.getParameter("idVe");
        String soLuongStr = req.getParameter("soLuong");

        if (idVeStr == null || idVeStr.isBlank() || soLuongStr == null || soLuongStr.isBlank()) {
            resp.sendError(400, "Thiếu idVe hoặc soLuong");
            return;
        }

        int idVe;
        int soLuong;
        try {
            idVe = Integer.parseInt(idVeStr);
            soLuong = Integer.parseInt(soLuongStr);
        } catch (NumberFormatException e) {
            resp.sendError(400, "idVe/soLuong không hợp lệ");
            return;
        }

        if (soLuong <= 0) {
            resp.sendError(400, "Số lượng phải > 0");
            return;
        }

        // ✅ LẤY GIÁ TỪ DATABASE (table ve)
        VeDAO veDAO = new VeDAO();
        Ve ve = veDAO.getVeById(idVe);

        if (ve == null) {
            resp.sendError(404, "Không tìm thấy vé id=" + idVe);
            return;
        }

        // Check tồn kho
        if (ve.getSoLuongTon() < soLuong) {
            resp.sendError(400, "Số lượng vé không đủ. Tồn kho=" + ve.getSoLuongTon());
            return;
        }

        long priceVnd = Math.round(ve.getGia());
        if (priceVnd <= 0) {
            resp.sendError(400, "Giá vé không hợp lệ");
            return;
        }

        long vnpAmount = priceVnd * soLuong * 100L; // VNPay *100

        String ipAddr = getClientIp(req);
        String vnpTxnRef = UUID.randomUUID().toString().replace("-", "").substring(0, 8);

        TimeZone tz = TimeZone.getTimeZone("Asia/Ho_Chi_Minh");
        Calendar cal = Calendar.getInstance(tz);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        sdf.setTimeZone(tz);

        String vnpCreateDate = sdf.format(cal.getTime());
        cal.add(Calendar.MINUTE, 15);
        String vnpExpireDate = sdf.format(cal.getTime());

        Map<String, String> params = new TreeMap<>();
        params.put("vnp_Version", "2.1.0");
        params.put("vnp_Command", "pay");
        params.put("vnp_TmnCode", VNP_TMN_CODE);
        params.put("vnp_Amount", String.valueOf(vnpAmount));
        params.put("vnp_CurrCode", "VND");
        params.put("vnp_TxnRef", vnpTxnRef);
        params.put("vnp_OrderInfo", "Thanh toan ve may bay ID=" + idVe);
        params.put("vnp_OrderType", "other");
        params.put("vnp_Locale", "vn");
        params.put("vnp_ReturnUrl", VNP_RETURN_URL);
        params.put("vnp_IpAddr", ipAddr);
        params.put("vnp_CreateDate", vnpCreateDate);
        params.put("vnp_ExpireDate", vnpExpireDate);

        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();

        boolean first = true;
        for (Map.Entry<String, String> e : params.entrySet()) {
            String key = e.getKey();
            String value = e.getValue();
            if (value == null || value.isEmpty()) continue;

            String encKey = urlEncodeForm(key);
            String encValue = urlEncodeForm(value);

            if (!first) {
                hashData.append('&');
                query.append('&');
            }
            first = false;

            hashData.append(encKey).append('=').append(encValue);
            query.append(encKey).append('=').append(encValue);
        }

        String secureHash = HmacSHA512.hmacSHA512(VNP_HASH_SECRET, hashData.toString());
        String paymentUrl = VNP_PAY_URL + "?" + query + "&vnp_SecureHash=" + secureHash;

        System.out.println("=== VNPay DEBUG ===");
        System.out.println("idVe=" + idVe + ", soLuong=" + soLuong + ", priceVnd=" + priceVnd);
        System.out.println("hashData: " + hashData);
        System.out.println("secureHash: " + secureHash);
        System.out.println("paymentUrl: " + paymentUrl);

        req.getSession().setAttribute("PENDING_ID_VE", idVe);
        req.getSession().setAttribute("PENDING_SO_LUONG", soLuong);
        req.getSession().setAttribute("PENDING_TXNREF", vnpTxnRef);

        resp.sendRedirect(paymentUrl);
    }

    private static String urlEncodeForm(String s) {
        return URLEncoder.encode(s, StandardCharsets.UTF_8);
    }

    private static String getClientIp(HttpServletRequest req) {
        String ip = req.getHeader("X-Forwarded-For");
        if (ip != null && !ip.isBlank()) ip = ip.split(",")[0].trim();
        else ip = req.getRemoteAddr();

        if ("0:0:0:0:0:0:0:1".equals(ip) || "::1".equals(ip)) ip = "127.0.0.1";
        return ip;
    }
}
