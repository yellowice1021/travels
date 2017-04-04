package com.dao;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.model.TripDetail;
import com.model.TripMessage;
import com.tools.DataBase;
import com.tools.GetMD5;

/*
 * 发布行程
 */
public class ReleaseTripDao {

	// 添加行程标题相关信息
	public int addTripMessage(TripMessage tripMessage) throws UnsupportedEncodingException, NoSuchAlgorithmException {
		ResultSet rs = null;
		int row = 0;
		Connection conn = DataBase.getConnection();
		String sql = "insert into travels_plan(title,outplace,destination,day,introduce,date,picture,userid) values(?,?,?,?,?,?,?,?)";
		try
		{	
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, tripMessage.getTitle());
			ps.setString(2, tripMessage.getOutCity());
			ps.setString(3, tripMessage.getInCity());
			ps.setInt(4, tripMessage.getDays());
			ps.setString(5, tripMessage.getIntroduce());
			ps.setString(6, tripMessage.getDate());
			ps.setString(7, tripMessage.getPicture());
			ps.setInt(8, tripMessage.getUsers());
			row = ps.executeUpdate();
			rs = ps.getGeneratedKeys();
			if(rs.next()) {
				tripMessage.setId(rs.getInt(1));
			}
			ps.close();
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return row;
	}
	
	// 发布行程
	public int addTripDetail(int id, TripDetail tripDetail) {
		int row = 0;
		Connection conn = DataBase.getConnection();
		String sql = "insert into travels_detail(theday,plan,food,live,planid) values(?,?,?,?,?)";
		try
		{	
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, tripDetail.getDay());
			ps.setString(2, tripDetail.getTrip());
			ps.setString(3, tripDetail.getFood());
			ps.setString(4, tripDetail.getLive());
			ps.setInt(5, id);
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
