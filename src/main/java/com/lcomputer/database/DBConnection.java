package com.lcomputer.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static Connection getConnection() throws SQLException {
		Connection conn = null;
		
		String url = "jdbc:mysql://localhost:3306/aa";
		String id = "root";
		String pw = "1234";
				
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}
}
