package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect 
{

	private static Connection conn = null;
	
	private DBConnect()
	{
		
	}
	
	public static Connection getConn()
	{
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = System.getenv("DB_URL") != null ? System.getenv("DB_URL") : "mysql://root:AVEbllMOfQWBFMpefpQWyZPKIwwBatCK@mysql.railway.internal:3306/railway";
			String user = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : "root";
			String pass = System.getenv("DB_PASS") != null ? System.getenv("DB_PASS") : "AVEbllMOfQWBFMpefpQWyZPKIwwBatCK";
			conn = DriverManager.getConnection(url,user,pass);

		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return conn;
	}
	
	
}
