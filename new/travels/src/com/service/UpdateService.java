package com.service;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dao.UpdateDao;
import com.servlet.UpdateMessageServlet;
import com.tools.Upload;

/*
 * 修改信息
 */
public class UpdateService {
	
	// 修改密码
	public String updatePassword(String username, String oldPasswords, String newPasswords) throws NoSuchAlgorithmException {
		
		String status = "success";
		UpdateDao updateDao = new UpdateDao();
		
		if(updateDao.checkPasswords(username, oldPasswords) == 0) {
			status = "oldPasswordError";
			return status;
		}
		if(oldPasswords.equals(newPasswords)) {
			status = "samePasswordError";
			return status;
		}
		if(updateDao.updatePasswords(username, newPasswords) == 0) {
			status = "updatePasswordError";
			return status;
		}
		
		return status;
		
	}
	
	// 修改头像
	public void updateFace(HttpServletRequest request) {
		
		UpdateDao updateDao = new UpdateDao();
		String username = (String) request.getSession().getAttribute("username");
		int count = 0;

		List<String> facePath = Upload.uploadFiles(request, username, "images/users");
		
		for(String path: facePath) {
			count = updateDao.updateFace(username, path);
		}
		
	}
	
	// 修改信息
	public String UpdateMessage(String username, String sex, String province, String city, String introduce) {
		
		int count = 0;
		String status = "success";
		UpdateDao updateDao = new UpdateDao();
		
		count = updateDao.updateMessage(username, sex, province, city, introduce);
		if(count != 1) {
			status = "error";
			return status;
		}
		return status;
		
	}
	
}
