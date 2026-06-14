<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Xác nhận đặt vé</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/xac_nhan_dat_ve/xac_nhan_dat_ve.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">
    <style>
        .voucher-option {
            display: flex !important;
            align-items: center !important;
            background: #ffffff !important;
            border: 2px solid #e2e8f0 !important;
            border-radius: 10px !important;
            cursor: pointer !important;
            gap: 12px !important;
            margin-bottom: 10px !important;
            padding: 12px !important;
            transition: all 0.2s ease-in-out !important;
            width: 100% !important;
            box-sizing: border-box !important;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02) !important;
        }
        .voucher-option:hover {
            border-color: #0056b3 !important;
            background-color: #f8faff !important;
            box-shadow: 0 2px 8px rgba(0, 86, 179, 0.1) !important;
        }
        .voucher-option.is-selected {
            border-color: #28a745 !important;
            background-color: #f4fbf7 !important;
            box-shadow: 0 2px 8px rgba(40, 167, 69, 0.1) !important;
        }
        .voucher-option.is-disabled {
            background: #f6f8fb !important;
            border-color: #e2e8f0 !important;
            opacity: 0.58 !important;
            cursor: not-allowed !important;
            box-shadow: none !important;
        }
        .voucher-option input[type="radio"] {
            display: block !important;
            margin: 0 !important;
            width: 18px !important;
            height: 18px !important;
            accent-color: #28a745 !important;
            cursor: pointer !important;
        }
        .voucher-option span {
            display: flex !important;
            flex-direction: column !important;
            float: none !important;
            text-align: left !important;
        }
        .voucher-option strong {
            display: block !important;
            color: #222 !important;
            font-size: 14px !important;
            font-weight: bold !important;
        }
        .voucher-option small {
            display: block !important;
            color: #666 !important;
            font-size: 12px !important;
            margin-top: 2px !important;
        }
        .total-payment span {
            float: none !important;
        }
    </style>
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
            <div class="input" style="width: 100%;">
                <form action="${pageContext.request.contextPath}/DatVeController" method="post">
                    <input type="hidden" name="idVe" value="${requestScope.veInfo.idVe}">
                    <div style="margin-bottom: 15px; display: flex; align-items: center; gap: 10px;">
                        <label style="font-weight: bold; width: auto; margin: 0;">Số lượng:</label>
                        <input type="number" name="soLuong" value="${requestScope.soLuong}" min="1" step="1" required data-booking-quantity style="width: 70px; padding: 5px; border: 1px solid #ccc; border-radius: 4px; text-align: left;">
                    </div>

                    <div class="voucher-section" style="margin-bottom: 20px;">
                        <div class="section-heading" style="margin-bottom: 10px; font-weight: bold; display: flex; justify-content: space-between; align-items: center;">
                            <span>Voucher giảm giá:</span>
                            <span data-selected-voucher style="font-weight: normal; color: #28a745; float: none !important;">Chưa chọn</span>
                        </div>

                        <label class="voucher-option is-empty">
                            <input type="radio" name="voucherCode" value="" data-voucher-radio data-type="none" ${empty requestScope.voucherCode ? 'checked' : ''}>
                            <span>
                                <strong>Không dùng voucher</strong>
                                <small>Giữ nguyên giá vé</small>
                            </span>
                        </label>

                        <label class="voucher-option">
                            <input type="radio" name="voucherCode" value="FLIGHT50K" data-voucher-radio data-type="fixed" data-value="50000" data-max="50000" data-min="1500000" ${requestScope.voucherCode == 'FLIGHT50K' ? 'checked' : ''}>
                            <span>
                                <strong>Giảm 50.000đ</strong>
                                <small>Đơn từ 1.500.000đ</small>
                            </span>
                        </label>

                        <label class="voucher-option">
                            <input type="radio" name="voucherCode" value="BAY100K" data-voucher-radio data-type="fixed" data-value="100000" data-max="100000" data-min="3000000" ${requestScope.voucherCode == 'BAY100K' ? 'checked' : ''}>
                            <span>
                                <strong>Giảm 100.000đ</strong>
                                <small>Đơn từ 3.000.000đ</small>
                            </span>
                        </label>

                        <label class="voucher-option">
                            <input type="radio" name="voucherCode" value="WEEKEND5" data-voucher-radio data-type="percent" data-value="5" data-max="150000" data-min="2000000" ${requestScope.voucherCode == 'WEEKEND5' ? 'checked' : ''}>
                            <span>
                                <strong>Giảm 5%</strong>
                                <small>Tối đa 150.000đ, đơn từ 2.000.000đ</small>
                            </span>
                        </label>

                        <label class="voucher-option">
                            <input type="radio" name="voucherCode" value="VNA200K" data-voucher-radio data-type="fixed" data-value="200000" data-max="200000" data-min="5000000" data-airline="Vietnam Airlines" ${requestScope.voucherCode == 'VNA200K' ? 'checked' : ''}>
                            <span>
                                <strong>Vietnam Airlines -200.000đ</strong>
                                <small>Đơn từ 5.000.000đ, chỉ áp dụng vé Vietnam Airlines</small>
                            </span>
                        </label>
                    </div>

                    <div style="margin-bottom: 15px; display: flex; flex-direction: column; gap: 8px;">
                        <label style="font-weight: bold; margin: 0; width: auto;">Đổi điểm thưởng:</label>
                        <div style="display: flex; align-items: center; gap: 10px;">
                            <input type="number" name="diemDoi" value="${requestScope.diemDoi}" min="0" max="${requestScope.diemThuong}" step="1" data-reward-input style="width: 90px; padding: 5px; border: 1px solid #ccc; border-radius: 4px; text-align: left;">
                            <span style="font-size: 0.9rem; color: #555; float: none !important;">Đang có ${requestScope.diemThuong} điểm, 1 điểm = ${requestScope.giaTriMotDiem} đồng</span>
                        </div>
                    </div>
                    <button type="submit" style="background-color: #438bf1; color: white; border: none; padding: 7px 15px; border-radius: 4px; cursor: pointer;">Áp dụng / Cập nhật</button>
                </form>
            </div>
        </div>

        <div class="total-payment"
             style="margin-top: 20px; padding: 15px; background-color: #f9f9f9; border-top: 2px solid #ddd; text-align: right;">
            <h3 style="color: #333; line-height: 1.6;">
                <div id="voucher-summary-section" style="display: ${not empty requestScope.voucherCode ? 'block' : 'none'}; float: none !important;">
                    <span id="voucher-summary-title" style="font-size: 0.95rem; color: #4caf50; font-weight: bold; float: none !important;">
                        ✓ Đã áp dụng voucher ${requestScope.voucherCode} <c:if test="${requestScope.ptGiam > 0}">(giảm ${requestScope.ptGiam}%)</c:if>
                    </span><br>
                    <span id="voucher-summary-discount" style="font-size: 0.9rem; color: #777; font-weight: normal; float: none !important;">
                        Số tiền được giảm: -${requestScope.giamGia} đồng
                    </span><br>
                </div>
                <div id="reward-summary-section" style="display: ${requestScope.diemDoi > 0 ? 'block' : 'none'}; float: none !important;">
                    <span id="reward-summary-title" style="font-size: 0.95rem; color: #4caf50; font-weight: bold; float: none !important;">
                        Đã đổi ${requestScope.diemDoi} điểm thưởng
                    </span><br>
                    <span id="reward-summary-discount" style="font-size: 0.9rem; color: #777; font-weight: normal; float: none !important;">
                        Tiền đổi điểm: -${requestScope.giamGiaDiem} đồng
                    </span><br>
                </div>
                <span data-reward-earn style="font-size: 0.9rem; color: #777; font-weight: normal; float: none !important;">
                    Dự kiến nhận: ${requestScope.diemDuKienNhan} điểm
                </span><br>
                Tổng thanh toán: <br>
                <span data-total-payment data-unit-price="${requestScope.veInfo.gia}" data-reward-point-value="${requestScope.giaTriMotDiem}" style="color: #ff5722; font-size: 1.5rem; float: none !important;">${requestScope.tongGia}</span>
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
        var paymentVoucherInput = document.querySelector('input[type="hidden"][name="voucherCode"]');
        var totalElement = document.querySelector('[data-total-payment]');
        var rewardEarnElement = document.querySelector('[data-reward-earn]');

        var voucherRadios = document.querySelectorAll('[data-voucher-radio]');
        var selectedVoucherText = document.querySelector('[data-selected-voucher]');

        var voucherSummarySection = document.getElementById('voucher-summary-section');
        var voucherSummaryTitle = document.getElementById('voucher-summary-title');
        var voucherSummaryDiscount = document.getElementById('voucher-summary-discount');

        var rewardSummarySection = document.getElementById('reward-summary-section');
        var rewardSummaryTitle = document.getElementById('reward-summary-title');
        var rewardSummaryDiscount = document.getElementById('reward-summary-discount');

        if (!quantityInput || !totalElement) {
            return;
        }

        var diemThuong = parseInt('${requestScope.diemThuong}', 10) || 0;
        var ticketAirline = '${requestScope.veInfo.hangBay}';

        function parseMoney(value) {
            return Number(String(value).replace(/[^\d]/g, '')) || 0;
        }

        function formatMoney(value) {
            return new Intl.NumberFormat('vi-VN').format(Math.max(Math.floor(value), 0)) + ' đồng';
        }

        function updateBookingTotal() {
            var quantity = parseInt(quantityInput.value, 10);
            if (isNaN(quantity) || quantity < 1) {
                quantity = 1;
                quantityInput.value = quantity;
            }

            var unitPrice = parseMoney(totalElement.dataset.unitPrice);
            var subtotal = unitPrice * quantity;

            var selectedRadio = null;
            var emptyRadio = null;

            voucherRadios.forEach(function (radio) {
                var option = radio.closest('.voucher-option');
                if (radio.dataset.type === 'none') {
                    emptyRadio = radio;
                    return;
                }

                var minOrder = parseMoney(radio.dataset.min);
                var airlineLimit = radio.dataset.airline || '';
                var isAvailable = subtotal >= minOrder && (!airlineLimit || ticketAirline.indexOf(airlineLimit) !== -1);

                radio.disabled = !isAvailable;
                if (option) {
                    option.classList.toggle('is-disabled', !isAvailable);
                }

                if (!isAvailable && radio.checked) {
                    radio.checked = false;
                }
            });

            var anyChecked = false;
            voucherRadios.forEach(function (radio) {
                if (radio.checked) {
                    anyChecked = true;
                    selectedRadio = radio;
                }
            });

            if (!anyChecked && emptyRadio) {
                emptyRadio.checked = true;
                selectedRadio = emptyRadio;
            }

            voucherRadios.forEach(function (radio) {
                var option = radio.closest('.voucher-option');
                if (option) {
                    option.classList.toggle('is-selected', radio.checked);
                }
            });

            var voucherDiscount = 0;
            if (selectedRadio && selectedRadio.dataset.type !== 'none') {
                var val = parseMoney(selectedRadio.dataset.value);
                var maxDiscount = parseMoney(selectedRadio.dataset.max);
                if (selectedRadio.dataset.type === 'percent') {
                    voucherDiscount = subtotal * val / 100;
                } else {
                    voucherDiscount = val;
                }
                voucherDiscount = Math.min(Math.min(voucherDiscount, maxDiscount), subtotal);
            }

            if (selectedVoucherText) {
                selectedVoucherText.textContent = (selectedRadio && selectedRadio.value) ? selectedRadio.value : 'Chưa chọn';
            }

            if (voucherDiscount > 0) {
                voucherSummarySection.style.display = 'block';
                var pctText = selectedRadio.dataset.type === 'percent' ? ' (giảm ' + selectedRadio.dataset.value + '%)' : '';
                voucherSummaryTitle.textContent = '✓ Đã áp dụng voucher ' + selectedRadio.value + pctText;
                voucherSummaryDiscount.textContent = 'Số tiền được giảm: -' + formatMoney(voucherDiscount);
            } else {
                voucherSummarySection.style.display = 'none';
            }

            var tongSauVoucher = subtotal - voucherDiscount;
            var rewardPointValue = Number(totalElement.dataset.rewardPointValue) || 1000;
            var maxRewardPoints = Math.min(diemThuong, Math.floor((tongSauVoucher * 0.1) / rewardPointValue));

            if (rewardInput) {
                rewardInput.max = maxRewardPoints;
                var rewardPoints = parseInt(rewardInput.value, 10) || 0;
                if (rewardPoints < 0) {
                    rewardPoints = 0;
                }
                if (rewardPoints > maxRewardPoints) {
                    rewardPoints = maxRewardPoints;
                }
                rewardInput.value = rewardPoints;

                var rewardDiscount = rewardPoints * rewardPointValue;
                var total = tongSauVoucher - rewardDiscount;

                if (rewardPoints > 0) {
                    rewardSummarySection.style.display = 'block';
                    rewardSummaryTitle.textContent = 'Đã đổi ' + rewardPoints + ' điểm thưởng';
                    rewardSummaryDiscount.textContent = 'Tiền đổi điểm: -' + formatMoney(rewardDiscount);
                } else {
                    rewardSummarySection.style.display = 'none';
                }

                if (paymentRewardInput) {
                    paymentRewardInput.value = rewardPoints;
                }
            } else {
                var total = tongSauVoucher;
            }

            if (paymentQuantityInput) {
                paymentQuantityInput.value = quantity;
            }
            if (paymentVoucherInput) {
                paymentVoucherInput.value = (selectedRadio && selectedRadio.value) ? selectedRadio.value : '';
            }

            totalElement.textContent = formatMoney(total);
            if (rewardEarnElement) {
                rewardEarnElement.textContent = 'Dự kiến nhận: ' + Math.floor(total / 100000) + ' điểm';
            }
        }

        quantityInput.addEventListener('input', updateBookingTotal);
        quantityInput.addEventListener('blur', updateBookingTotal);
        if (rewardInput) {
            rewardInput.addEventListener('input', updateBookingTotal);
            rewardInput.addEventListener('blur', updateBookingTotal);
        }
        voucherRadios.forEach(function (radio) {
            radio.addEventListener('change', updateBookingTotal);
        });
        updateBookingTotal();
    });
</script>
</body>
</html>
