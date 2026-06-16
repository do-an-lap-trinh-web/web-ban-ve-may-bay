<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng của bạn</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/gio_hang/gio_hang.css">
</head>
<body>
<%@ include file="../../layout/Header.jsp"%>

<%
    String messageThanhToan = (String) request.getAttribute("messageThanhToan");
    if (messageThanhToan != null) {
%>
<script>
    alert("<%= messageThanhToan %>")
</script>
<%
    }
%>

<div class="cart-container">
    <h1 class="cart-page-title">Giỏ Hàng Của Bạn</h1>

    <div class="cart-layout">
        <div class="cart-left">
            <c:choose>
                <c:when test="${empty sessionScope.gioHang}">
                    <div class="empty-cart-state">
                        <img src="${pageContext.request.contextPath}/access/shopping-cart.png" alt="Giỏ hàng trống" onerror="this.src='https://cdn-icons-png.flaticon.com/512/11329/11329060.png'">
                        <h3>Giỏ hàng của bạn đang trống</h3>
                        <p>Hãy tìm và chọn ngay những chuyến bay tuyệt vời cho hành trình tiếp theo!</p>
                        <a href="${pageContext.request.contextPath}/" class="btn-go-home">Tìm chuyến bay ngay</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${sessionScope.gioHang}" var="item">
                        <div class="cart-ticket-card">
                            <div class="ticket-header">
                                <div class="airline-brand">
                                    <span class="plane-icon">✈</span>
                                    <strong>${item.veDto.hangBay}</strong>
                                </div>
                                <a href="${pageContext.request.contextPath}/GioHangController?action=remove&ve=${item.veDto.idVe}" class="btn-remove-ticket" title="Bỏ chọn vé này">✕ Bỏ chọn</a>
                            </div>

                            <div class="ticket-route-info">
                                <div class="route-point text-right">
                                    <div class="time">${item.veDto.thoiGianKhoiHanh}</div>
                                    <div class="airport">${item.veDto.diemDi}</div>
                                </div>
                                <div class="flight-divider">
                                    <span class="dot"></span>
                                    <div class="line"></div>
                                    <span class="dot"></span>
                                </div>
                                <div class="route-point text-left">
                                    <div class="time">${item.veDto.thoiGianHaCanh}</div>
                                    <div class="airport">${item.veDto.diemDen}</div>
                                </div>
                            </div>

                            <div class="ticket-badges">
                                <span class="badge-item">Chuyến bay: <strong>${item.veDto.soHieuChuyenBay}</strong></span>
                                <span class="badge-item">Hạng ghế: <strong>${item.veDto.hangGhe}</strong></span>
                            </div>

                            <div class="ticket-action-footer">
                                <form action="${pageContext.request.contextPath}/GioHangController" method="post" class="quantity-form">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="idVe" value="${item.veDto.idVe}">
                                    <label>Số lượng:</label>
                                    <input type="number" name="soLuong" value="${item.soLuong}" min="1" step="1" required data-quantity-input data-ticket-id="${item.veDto.idVe}">
                                    <button type="submit" class="btn-update-qty">Cập nhật</button>
                                </form>

                                <div class="ticket-price-total">
                                    <span class="price-val" data-line-price data-unit-price="${item.veDto.gia}" data-airline="${item.veDto.hangBay}">${item.veDto.gia}</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="cart-right">
            <div class="summary-box">
                <div class="summary-title">Chi Tiết Thanh Toán</div>

                <form action="${pageContext.request.contextPath}/ThanhToanGioHangController" method="post" data-checkout-form>

                    <div class="voucher-section">
                        <div class="section-heading">
                            <span>Mã Giảm Giá (Voucher)</span>
                            <span class="selected-text" data-selected-voucher>Chưa chọn</span>
                        </div>

                        <div class="voucher-scroll-list">
                            <label class="voucher-option is-empty">
                                <input type="radio" name="voucherCode" value="" data-voucher-radio data-type="none" checked>
                                <span>
                                        <strong>Không dùng voucher</strong>
                                        <small>Giữ nguyên giá vé</small>
                                    </span>
                            </label>

                            <label class="voucher-option">
                                <input type="radio" name="voucherCode" value="FLIGHT50K" data-voucher-radio data-type="fixed" data-value="50000" data-max="50000" data-min="1500000">
                                <span>
                                        <strong>Giảm 50.000đ</strong>
                                        <small>Đơn từ 1.500.000đ</small>
                                    </span>
                            </label>

                            <label class="voucher-option">
                                <input type="radio" name="voucherCode" value="BAY100K" data-voucher-radio data-type="fixed" data-value="100000" data-max="100000" data-min="3000000">
                                <span>
                                        <strong>Giảm 100.000đ</strong>
                                        <small>Đơn từ 3.000.000đ</small>
                                    </span>
                            </label>

                            <label class="voucher-option">
                                <input type="radio" name="voucherCode" value="WEEKEND5" data-voucher-radio data-type="percent" data-value="5" data-max="150000" data-min="2000000">
                                <span>
                                        <strong>Giảm 5%</strong>
                                        <small>Tối đa 150.000đ, đơn từ 2.000.000đ</small>
                                    </span>
                            </label>

                            <label class="voucher-option">
                                <input type="radio" name="voucherCode" value="VNA200K" data-voucher-radio data-type="fixed" data-value="200000" data-max="200000" data-min="5000000" data-airline="Vietnam Airlines">
                                <span>
                                        <strong>Vietnam Airlines -200.000đ</strong>
                                        <small>Đơn từ 5tr, áp dụng vé Vietnam Airlines</small>
                                    </span>
                            </label>
                        </div>
                    </div>

                    <div class="reward-section">
                        <div class="section-heading">
                            <span>Dùng Điểm Thưởng</span>
                            <span class="selected-text"><span data-available-points>${empty sessionScope.diemThuong ? 0 : sessionScope.diemThuong}</span> điểm có sẵn</span>
                        </div>
                        <div class="reward-control">
                            <input type="range" name="diemDoi" min="0" value="0" step="1" data-reward-range>
                            <input type="number" min="0" value="0" step="1" data-reward-number class="reward-input">
                        </div>
                        <div class="reward-note">1 điểm = 1.000đ. Tối đa 10% giá trị đơn hàng sau voucher.</div>
                    </div>

                    <div class="summary-details">
                        <div class="summary-row">
                            <span>Tạm tính</span>
                            <span data-subtotal>${sessionScope.tongTien}</span>
                        </div>
                        <div class="summary-row discount-row">
                            <span>Voucher giảm</span>
                            <span data-voucher-discount>-0</span>
                        </div>
                        <div class="summary-row discount-row">
                            <span>Đổi điểm giảm</span>
                            <span data-reward-discount>-0</span>
                        </div>
                        <div class="summary-row earn-row">
                            <span>Điểm thưởng nhận được</span>
                            <span><span data-earned-points>0</span> điểm</span>
                        </div>
                    </div>

                    <div class="total-row">
                        <span>Tổng thanh toán</span>
                        <span class="final-price" data-cart-total>${sessionScope.tongTien}</span>
                    </div>

                    <button class="btn-checkout" <c:if test="${empty sessionScope.gioHang}">disabled</c:if>>Xác Nhận Đặt Vé</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="../../layout/Footer.jsp"%>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var quantityInputs = document.querySelectorAll('[data-quantity-input]');
        var voucherRadios = document.querySelectorAll('[data-voucher-radio]');
        var selectedVoucherElement = document.querySelector('[data-selected-voucher]');
        var subtotalElement = document.querySelector('[data-subtotal]');
        var voucherDiscountElement = document.querySelector('[data-voucher-discount]');
        var rewardDiscountElement = document.querySelector('[data-reward-discount]');
        var totalElement = document.querySelector('[data-cart-total]');
        var earnedPointsElement = document.querySelector('[data-earned-points]');
        var rewardRange = document.querySelector('[data-reward-range]');
        var rewardNumber = document.querySelector('[data-reward-number]');
        var availablePointsElement = document.querySelector('[data-available-points]');

        function parseMoney(value) {
            return Number(String(value).replace(/[^\d]/g, '')) || 0;
        }

        function formatMoney(value) {
            return new Intl.NumberFormat('vi-VN').format(Math.max(Math.floor(value), 0)) + ' đồng';
        }

        function getAvailablePoints() {
            return parseInt(String(availablePointsElement ? availablePointsElement.textContent : '0').replace(/[^\d]/g, ''), 10) || 0;
        }

        function getSelectedVoucher() {
            for (var i = 0; i < voucherRadios.length; i++) {
                if (voucherRadios[i].checked) {
                    return voucherRadios[i];
                }
            }
            return null;
        }

        function getEligibleSubtotal(voucherRadio) {
            var airline = voucherRadio.dataset.airline || '';
            var subtotal = 0;

            quantityInputs.forEach(function (input) {
                var quantity = parseInt(input.value, 10);
                var priceRow = input.closest('.ticket-action-footer'); // Đã cập nhật class theo DOM mới
                var priceElement = priceRow.querySelector('[data-line-price]');
                var itemAirline = priceElement.dataset.airline || '';

                if (!airline || itemAirline.indexOf(airline) !== -1) {
                    subtotal += parseMoney(priceElement.dataset.unitPrice) * (isNaN(quantity) || quantity < 1 ? 1 : quantity);
                }
            });

            return subtotal;
        }

        function updateVoucherAvailability(subtotal) {
            var emptyVoucher = null;

            voucherRadios.forEach(function (radio) {
                var option = radio.closest('.voucher-option');
                if (radio.dataset.type === 'none') {
                    emptyVoucher = radio;
                    return;
                }

                var minOrder = parseMoney(radio.dataset.min);
                var eligibleSubtotal = getEligibleSubtotal(radio);
                var isAvailable = subtotal >= minOrder && eligibleSubtotal > 0;

                radio.disabled = !isAvailable;
                if (option) {
                    option.classList.toggle('is-disabled', !isAvailable);
                }

                if (!isAvailable && radio.checked && emptyVoucher) {
                    emptyVoucher.checked = true;
                }
            });
        }

        function updateSelectedVoucherClass() {
            voucherRadios.forEach(function (radio) {
                var option = radio.closest('.voucher-option');
                if (option) {
                    option.classList.toggle('is-selected', radio.checked);
                }
            });
        }

        function calculateVoucherDiscount(voucherRadio, subtotal) {
            if (!voucherRadio || voucherRadio.dataset.type === 'none') {
                return 0;
            }

            var minOrder = parseMoney(voucherRadio.dataset.min);
            var eligibleSubtotal = getEligibleSubtotal(voucherRadio);
            if (subtotal < minOrder || eligibleSubtotal <= 0) {
                return 0;
            }

            var discount = 0;
            var value = parseMoney(voucherRadio.dataset.value);
            var maxDiscount = parseMoney(voucherRadio.dataset.max);

            if (voucherRadio.dataset.type === 'percent') {
                discount = eligibleSubtotal * value / 100;
            } else {
                discount = value;
            }

            return Math.min(Math.floor(discount), maxDiscount, eligibleSubtotal);
        }

        function syncRewardValue(value, maxPoints) {
            var rewardValue = parseInt(value, 10);
            if (isNaN(rewardValue) || rewardValue < 0) {
                rewardValue = 0;
            }
            rewardValue = Math.min(rewardValue, maxPoints);

            if (rewardRange) {
                rewardRange.max = maxPoints;
                rewardRange.value = rewardValue;
            }
            if (rewardNumber) {
                rewardNumber.max = maxPoints;
                rewardNumber.value = rewardValue;
            }

            return rewardValue;
        }

        function updatePrices() {
            var subtotal = 0;

            quantityInputs.forEach(function (input) {
                var quantity = parseInt(input.value, 10);
                if (isNaN(quantity) || quantity < 1) {
                    quantity = 1;
                    input.value = quantity;
                }

                var priceRow = input.closest('.ticket-action-footer'); // Đã cập nhật class theo DOM mới
                var priceElement = priceRow.querySelector('[data-line-price]');
                var unitPrice = parseMoney(priceElement.dataset.unitPrice);
                var lineTotal = unitPrice * quantity;

                priceElement.textContent = formatMoney(lineTotal);
                subtotal += lineTotal;
            });

            updateVoucherAvailability(subtotal);
            var selectedVoucher = getSelectedVoucher();
            var voucherDiscount = calculateVoucherDiscount(selectedVoucher, subtotal);
            var totalAfterVoucher = subtotal - voucherDiscount;
            var maxRewardByOrder = Math.floor((totalAfterVoucher * 0.1) / 1000);
            var maxRewardPoints = Math.min(getAvailablePoints(), maxRewardByOrder);
            var rewardPoints = syncRewardValue(rewardRange ? rewardRange.value : 0, maxRewardPoints);
            var rewardDiscount = rewardPoints * 1000;
            var grandTotal = totalAfterVoucher - rewardDiscount;

            if (selectedVoucherElement) {
                selectedVoucherElement.textContent = selectedVoucher && selectedVoucher.value ? selectedVoucher.value : 'Chưa chọn';
            }
            if (subtotalElement) {
                subtotalElement.textContent = formatMoney(subtotal);
            }
            if (voucherDiscountElement) {
                voucherDiscountElement.textContent = '-' + formatMoney(voucherDiscount);
            }
            if (rewardDiscountElement) {
                rewardDiscountElement.textContent = '-' + formatMoney(rewardDiscount);
            }
            if (totalElement) {
                totalElement.textContent = formatMoney(grandTotal);
            }
            if (earnedPointsElement) {
                earnedPointsElement.textContent = Math.floor(grandTotal / 100000);
            }
            updateSelectedVoucherClass();
        }

        function syncCheckoutQuantities() {
            var checkoutForm = document.querySelector('[data-checkout-form]');
            if (!checkoutForm) {
                return;
            }

            checkoutForm.querySelectorAll('[data-sync-field]').forEach(function (field) {
                field.remove();
            });

            quantityInputs.forEach(function (input) {
                var quantity = parseInt(input.value, 10);
                if (isNaN(quantity) || quantity < 1) {
                    quantity = 1;
                    input.value = quantity;
                }

                var idInput = document.createElement('input');
                idInput.type = 'hidden';
                idInput.name = 'idVe';
                idInput.value = input.dataset.ticketId;
                idInput.setAttribute('data-sync-field', 'true');

                var quantityInput = document.createElement('input');
                quantityInput.type = 'hidden';
                quantityInput.name = 'soLuong';
                quantityInput.value = quantity;
                quantityInput.setAttribute('data-sync-field', 'true');

                checkoutForm.appendChild(idInput);
                checkoutForm.appendChild(quantityInput);
            });
        }

        quantityInputs.forEach(function (input) {
            input.addEventListener('input', updatePrices);
            input.addEventListener('blur', updatePrices);
            input.form.addEventListener('submit', updatePrices);
        });

        voucherRadios.forEach(function (radio) {
            radio.addEventListener('change', updatePrices);
        });

        if (rewardRange) {
            rewardRange.addEventListener('input', function () {
                if (rewardNumber) {
                    rewardNumber.value = rewardRange.value;
                }
                updatePrices();
            });
        }

        if (rewardNumber) {
            rewardNumber.addEventListener('input', function () {
                if (rewardRange) {
                    rewardRange.value = rewardNumber.value;
                }
                updatePrices();
            });
        }

        var checkoutForm = document.querySelector('[data-checkout-form]');
        if (checkoutForm) {
            checkoutForm.addEventListener('submit', function () {
                updatePrices();
                syncCheckoutQuantities();
            });
        }

        updatePrices();
    });
</script>
</body>
</html>