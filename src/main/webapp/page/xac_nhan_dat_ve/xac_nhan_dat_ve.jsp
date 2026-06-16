<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Xác nhận đặt vé máy bay</title>
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

<div class="checkout-wrapper">
    <h1 class="checkout-page-title">Xác Nhận Đặt Vé</h1>

    <div class="checkout-container">

        <div class="checkout-card flight-card">
            <div class="card-header">
                <span class="airline-brand">✈ ${requestScope.veInfo.hangBay}</span>
                <span class="ticket-price-badge">${requestScope.veInfo.gia} VNĐ / vé</span>
            </div>

            <div class="flight-route-display">
                <div class="route-node text-right">
                    <div class="route-time">${requestScope.veInfo.thoiGianKhoiHanh}</div>
                    <div class="route-station">${requestScope.veInfo.sanBayDi}</div>
                </div>

                <div class="route-divider">
                    <span class="dot"></span>
                    <div class="line"></div>
                    <span class="plane-icon">✈</span>
                    <div class="line"></div>
                    <span class="dot"></span>
                </div>

                <div class="route-node text-left">
                    <div class="route-time">${requestScope.veInfo.thoiGianHaCanh}</div>
                    <div class="route-station">${requestScope.veInfo.sanBayDen}</div>
                </div>
            </div>
        </div>

        <div class="checkout-card options-card">
            <form action="${pageContext.request.contextPath}/DatVeController" method="post" id="updateForm">
                <input type="hidden" name="idVe" value="${requestScope.veInfo.idVe}">

                <div class="option-group quantity-group">
                    <label>Số lượng:</label>
                    <input type="number" name="soLuong" value="${requestScope.soLuong}" min="1" step="1" required data-booking-quantity class="qty-input">
                </div>

                <div class="option-group voucher-group">
                    <div class="group-heading">
                        <span>Mã giảm giá (Voucher)</span>
                        <span data-selected-voucher class="selected-highlight">Chưa chọn</span>
                    </div>

                    <div class="voucher-scroll-list">
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
                                <small>Đơn từ 5tr, chỉ áp dụng vé Vietnam Airlines</small>
                            </span>
                        </label>
                    </div>
                </div>

                <div class="option-group reward-group">
                    <div class="group-heading">
                        <span>Đổi điểm thưởng</span>
                        <span class="reward-balance">Đang có ${requestScope.diemThuong} điểm</span>
                    </div>
                    <div class="reward-input-wrapper">
                        <input type="number" name="diemDoi" value="${requestScope.diemDoi}" min="0" max="${requestScope.diemThuong}" step="1" data-reward-input class="qty-input">
                        <span class="reward-rate-note">(1 điểm = ${requestScope.giaTriMotDiem} đồng)</span>
                    </div>
                </div>

                <button type="submit" class="btn-outline-update" style="display: none;">Cập nhật lại giá</button>
            </form>
        </div>

        <div class="checkout-card summary-card">
            <div class="summary-details">
                <div id="voucher-summary-section" class="summary-row text-success" style="display: ${not empty requestScope.voucherCode ? 'flex' : 'none'};">
                    <span id="voucher-summary-title">✓ Mã ${requestScope.voucherCode} <c:if test="${requestScope.ptGiam > 0}">(giảm ${requestScope.ptGiam}%)</c:if></span>
                    <span id="voucher-summary-discount">-${requestScope.giamGia} đ</span>
                </div>

                <div id="reward-summary-section" class="summary-row text-success" style="display: ${requestScope.diemDoi > 0 ? 'flex' : 'none'};">
                    <span id="reward-summary-title">Đổi ${requestScope.diemDoi} điểm thưởng</span>
                    <span id="reward-summary-discount">-${requestScope.giamGiaDiem} đ</span>
                </div>

                <div class="summary-row text-muted mt-2 border-top-dash">
                    <span>Điểm thưởng nhận được:</span>
                    <span data-reward-earn>${requestScope.diemDuKienNhan} điểm</span>
                </div>
            </div>

            <div class="grand-total-row">
                <span class="total-label">Tổng thanh toán:</span>
                <span class="total-amount" data-total-payment data-unit-price="${requestScope.veInfo.gia}" data-reward-point-value="${requestScope.giaTriMotDiem}">${requestScope.tongGia}</span>
            </div>

            <form action="${pageContext.request.contextPath}/ThanhToanController" method="post" class="final-checkout-form">
                <input type="hidden" name="soLuong" value="${requestScope.soLuong}" data-payment-quantity>
                <input type="hidden" name="idVe" value="${requestScope.veInfo.idVe}">
                <input type="hidden" name="voucherCode" value="${requestScope.voucherCode}">
                <input type="hidden" name="diemDoi" value="${requestScope.diemDoi}" data-payment-reward>

                <button class="btn-checkout-massive" type="submit">THANH TOÁN NGAY</button>
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
                voucherSummarySection.style.display = 'flex';
                var pctText = selectedRadio.dataset.type === 'percent' ? ' (giảm ' + selectedRadio.dataset.value + '%)' : '';
                voucherSummaryTitle.textContent = '✓ Đã áp dụng mã ' + selectedRadio.value + pctText;
                voucherSummaryDiscount.textContent = '-' + formatMoney(voucherDiscount);
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
                    rewardSummarySection.style.display = 'flex';
                    rewardSummaryTitle.textContent = 'Đổi ' + rewardPoints + ' điểm thưởng';
                    rewardSummaryDiscount.textContent = '-' + formatMoney(rewardDiscount);
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
                rewardEarnElement.textContent = Math.floor(total / 100000) + ' điểm';
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