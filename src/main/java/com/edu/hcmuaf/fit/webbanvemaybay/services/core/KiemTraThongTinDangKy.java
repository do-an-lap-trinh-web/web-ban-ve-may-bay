package com.edu.hcmuaf.fit.webbanvemaybay.services.core;

import com.edu.hcmuaf.fit.webbanvemaybay.models.User;

public class KiemTraThongTinDangKy {
    public String kiemTraThongTinDangKy(User user) {

        // kiểm tra username

        if (user.getUsername() == null || user.getUsername().trim().isEmpty()) {
            return "Bạn phải điền username";
        }
        if (user.getUsername().length() < 7) {
            return "Username phải có tối thiểu 7 ký tự";
        }

        // kiểm tra password
        if (user.getPassword() == null || user.getPassword().isEmpty()) {
            return "Bạn phải điền password";
        }
        if (user.getPassword().length() < 8 || user.getPassword().length() > 16) {
            return "Password phải từ 8 đến 16 ký tự";
        }
        String kyTuDatBiet = "!@#$%^&*()-_=+[]{};:,.<>?/";
        boolean checkKyTuDatBiet = false;
        boolean checkVietHoa = false;
        boolean checkVietThuong = false;
        boolean checkChuSo = false;
        for (int i = 0; i < user.getPassword().length(); i++) {
            char c = user.getPassword().charAt(i);
            if (kyTuDatBiet.contains(c + "")) {
                checkKyTuDatBiet = true;
            } else if (Character.isUpperCase(c)) {
                checkVietHoa = true;
            } else if (Character.isLowerCase(c)) {
                checkVietThuong = true;
            } else if (Character.isDigit(c)) {
                checkChuSo = true;
            }
        }
        if (!checkKyTuDatBiet) return "Mật khẩu phải có ít nhất một ký tự đặc biệt";
        if (!checkVietHoa) return "Mật khẩu phải có ít nhất một ký tự viết hoa";
        if (!checkVietThuong) return "Mật khẩu phải có ít nhất một ký tự viết thường";
        if (!checkChuSo) return "Mật khẩu phải có ít nhất một chữ số";


        //kiểm tra email
        if (user.getEmail() == null || user.getEmail().trim().isEmpty()) {
            return "Bạn phải nhập email";
        }
        if (!user.getEmail().contains("@") || !user.getEmail().contains(".")) {
            return "Định dạng email không hợp lệ";
        }

        // kiểm tra số điện thoại
        if (user.getSoDienThoai() == null || user.getPassword().trim().isEmpty()) {
            return "Bạn phải nhập số điện thoại";
        }
        int sdtLen = user.getSoDienThoai().length();
        if (sdtLen < 10 || sdtLen > 11) {
            return "Số điện thoại phải từ 10 đến 11 chữ số";
        }
        for (char c : user.getSoDienThoai().toCharArray()) {
            if (!Character.isDigit(c)) {
                return "Số điện thoại chỉ được chứa ký tự số";
            }
        }

        return "200";
    }
}
