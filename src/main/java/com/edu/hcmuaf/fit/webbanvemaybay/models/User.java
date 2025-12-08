package com.edu.hcmuaf.fit.webbanvemaybay.models;

public class User {
    private int idUser;
    private String username;
    private String password;
    private String soDienThoai;
    private String email;
    private String codeXacThuc;
    private String hangXacThuc;

    public User() {}

    public int getIdUser() { return idUser; }
    public void setIdUser(int idUser) { this.idUser = idUser; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getSoDienThoai() { return soDienThoai; }
    public void setSoDienThoai(String soDienThoai) { this.soDienThoai = soDienThoai; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getCodeXacThuc() { return codeXacThuc; }
    public void setCodeXacThuc(String codeXacThuc) { this.codeXacThuc = codeXacThuc; }
    public String getHangXacThuc() { return hangXacThuc; }
    public void setHangXacThuc(String hangXacThuc) { this.hangXacThuc = hangXacThuc; }
}