package com.orilore.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/test";
	private static String uid = "root";
	private static String pwd = "123456";
	
	public static Connection getConnection(){
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,uid,pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
