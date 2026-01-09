package com.edu.hcmuaf.fit.webbanvemaybay.services.core;

import com.edu.hcmuaf.fit.webbanvemaybay.models.User;

public class KiemTraThongTinDangKy {
    public String kiemTraThongTinDangKy(User user) {

        // kiểm tra username

        if (user.getUsername() == null || user.getUsername().equals("")) {
            return "Bạn phải điền username";
        }
        if (user.getUsername().length() < 7) {
            return "username phải có tối thiểu 7 ký tự";
        }

        // kiểm tra password
        if (user.getPassword() == null || user.getPassword().equals("")) {
            return "Bạn phải điền password";
        }
        if (user.getPassword().length() < 7) {
            return "password phải có tối thiểu 7 ký tự";
        }
        String kyTuDatBiet = "!@#$%^&*()-_=+[]{};:,.<>?/";
        boolean checkKyTuDatBiet = false;
        boolean checkVietHoa = false;
        boolean checkChuSo = false;
        for (int i = 0; i < user.getPassword().length(); i++) {
            if (kyTuDatBiet.contains(user.getPassword().charAt(i) + "")) {
                checkKyTuDatBiet = true;
            }
            if (Character.isUpperCase(user.getPassword().charAt(i))) {
                checkVietHoa = true;
            }
            if (Character.isDigit(user.getPassword().charAt(i))) {
                checkChuSo = true;
            }
        }
        if (!checkKyTuDatBiet) {
            return "password phải có ít nhất một ký tự đặt biệt";
        }
        if (!checkVietHoa) {
            return "password phải có ít nhất một ký tự viết hoa";
        }
        if (!checkChuSo) {
            return "password phải có ít nhất một chữ số";
        }


        //kiểm tra email
        if (user.getEmail() == null || user.getEmail().equals("")) {
            return "bạn phải nhập email";
        }
        if (!user.getEmail().contains("@")) {
            return "bạn nhập sai form email";
        }

        // kiểm tra số điện thoại
        if (user.getSoDienThoai() == null || user.getPassword().equals("")) {
            return "bạn phải nhập số điện thoại";
        }
        if (user.getSoDienThoai().length() != 10) {
            return "Số điện thoại không hợp lệ";
        }
        for (int i = 0; i < user.getSoDienThoai().length(); i++) {
            if (!Character.isDigit(user.getSoDienThoai().charAt(i))) {
                return "Số điện thoại không được chứa ký tự";
            }
        }

        return "200";
    }
}
