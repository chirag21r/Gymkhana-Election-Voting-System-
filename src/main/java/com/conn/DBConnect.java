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
			
			Class.forName("org.postgresql.Driver");
			String url = System.getenv("DB_URL") != null ? System.getenv("DB_URL") : "jdbc:postgresql://ep-raspy-dream-adohxgvs-pooler.c-2.us-east-1.aws.neon.tech:5432/votingappj2ee?sslmode=require&channel_binding=require";
			String user = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : "neondb_owner";
			String pass = System.getenv("DB_PASS") != null ? System.getenv("DB_PASS") : "npg_GtmIJp9VjD8A";
			conn = DriverManager.getConnection(url,user,pass);

		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return conn;
	}
	
	
}
