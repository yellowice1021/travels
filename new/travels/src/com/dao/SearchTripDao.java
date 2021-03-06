package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.TripComment;
import com.model.TripDetail;
import com.model.TripMessage;
import com.model.Users;
import com.mysql.jdbc.exceptions.DeadlockTimeoutRollbackMarker;
import com.tools.DataBase;
import com.tools.GetMD5;

/*
 * 查看行程
 */
public class SearchTripDao {

	// 查看行程信息
	public void searchCityTripMessage(String city, List<TripMessage> tripMessages, int currentPage, int showCount) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_plan where destination=? order by id desc limit ?,?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, city);
			ps.setInt(2, (currentPage-1)*showCount);
			ps.setInt(3, showCount);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TripMessage message = new TripMessage();
				message.setId(rs.getInt("id"));
				message.setTitle(rs.getString("title"));
				message.setInCity(rs.getString("destination"));
				message.setDays(rs.getInt("day"));
				message.setPicture(rs.getString("picture"));
				tripMessages.add(message);
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
	
	// 查看全部行程信息
	public void searchAllTripMessage(List<TripMessage> tripMessages, int currentPage, int showCount) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_plan order by id desc limit ?,?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, (currentPage-1)*showCount);
			ps.setInt(2, showCount);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TripMessage message = new TripMessage();
				message.setId(rs.getInt("id"));
				message.setTitle(rs.getString("title"));
				message.setInCity(rs.getString("destination"));
				message.setDays(rs.getInt("day"));
				message.setPicture(rs.getString("picture"));
				tripMessages.add(message);
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
	
	// 查看指定天数的全部行程信息
	public void searchDayTripMessage(List<TripMessage> tripMessages, int day, int currentPage, int showCount) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_plan where day=? order by id desc limit ?,?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, day);
			ps.setInt(2, (currentPage-1)*showCount);
			ps.setInt(3, showCount);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TripMessage message = new TripMessage();
				message.setId(rs.getInt("id"));
				message.setTitle(rs.getString("title"));
				message.setInCity(rs.getString("destination"));
				message.setDays(rs.getInt("day"));
				message.setPicture(rs.getString("picture"));
				tripMessages.add(message);
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
	
	// 查看指定城市指定天数的全部行程信息
	public void searchCityDayTripMessage(List<TripMessage> tripMessages, String city, int day, int currentPage, int showCount) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_plan where destination=? and day=? order by id desc limit ?,?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, city);
			ps.setInt(2, day);
			ps.setInt(3, (currentPage-1)*showCount);
			ps.setInt(4, showCount);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TripMessage message = new TripMessage();
				message.setId(rs.getInt("id"));
				message.setTitle(rs.getString("title"));
				message.setInCity(rs.getString("destination"));
				message.setDays(rs.getInt("day"));
				message.setPicture(rs.getString("picture"));
				tripMessages.add(message);
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
	
	// 查找所有城市信息
	public void searchTripCity(List<String> citys) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select distinct(destination) from travels_plan";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				citys.add(rs.getString("destination"));
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
	
	// 查找指定id的行程信息
	public void searchIdTripMessage(int id, TripMessage message) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_plan,travels_users where travels_plan.id=? and userid=travels_users.id";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				message.setTitle(rs.getString("title"));
				message.setOutCity(rs.getString("outplace"));
				message.setInCity(rs.getString("destination"));
				message.setDays(rs.getInt("day"));
				message.setIntroduce(rs.getString("introduce"));
				message.setPicture(rs.getString("picture"));
				message.setDate(rs.getString("date"));
				message.setUsers(rs.getInt("userid"));
				message.setId(id);
				message.setFace(rs.getString("face"));
				message.setUsername(rs.getString("username"));
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
	
	// 查找行程详细信息
	public void searchDetailTripMessage(int id, List<TripDetail> tripDetails) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_detail where planid=? order by theday";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TripDetail detail = new TripDetail();
				detail.setDay(rs.getInt("theday"));
				detail.setTrip(rs.getString("plan"));
				detail.setFood(rs.getString("food"));
				detail.setLive(rs.getString("live"));
				detail.setId(rs.getInt("id"));
				tripDetails.add(detail);
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
	
	// 查看指定行程的相关评论信息
	public void searchTripComment(int id, List<TripComment> tripComments, int currentPage, int showCount) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select username,face,publishdate,comment from travels_comment,travels_users where travels_comment.userid=travels_users.id and planid=? order by publishdate desc limit ?,?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setInt(2, (currentPage-1)*showCount);
			ps.setInt(3, showCount);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TripComment comment = new TripComment();
				comment.setUsername(rs.getString("username"));
				comment.setFace(rs.getString("face"));
				comment.setComment(rs.getString("comment"));
				comment.setDate(rs.getString("publishdate"));
				tripComments.add(comment);
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
	
	// 发布评论
	public int searchReleaseComment(int id, int userid, String comment, String date) {
		
		int row = 0;
		Connection conn = DataBase.getConnection();
		String sql = "insert into travels_comment(publishdate,comment,userid,planid) values(?,?,?,?)";
		try
		{	
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, date);
			ps.setString(2, comment);
			ps.setInt(3, userid);
			ps.setInt(4, id);
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
	
	// 查看是否收藏指定行程
	public int searchIfSaveTripMessage(int userid, int id) {
		
		int count = 0;
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_save where planid=? and userid=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setInt(2, userid);
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
	
	// 查找指定用户的全部行程信息
	public void searchIdTripList(int userId, List<TripMessage> tripMessages, int currentPage, int showCount) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_plan where userid=? order by id desc limit ?,?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, (currentPage-1)*showCount);
			ps.setInt(3, showCount);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TripMessage message = new TripMessage();
				message.setId(rs.getInt("id"));
				message.setTitle(rs.getString("title"));
				message.setInCity(rs.getString("destination"));
				message.setDays(rs.getInt("day"));
				message.setPicture(rs.getString("picture"));
				tripMessages.add(message);
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
	
	// 获取指定用户的全部收藏信息
	public void getSaveList(int userId, List<TripMessage> tripMessages, int currentPgae, int showCount) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select travels_plan.id,day,title,picture,destination from travels_save,travels_plan where travels_save.userid=? and planid=travels_plan.id order by travels_plan.id desc limit ?,?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, (currentPgae-1)*showCount);
			ps.setInt(3, showCount);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TripMessage message = new TripMessage();
				message.setId(rs.getInt("id"));
				message.setTitle(rs.getString("title"));
				message.setInCity(rs.getString("destination"));
				message.setDays(rs.getInt("day"));
				message.setPicture(rs.getString("picture"));
				tripMessages.add(message);
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
	
	// 查看所有行程数量
	public int searchTripCount(String sql) {
		
		int count = 0;
		Connection conn = DataBase.getConnection();
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				count = rs.getInt(1);
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
	
	public int searchCommentCount(int planId) {
		
		int count = 0;
		Connection conn = DataBase.getConnection();
		String sql = "select count(*) from travels_comment where planid=?";
		
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, planId);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				count = rs.getInt(1);
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
	
}
