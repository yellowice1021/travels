package com.tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * 数据库操作
 */
public class DataBase {

	static public Connection getConnection()
	{
		Connection conn = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/travels";
			String username = "root";
			String password = "135246";
			conn = DriverManager.getConnection(url, username, password);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return conn;
	}
	
}
