package com.dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tools.DataBase;
import com.tools.GetMD5;

/*
 * 修改信息
 */
public class UpdateDao {
	
	// 检查旧密码是否正确
	public int checkPasswords(String username, String oldPasswords) throws NoSuchAlgorithmException {
		int count = 0;
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_users where username=? and password=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, GetMD5.getmd5Code(oldPasswords));
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				count++;
			}
			rs.close();
			ps.close();
			conn.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return count;
	}
	
	// 更新密码
	public int updatePasswords(String username, String newPasswords) {
		int count = 0;
		try
		{
			Connection conn = DataBase.getConnection();
			String sql = "update travels_users set password=? where username=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, GetMD5.getmd5Code(newPasswords));
			ps.setString(2, username);
			count = ps.executeUpdate();
			ps.close();
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	
	// 更新头像
	public int updateFace(int userId, String path) {
		int count = 0;
		try
		{
			Connection conn = DataBase.getConnection();
			String sql = "update travels_users set face=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, path);
			ps.setInt(2, userId);
			count = ps.executeUpdate();
			ps.close();
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		System.out.print(count);
		return count;
	}
	
	// 更新个人信息
	public int updateMessage(String username, String sex, String province, String city, String introduce) {
		
		int count = 0;
		try
		{
			Connection conn = DataBase.getConnection();
			String sql = "update travels_users set sex=?,province=?,city=?,introduce=? where username=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, sex);
			ps.setString(2, province);
			ps.setString(3, city);
			ps.setString(4, introduce);
			ps.setString(5, username);
			count = ps.executeUpdate();
			ps.close();
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
		
	}
	
}
