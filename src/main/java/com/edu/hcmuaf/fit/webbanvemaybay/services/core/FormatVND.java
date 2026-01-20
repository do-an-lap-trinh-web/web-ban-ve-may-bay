package com.edu.hcmuaf.fit.webbanvemaybay.services.core;

public class FormatVND {
    public static String formatVND(double amount) {
        String stAmount = (int) amount + "";
        StringBuilder sb = new StringBuilder();
        int index = 0;
        for (int i = stAmount.length() - 1; i >= 0; i--) {
            sb.append(stAmount.charAt(i));
            index++;
            if (index == 3 && i != 0) {
                sb.append(".");
                index = 0;
            }
        }
        return sb.reverse().toString();
    }
}
