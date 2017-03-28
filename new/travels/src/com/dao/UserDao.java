package com.dao;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.Users;
import com.tools.DataBase;
import com.tools.GetMD5;

/*
 * 用户相关操作
 */
public class UserDao {

	// 判断用户名密码是否正确
	public int checkLogin(String username, String passwords) throws NoSuchAlgorithmException{
		int count = 0;
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_users where username=? and password=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, GetMD5.getmd5Code(passwords));
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
	
	// 判断用户名是否已经存在
	public int checkRegister(String username){
		int count = 0;
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_users where username=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
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
		
	// 添加用户
	public int addUsers(String username, String passwords) throws UnsupportedEncodingException, NoSuchAlgorithmException {
		int row = 0;
		Connection conn = DataBase.getConnection();
		String sql = "insert into travels_users(username,password) values(?,?)";
		try
		{	
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, GetMD5.getmd5Code(passwords));
			row = ps.executeUpdate();
			ps.close();
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return row;
	}
	
	// 获取用户信息
	public Users getMessage(String username) {
		
		Users users = new Users();
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_users where username=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				users.setUserId(rs.getInt("id"));
				users.setUserName(rs.getString("username"));
				users.setUserPassword(rs.getString("password"));
				users.setUserSex(rs.getString("sex"));
				users.setUserProvince(rs.getString("province"));
				users.setUserCity(rs.getString("city"));
				users.setUserIntroduce(rs.getString("introduce"));
				users.setUserFace(rs.getString("face"));
			}
			rs.close();
			ps.close();
			conn.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return users;
		
	}
	
	
}
