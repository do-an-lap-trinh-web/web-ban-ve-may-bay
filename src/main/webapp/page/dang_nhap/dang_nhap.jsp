<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/dang_nhap/dang_nhap.css">
</head>
<body>
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
    <div class="login-container">
        <h2>
            ĐĂNG NHẬP
        </h2>
        <form action="${pageContext.request.contextPath}/LoginController" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Nhập tên tài khoản" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" id="passwordField" placeholder="Nhập mật khẩu" required>
                <div class="toggle-password" onclick="togglePassword()">
                    <svg id="eyeIcon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                        <circle cx="12" cy="12" r="3"></circle>
                    </svg>
                </div>
            </div>

            <button type="submit" class="btn-login">Đăng nhập</button>
            <a href="${pageContext.request.contextPath}/page/quen_mat_khau/quen_mat_khau.jsp" class="forgot-password">Quên Mật Khẩu?</a>
        </form>

        <div class="divider">HOẶC</div>

        <button type="button" class="btn-google" onclick="loginWithGoogle()">
            <img src="https://upload.wikimedia.org/wikipedia/commons/c/c1/Google_%22G%22_logo.svg" alt="Google Logo">
            Đăng nhập bằng Google
        </button>

        <div class="register-link">
            Chưa có tài khoản? <a href="${pageContext.request.contextPath}/page/dang_ky/dang_ky.jsp">Đăng ký ngay</a>
        </div>

        <div class="back-home">
            <a href="../../index.jsp">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="19" y1="12" x2="5" y2="12"></line>
                    <polyline points="12 19 5 12 12 5"></polyline>
                </svg>
                Quay về trang chủ
            </a>
        </div>
    </div>

<script>
    function togglePassword() {
        const passwordField = document.getElementById("passwordField");
        const eyeIcon = document.getElementById("eyeIcon");

        if (passwordField.type === "password") {
            passwordField.type = "text";
            eyeIcon.innerHTML = '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path><line x1="1" y1="1" x2="23" y2="23"></line>';
        } else {
            passwordField.type = "password";
            eyeIcon.innerHTML = '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle>';
        }
    }
</script>

<script>
    function loginWithGoogle() {
        const clientId = "826731372195-vjh60mr742ukbsth61tg2st4n7f3rpf8.apps.googleusercontent.com";

        const redirectUri = "http://localhost:8080/web_ban_ve_may_bay_war_exploded/GoogleLoginController";

        const googleAuthUrl = "https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri="
            + redirectUri
            + "&response_type=code&client_id="
            + clientId;

        window.location.href = googleAuthUrl;
    }
</script>

</body>
</html>