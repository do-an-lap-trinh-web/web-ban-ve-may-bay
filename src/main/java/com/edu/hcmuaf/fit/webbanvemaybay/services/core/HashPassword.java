package com.edu.hcmuaf.fit.webbanvemaybay.services.core;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashPassword {
    public static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hashedPassword = md.digest(password.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < hashedPassword.length; i++) {
                sb.append(String.format("%02x", hashedPassword[i]));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

    }
}
