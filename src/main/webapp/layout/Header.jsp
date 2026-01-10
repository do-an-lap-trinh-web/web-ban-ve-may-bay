
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/access/trang_chu/Logo.png" alt="">
        <a href="${pageContext.request.contextPath}/index.jsp">MáyBayOnline</a>
    </div>

    <div class="menu">
        <a href="${pageContext.request.contextPath}/index.jsp">Trang Chủ</a>
        <a href="${pageContext.request.contextPath}/page/tim_ve/tim_ve.jsp">Đặt Vé</a>
        <a href="${pageContext.request.contextPath}/page/thong_tin_ve_noi_dia/ve_noi_dia.jsp">Vé Nội Địa</a>
        <a href="${pageContext.request.contextPath}/page/thong_tin_ve_quoc_te/ve_quoc_te.jsp">Vé Quốc Tế</a>
        <a href="${pageContext.request.contextPath}/page/lien_he/lien_he.jsp">Thông Tin Liên Hệ</a>
        <a href="${pageContext.request.contextPath}/page/list_ve_da_dat/list_ve_da_dat.jsp">Vé đã đặt</a>
        <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin'}">
            <a href="${pageContext.request.contextPath}/user-controller">Admin</a>
        </c:if>
    </div>

    <div class="auth">
        <a href="${pageContext.request.contextPath}/page/gio_hang/gio_hang.jsp" class="cart-btn">

            <img src="${pageContext.request.contextPath}/access/shopping-cart.png" alt="Giỏ hàng">

            <span class="cart-count">0</span>
        </a>
        <a href="${pageContext.request.contextPath}/page/thong_tin_khach_hang/thong_tin_khach_hang.jsp">Thông Tin</a> |
        <a href="${pageContext.request.contextPath}/page/dang_nhap/dang_nhap.jsp">Đăng Nhập</a> |
        <a href="${pageContext.request.contextPath}/page/dang_ky/dang_ky.jsp">Đăng Ký</a>
    </div>
</header>

