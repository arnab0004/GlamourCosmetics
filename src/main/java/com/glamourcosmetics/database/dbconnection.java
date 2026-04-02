package com.glamourcosmetics.database;


import java.sql.Connection;
import java.sql.DriverManager;

public class dbconnection {
	
	 private static final String URL = "jdbc:mysql://localhost:3306/glamour_db";
	    private static final String USERNAME = "root"; 
	    private static final String PASSWORD = "root"; 

	    
	    public static Connection getConnection() {
	        Connection connection = null;

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	            System.out.println("Database Connected Successfully!");
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("Database Connection Failed!");
	        }

	        return connection;
	    }
}
