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
	
	// 收藏行程
	public int saveTrip(int planId, int userId) {
		int row = 0;
		Connection conn = DataBase.getConnection();
		String sql = "insert into travels_save(planid,userid) values(?,?)";
		try
		{	
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, planId);
			ps.setInt(2, userId);
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
	
	// 取消收藏
	public int deleteSave(int planId, int userId) {
		
		int row = 0;
		Connection conn = DataBase.getConnection();
		String sql = "delete from travels_save where planid=? and userid=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, planId);
			ps.setInt(2, userId);
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
	
	// 根据id获取用户信息
	public void getMessageById(int id, Users users) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_users where id=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
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
		
	}
	
	// 获取用户收藏数量
	public void getSaveNumber(int userId, Users users) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select count(*) from travels_save where userid=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				users.setSaveNumber(rs.getInt("count(*)"));
			}
			rs.close();
			ps.close();
			conn.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
	}
	
	// 获取用户行程数量
	public void getTripNumber(int userId, Users users) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select count(*) from travels_plan where userid=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				users.setTripNumber(rs.getInt("count(*)"));
			}
			rs.close();
			ps.close();
			conn.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
	}
	
	// 删除行程
	public int deleteTrip(int id) {
		
		int row = 0;
		Connection conn = DataBase.getConnection();
		String sql = "delete from travels_plan where id=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
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
	
	
}
