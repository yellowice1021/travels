package com.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import com.dao.UserDao;
import com.model.Users;

/*
 * 用户
 */
public class UserService {

	// 登录
	public String checkLogin(String username, String passwords, String verifyCode, String picCode) throws NoSuchAlgorithmException {
		
		String status = "success";
		UserDao userDao = new UserDao();
		
		// 判断验证码是否正确
		if(!verifyCode.equals(picCode)) {
			status = "verifyError";
			return status;
		}
		// 判断用户名密码是否正确
		if(userDao.checkLogin(username, passwords) == 0) {
			status = "userError";
			return status;
		}
		return status;
		
	}
	
	// 注册
	public String checkRegister(String username, String passwords, String verifyCode, String picCode) throws UnsupportedEncodingException, NoSuchAlgorithmException {
		
		String status = "success";
		UserDao userDao = new UserDao();
		
		// 判断验证码是否正确
		if(!verifyCode.equals(picCode)) {
			status = "verifyError";
			return status;
		}
		// 判断是否用户名已经存在
		if(userDao.checkRegister(username) == 1) {
			status = "usernameError";
			return status;
		}
		// 判断注册是否成功
		if(userDao.addUsers(username, passwords) == 0) {
			status = "updateError";
			return status;
		}
		
		return status;	
	}
	
	// 获取用户信息
	public Users getMessage(String username) {
		
		UserDao userDao = new UserDao();
		Users users = new Users();
		
		users = userDao.getMessage(username);
		return users;
		
	}
	
}
