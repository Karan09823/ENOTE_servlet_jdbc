package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	private static Connection conn;
	
	
	public static Connection getCon() {
		
		
		try {
			
			if(conn==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes_servlet","root","root");
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return conn;
	}

}
