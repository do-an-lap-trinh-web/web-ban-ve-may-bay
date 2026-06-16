<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách vé đã đặt</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/list_ve_da_dat/list_ve_da_dat.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">

</head>
<body>
<%@ include file="../../layout/Header.jsp" %>
<%
    String messageThanhToan = (String) request.getAttribute("messageThanhToan");
    if (messageThanhToan != null) {
%>
<script>
    alert("<%= messageThanhToan %>")
</script>
<%
    }
    String messageHuyVe = (String) request.getAttribute("messageHuyVe");
    if (messageHuyVe != null) {
%>
<script>
    alert("<%= messageHuyVe %>")
</script>
<%
    }
%>
<div class="list-ve-container">
    <h1 class="page-title">Vé Máy Bay Đã Đặt</h1>

    <div class="booked-tickets-wrapper">
        <c:choose>
            <c:when test="${not empty listVeDaDat}">
                <c:forEach var="item" items="${listVeDaDat}">

                    <div class="booked-card">
                        <div class="booked-header">
                            <div class="airline-brand">
                                <span class="plane-icon">✈</span>
                                <span class="airline-name">${item.veDto.hangBay}</span>
                            </div>
                            <div class="booking-status">Đã đặt thành công</div>
                        </div>

                        <div class="booked-body">
                            <div class="flight-point text-right">
                                <div class="time">${item.veDto.thoiGianKhoiHanh}</div>
                                <div class="airport-code">${item.veDto.diemDi}</div>
                                <div class="airport-name">${item.veDto.khoiHanh}</div>
                            </div>

                            <div class="flight-divider">
                                <span class="dot"></span>
                                <div class="line"></div>
                                <span class="dot"></span>
                            </div>

                            <div class="flight-point text-left">
                                <div class="time">${item.veDto.thoiGianHaCanh}</div>
                                <div class="airport-code">${item.veDto.diemDen}</div>
                                <div class="airport-name">${item.veDto.haCanh}</div>
                            </div>
                        </div>

                        <%
                            com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDaDatDto itemObj = (com.edu.hcmuaf.fit.webbanvemaybay.models.DTO.VeDaDatDto) pageContext.getAttribute("item");
                            boolean canCancel = false;
                            if (itemObj != null && itemObj.getVeDto() != null && itemObj.getVeDto().getThoiGianKhoiHanh() != null) {
                                try {
                                    String depTimeStr = itemObj.getVeDto().getThoiGianKhoiHanh().replace(" ", "T");
                                    if (depTimeStr.contains(".")) {
                                        depTimeStr = depTimeStr.substring(0, depTimeStr.indexOf("."));
                                    }
                                    java.time.LocalDateTime departureTime = java.time.LocalDateTime.parse(depTimeStr);
                                    canCancel = java.time.LocalDateTime.now().plusDays(1).isBefore(departureTime);
                                } catch (Exception e) {
                                }
                            }
                            String thanhTien = "0";
                            if (itemObj != null && itemObj.getVeDto() != null && itemObj.getVeDto().getGia() != null) {
                                try {
                                    double donGia = Double.parseDouble(itemObj.getVeDto().getGia().replaceAll("[^0-9]", ""));
                                    thanhTien = com.edu.hcmuaf.fit.webbanvemaybay.services.core.FormatVND.formatVND(donGia * itemObj.getSoLuong());
                                } catch (Exception e) {
                                    thanhTien = itemObj.getVeDto().getGia();
                                }
                            }
                            pageContext.setAttribute("canCancel", canCancel);
                            pageContext.setAttribute("thanhTien", thanhTien);
                        %>

                        <div class="booked-footer">
                            <div class="ticket-summary">
                                <span class="qty">Số lượng: <strong>${item.soLuong}</strong> vé</span>
                                <span class="total-price">Tổng tiền: <strong>${thanhTien}đ</strong></span>
                            </div>

                            <div class="ticket-action">
                                <c:choose>
                                    <c:when test="${canCancel}">
                                        <form action="${pageContext.request.contextPath}/HuyVeController" method="post" style="margin: 0;" onsubmit="return confirm('Bạn có chắc chắn muốn hủy vé máy bay này không? Thao tác này không thể hoàn tác.');">
                                            <input type="hidden" name="idVe" value="${item.veDto.idVe}">
                                            <input type="hidden" name="idUser" value="${sessionScope.user.id}">
                                            <button type="submit" class="btn-cancel active">Hủy vé</button>
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn-cancel disabled" disabled title="Chỉ được phép hủy vé trước 1 ngày so với giờ khởi hành">Hết hạn hủy</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>

            <c:otherwise>
                <div class="no-tickets-message">
                    <img src="${pageContext.request.contextPath}/access/trang_chu/no-data-icon.png" alt="No tickets" style="width: 80px; opacity: 0.5; margin-bottom: 15px;">
                    <p>Bạn chưa có vé máy bay nào đã đặt.</p>
                    <a href="${pageContext.request.contextPath}/" class="btn-book-now">Đặt vé ngay</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<%@ include file="../../layout/Footer.jsp" %>

<script src="list_ve_da_dat.js"></script>
</body>
</html>
