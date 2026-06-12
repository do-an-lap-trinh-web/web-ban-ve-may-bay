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
                        <input type="number" name="soLuong" value="${requestScope.soLuong}" min="1" step="1" required data-booking-quantity style="width: 70px; padding: 5px; border: 1px solid #ccc; border-radius: 4px;">
                    </div>
                    <div style="margin-bottom: 10px; display: flex; align-items: center; gap: 10px;">
                        <label style="font-weight: bold;">Mã giảm giá (Voucher):</label>
                        <input type="text" name="voucherCode" value="${requestScope.voucherCode}" placeholder="SALE15, SALE20, SALE30" style="padding: 5px; border: 1px solid #ccc; border-radius: 4px; text-transform: uppercase;">
                    </div>
                    <div style="margin-bottom: 10px; font-size: 0.9rem; color: #555;">
                        Ma co the dung: <b>SALE15</b>, <b>SALE20</b>, <b>SALE30</b>
                    </div>
                    <div style="margin-bottom: 10px; display: flex; align-items: center; gap: 10px;">
                        <label style="font-weight: bold;">Diem doi thuong:</label>
                        <input type="number" name="diemDoi" value="${requestScope.diemDoi}" min="0" max="${requestScope.diemThuong}" step="1" data-reward-input style="width: 90px; padding: 5px; border: 1px solid #ccc; border-radius: 4px;">
                        <span style="font-size: 0.9rem; color: #555;">Dang co ${requestScope.diemThuong} diem, 1 diem = ${requestScope.giaTriMotDiem} dong</span>
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
                <c:if test="${requestScope.diemDoi > 0}">
                    <span style="font-size: 0.95rem; color: #4caf50; font-weight: bold;">
                        Da doi ${requestScope.diemDoi} diem thuong
                    </span><br>
                    <span data-reward-discount style="font-size: 0.9rem; color: #777; font-weight: normal;">
                        Tien doi diem: -${requestScope.giamGiaDiem} dong
                    </span><br>
                </c:if>
                <span data-reward-earn style="font-size: 0.9rem; color: #777; font-weight: normal;">
                    Du kien nhan: ${requestScope.diemDuKienNhan} diem
                </span><br>
                Tổng thanh toán: <br>
                <span data-total-payment data-unit-price="${requestScope.veInfo.gia}" data-discount-percent="${requestScope.ptGiam}" data-reward-point-value="${requestScope.giaTriMotDiem}" style="color: #ff5722; font-size: 1.5rem;">${requestScope.tongGia}</span>
            </h3>
        </div>

        <div >
            <form action="${pageContext.request.contextPath}/ThanhToanController" method="post">
                <input type="hidden" name="soLuong" value="${requestScope.soLuong}" data-payment-quantity>
                <input type="hidden" name="idVe" value="${requestScope.veInfo.idVe}">
                <input type="hidden" name="voucherCode" value="${requestScope.voucherCode}">
                <input type="hidden" name="diemDoi" value="${requestScope.diemDoi}" data-payment-reward>
                <button class="btn-xac-nhan-dat-ve" type="submit">Thanh toán</button>
            </form>
        </div>
    </div>
</div>
<%@ include file="../../layout/Footer.jsp" %>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var quantityInput = document.querySelector('[data-booking-quantity]');
        var rewardInput = document.querySelector('[data-reward-input]');
        var paymentQuantityInput = document.querySelector('[data-payment-quantity]');
        var paymentRewardInput = document.querySelector('[data-payment-reward]');
        var totalElement = document.querySelector('[data-total-payment]');
        var rewardDiscountElement = document.querySelector('[data-reward-discount]');
        var rewardEarnElement = document.querySelector('[data-reward-earn]');

        if (!quantityInput || !totalElement) {
            return;
        }

        function parseMoney(value) {
            return Number(String(value).replace(/[^\d]/g, '')) || 0;
        }

        function formatMoney(value) {
            return new Intl.NumberFormat('vi-VN').format(value) + ' đồng';
        }

        function updateBookingTotal() {
            var quantity = parseInt(quantityInput.value, 10);
            if (isNaN(quantity) || quantity < 1) {
                quantity = 1;
                quantityInput.value = quantity;
            }

            var unitPrice = parseMoney(totalElement.dataset.unitPrice);
            var discountPercent = Number(totalElement.dataset.discountPercent) || 0;
            var rewardPointValue = Number(totalElement.dataset.rewardPointValue) || 0;
            var totalBeforeReward = unitPrice * quantity * (1 - discountPercent / 100);
            var rewardPoints = rewardInput ? parseInt(rewardInput.value, 10) : 0;
            var maxRewardPoints = rewardInput ? parseInt(rewardInput.max, 10) : 0;

            if (isNaN(rewardPoints) || rewardPoints < 0) {
                rewardPoints = 0;
            }
            if (!isNaN(maxRewardPoints)) {
                rewardPoints = Math.min(rewardPoints, maxRewardPoints);
            }
            if (rewardPointValue > 0) {
                rewardPoints = Math.min(rewardPoints, Math.floor(totalBeforeReward / rewardPointValue));
            }
            if (rewardInput) {
                rewardInput.value = rewardPoints;
            }

            var rewardDiscount = rewardPoints * rewardPointValue;
            var total = totalBeforeReward - rewardDiscount;

            totalElement.textContent = formatMoney(total);
            if (paymentQuantityInput) {
                paymentQuantityInput.value = quantity;
            }
            if (paymentRewardInput) {
                paymentRewardInput.value = rewardPoints;
            }
            if (rewardDiscountElement) {
                rewardDiscountElement.textContent = 'Tien doi diem: -' + formatMoney(rewardDiscount);
            }
            if (rewardEarnElement) {
                rewardEarnElement.textContent = 'Du kien nhan: ' + Math.floor(total / 100000) + ' diem';
            }
        }

        quantityInput.addEventListener('input', updateBookingTotal);
        quantityInput.addEventListener('blur', updateBookingTotal);
        if (rewardInput) {
            rewardInput.addEventListener('input', updateBookingTotal);
            rewardInput.addEventListener('blur', updateBookingTotal);
        }
        updateBookingTotal();
    });
</script>
</body>
</html>
