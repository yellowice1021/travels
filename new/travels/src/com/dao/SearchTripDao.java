package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.TripMessage;
import com.model.Users;
import com.tools.DataBase;

/*
 * 查看行程
 */
public class SearchTripDao {

	// 查看行程信息
	public void searchCityTripMessage(String city, List<TripMessage> tripMessages) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_plan where destination=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, city);
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
	public void searchAllTripMessage(List<TripMessage> tripMessages) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_plan";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
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
	public void searchDayTripMessage(List<TripMessage> tripMessages, int day) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_plan where day=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, day);
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
	public void searchCityDayTripMessage(List<TripMessage> tripMessages, String city, int day) {
		
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_plan where destination=? and day=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, city);
			ps.setInt(2, day);
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
	
}
