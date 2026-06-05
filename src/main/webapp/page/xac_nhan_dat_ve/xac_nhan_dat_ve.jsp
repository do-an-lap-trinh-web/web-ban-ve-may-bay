<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/xac_nhan_dat_ve/xac_nhan_dat_ve.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">
</head>
<body>
<%@include file="../../layout/Header.jsp" %>
<%
    String message = (String) request.getAttribute("message");
    if (message != null) {
%>
<script>
    alert("<%= message %>")
</script>
<%
    }
%>
<div class="main">
    <div class="page-xac-nhan-dat-ve">
        <div class="title-xac-nhan-dat-ve">Đặt Vé Máy Bay</div>

        <div class="flight-info">
            <p><b>Hãng bay </b>${requestScope.veInfo.hangBay}</p>

            <p><b>Khởi hành tại:</b> ${requestScope.veInfo.sanBayDi}
                <span>Thời gian: ${requestScope.veInfo.thoiGianKhoiHanh}</span>
            </p>

            <p><b>Hạ cánh tại:</b> ${requestScope.veInfo.sanBayDen}
                <span>Thời gian: ${requestScope.veInfo.thoiGianHaCanh}</span>
            </p>
            <p><b>Giá vé:</b> ${requestScope.veInfo.gia} đồng</p>
        </div>

        <div class="input-so-luong">
            <div class="input">
                <form action="${pageContext.request.contextPath}/DatVeController" method="post">
                    <input type="hidden" name="idVe" value="${requestScope.veInfo.idVe}">
                    <div style="margin-bottom: 10px; display: flex; align-items: center; gap: 10px;">
                        <label style="font-weight: bold;">Số lượng:</label>
                        <input type="number" name="soLuong" value="${requestScope.soLuong}" min="1" style="width: 70px; padding: 5px; border: 1px solid #ccc; border-radius: 4px;">
                    </div>
                    <div style="margin-bottom: 10px; display: flex; align-items: center; gap: 10px;">
                        <label style="font-weight: bold;">Mã giảm giá (Voucher):</label>
                        <input type="text" name="voucherCode" value="${requestScope.voucherCode}" placeholder="SALE15, SALE20, SALE30" style="padding: 5px; border: 1px solid #ccc; border-radius: 4px; text-transform: uppercase;">
                    </div>
                    <button type="submit" style="background-color: #438bf1; color: white; border: none; padding: 7px 15px; border-radius: 4px; cursor: pointer;">Áp dụng / Cập nhật</button>
                </form>
            </div>
        </div>

        <div class="total-payment"
             style="margin-top: 20px; padding: 15px; background-color: #f9f9f9; border-top: 2px solid #ddd; text-align: right;">
            <h3 style="color: #333; line-height: 1.6;">
                <c:if test="${requestScope.ptGiam > 0}">
                    <span style="font-size: 0.95rem; color: #4caf50; font-weight: bold;">
                        ✓ Đã áp dụng voucher ${requestScope.voucherCode} (giảm ${requestScope.ptGiam}%)
                    </span><br>
                    <span style="font-size: 0.9rem; color: #777; font-weight: normal;">
                        Số tiền được giảm: -${requestScope.giamGia} đồng
                    </span><br>
                </c:if>
                Tổng thanh toán: <br>
                <span style="color: #ff5722; font-size: 1.5rem;">${requestScope.tongGia}</span>
            </h3>
        </div>

        <div >
            <form action="${pageContext.request.contextPath}/ThanhToanController" method="post">
                <input type="hidden" name="soLuong" value="${requestScope.soLuong}">
                <input type="hidden" name="idVe" value="${requestScope.veInfo.idVe}">
                <input type="hidden" name="voucherCode" value="${requestScope.voucherCode}">
                <button class="btn-xac-nhan-dat-ve" type="submit">Thanh toán</button>
            </form>
        </div>
    </div>
</div>
<%@ include file="../../layout/Footer.jsp" %>

</body>
</html>