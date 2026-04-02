package com.glamourcosmetics.database;

import java.sql.Connection;

public class test {
    public static void main(String[] args) {
        Connection c = dbconnection.getConnection();
        if (c != null) {
            System.out.println("Connection OK");
            try { c.close(); } catch (Exception e) {}
        } else {
            System.out.println("Connection FAILED");
        }
    }
}
