package com.edu.hcmuaf.fit.webbanvemaybay.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    private final String SERVERNAME = "localhost";
    private final String DBNAME = "test";
    private final String PORT = "3306";
    private final String USERNAME = "root";
    private final String PASSWORD = "";

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://" + SERVERNAME + ":" + PORT + "/" + DBNAME;
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, USERNAME, PASSWORD);
    }

    public static void main(String[] args) {
        try {
            System.out.println(new DBContext().getConnection());
            System.out.println("Kết nối thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Kết nối thất bại!");
        }
    }
}
