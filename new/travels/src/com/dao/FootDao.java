package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.model.Foot;
import com.model.TripMessage;
import com.tools.DataBase;
import com.tools.GetMD5;

/*
 * 我的足迹
 */
public class FootDao {

	// 添加足迹
	public int addFoot(Foot foot) {
		
		int row = 0;
		Connection conn = DataBase.getConnection();
		String sql = "insert into travels_foot(province,city,date,day,introduce,longitude,latitude,userid) values(?,?,?,?,?,?,?,?)";
		try
		{	
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, foot.getProvince());
			ps.setString(2, foot.getCity());
			ps.setString(3, foot.getDate());
			ps.setInt(4, foot.getDay());
			ps.setString(5, foot.getIntroduce());
			ps.setString(6, foot.getLongitude());
			ps.setString(7, foot.getLatitude());
			ps.setInt(8, foot.getUserid());
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
	
	// 判断该足迹是否存在
	public int ifFoot(Foot foot) {
		
		int count = 0;
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_foot where city=? and date=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, foot.getCity());
			ps.setString(2, foot.getDate());
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
	
	// 查看足迹
	public void getFoot(int userId, List<Foot> foots) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_foot where userid=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Foot foot = new Foot();
				foot.setId(rs.getInt("id"));
				foot.setProvince(rs.getString("province"));
				foot.setCity(rs.getString("city"));
				foot.setDate(rs.getString("date"));
				foot.setDay(rs.getInt("day"));
				foot.setIntroduce(rs.getString("introduce"));
				foot.setLongitude(rs.getString("longitude"));
				foot.setLatitude(rs.getString("latitude"));
				foot.setUserid(rs.getInt("userid"));
				foots.add(foot);
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
	
	// 修改足迹
	public int updateDao(Foot foot) {
		
		System.out.print(foot.getDate());
		System.out.print(foot.getDay());
		System.out.print(foot.getIntroduce());
		System.out.print(foot.getId());
		
		int count = 0;
		try
		{
			Connection conn = DataBase.getConnection();
			String sql = "update travels_foot set date=?,day=?,introduce=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, foot.getDate());
			ps.setInt(2, foot.getDay());
			ps.setString(3, foot.getIntroduce());
			ps.setInt(4, foot.getId());
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
