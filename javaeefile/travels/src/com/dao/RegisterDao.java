package com.dao;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sun.misc.BASE64Encoder;

import com.tools.DataBase;

/*
 * 注册
 */
public class RegisterDao {

	// 判断用户名是否已经存在
	public void checkRegister(){
		int count = 0;
		Connection conn = DataBase.getConnection();
		String sql = "select * from travels_users where username=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "admins");
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
		System.out.print(count);
	}
	
	// 添加用户
	public void addUsers() throws UnsupportedEncodingException, NoSuchAlgorithmException {
		int row = 0;
		Connection conn = DataBase.getConnection();
		String sql = "insert into travels_users(username,password) values(?,?)";
		try
		{	
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "admin3");
			ps.setString(2, getmd5Code("123"));
			row = ps.executeUpdate();
			ps.close();
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		System.out.print(row);
	}
	
	// md5加密
	public String getmd5Code(String str) throws NoSuchAlgorithmException {
		 // 生成一个MD5加密计算摘要
        MessageDigest md = MessageDigest.getInstance("MD5");
        // 计算md5函数
        md.update(str.getBytes());
        // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
        // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
        return new BigInteger(1, md.digest()).toString(16);
	}
	
}
