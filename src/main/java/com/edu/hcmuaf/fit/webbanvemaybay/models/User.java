package com.edu.hcmuaf.fit.webbanvemaybay.models;

public class User {
    private int id_user;
    private String username;
    private String password;
    private String so_dien_thoai;
    private String email;
    private String code_xac_thuc;
    private String hang_xac_thuc;

    public User() {
    }

    public User(int id_user, String username, String password, String so_dien_thoai, String email, String code_xac_thuc, String hang_xac_thuc) {
        this.id_user = id_user;
        this.username = username;
        this.password = password;
        this.so_dien_thoai = so_dien_thoai;
        this.email = email;
        this.code_xac_thuc = code_xac_thuc;
        this.hang_xac_thuc = hang_xac_thuc;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSo_dien_thoai() {
        return so_dien_thoai;
    }

    public void setSo_dien_thoai(String so_dien_thoai) {
        this.so_dien_thoai = so_dien_thoai;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCode_xac_thuc() {
        return code_xac_thuc;
    }

    public void setCode_xac_thuc(String code_xac_thuc) {
        this.code_xac_thuc = code_xac_thuc;
    }

    public String getHang_xac_thuc() {
        return hang_xac_thuc;
    }

    public void setHang_xac_thuc(String hang_xac_thuc) {
        this.hang_xac_thuc = hang_xac_thuc;
    }
}