<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/access/trang_chu/Logo.png" alt="">
        <a href="${pageContext.request.contextPath}/index.jsp">MáyBayOnline</a>
    </div>

    <div class="menu">
        <a href="${pageContext.request.contextPath}/index.jsp">Trang Chủ</a>
        <c:url var="urlTimVe" value="/ThongTinTimVeController">
            <c:param name="khoiHanh" value="Việt Nam" />
            <c:param name="haCanh" value="Việt Nam" />
        </c:url>
        <a href="${urlTimVe}">Đặt Vé</a>
        <a href="${pageContext.request.contextPath}/page/thong_tin_ve_noi_dia/ve_noi_dia.jsp">Vé Nội Địa</a>
        <a href="${pageContext.request.contextPath}/page/thong_tin_ve_quoc_te/ve_quoc_te.jsp">Vé Quốc Tế</a>
        <a href="${pageContext.request.contextPath}/page/lien_he/lien_he.jsp">Thông Tin Liên Hệ</a>
        <a href="${pageContext.request.contextPath}/VeDaDatController">Vé đã đặt</a>
        <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin'}">
            <a href="${pageContext.request.contextPath}/admin/user-controller">Admin</a>
        </c:if>
    </div>

    <div class="auth">
        <a href="${pageContext.request.contextPath}/GioHangController" class="cart-btn">
            <img src="${pageContext.request.contextPath}/access/shopping-cart.png" alt="Giỏ hàng">
        </a>
        <c:if test="${sessionScope.user == null}">
            <a href="${pageContext.request.contextPath}/page/dang_nhap/dang_nhap.jsp">Đăng Nhập</a> |
            <a href="${pageContext.request.contextPath}/page/dang_ky/dang_ky.jsp">Đăng Ký</a>
        </c:if>
        <c:if test="${sessionScope.user != null}">
            <a href="${pageContext.request.contextPath}/ThongTinNguoiDungController?id=${sessionScope.user.id}">${sessionScope.user.username}</a>
            <form action="${pageContext.request.contextPath}/DangXuatController" method="post">
                <button class="btn-dang-xuat" type="submit">Đăng Xuất</button>
            </form>
        </c:if>
    </div>
</header>

