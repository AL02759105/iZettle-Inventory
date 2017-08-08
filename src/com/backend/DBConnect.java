package com.backend;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    private static String url = "jdbc:mysql://127.0.0.1:3306/iz_inventory";    
    private static String driverName = "com.mysql.jdbc.Driver";   
    private static String username = "root";   
    private static String password = "iZettle1";
    private static Connection conn;

    public static Connection getConnection() {
        try {
            Class.forName(driverName);
            try {
                conn = DriverManager.getConnection(url, username, password);
            } catch (SQLException ex) {
                System.out.println("Failed to create the database connection."); 
            }
        } catch (ClassNotFoundException ex) {
            // log an exception. for example:
            System.out.println("Driver not found."); 
        }
        return conn;
    }
}