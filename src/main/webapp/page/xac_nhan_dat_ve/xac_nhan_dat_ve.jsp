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
            <label>Số lượng</label>
            <div class="input">
                <form action="${pageContext.request.contextPath}/DatVeController" method="post">
                    <input type="hidden" name="idVe" value="${requestScope.veInfo.idVe}">
                    <input type="number" name="soLuong" value=${requestScope.soLuong} min="1">
                    <button type="submit">Xác nhận số lượng</button>
                </form>
            </div>
        </div>

        <div class="total-payment"
             style="margin-top: 20px; padding: 15px; background-color: #f9f9f9; border-top: 2px solid #ddd; text-align: right;">
            <h3 style="color: #333;">
                Tổng thanh toán: <br>
                <span style="color: #ff5722; font-size: 1.5rem;">${requestScope.tongGia}</span>
            </h3>
        </div>

        <div class="btn-xac-nhan-dat-ve">
            <a href="../../index.jsp">Thanh Toán</a>
        </div>
    </div>
</div>
<%@ include file="../../layout/Footer.jsp" %>

</body>
</html>