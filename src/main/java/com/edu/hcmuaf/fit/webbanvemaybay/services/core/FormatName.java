package com.edu.hcmuaf.fit.webbanvemaybay.services.core;

public class FormatName {
    public static String[] getHoTenInFullName(String fullName) {
        String[] arrKyTu = fullName.trim().split(" ");
        StringBuilder sbTen = new StringBuilder();
        sbTen.append(arrKyTu[arrKyTu.length - 1]);
        StringBuilder sbHo = new StringBuilder();
        for (int i = 0; i < arrKyTu.length - 1; i++) {
            if (i == arrKyTu.length - 2) {
                sbHo.append(arrKyTu[i]);
                break;
            }
            sbHo.append(arrKyTu[i] + " ");
        }
        String[] res = {sbHo.toString(), sbTen.toString()};
        return res;
    }
}
