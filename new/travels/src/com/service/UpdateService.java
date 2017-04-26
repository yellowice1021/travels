package com.service;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import sun.management.counter.Variability;

import com.dao.UpdateDao;
import com.model.TripDetail;
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
		
		int userId = (int) request.getSession().getAttribute("userId");
		UpdateDao updateDao = new UpdateDao();
		String fileName = new Date().getTime() + "";
		int count = 0;

		List<String> facePath = Upload.uploadFiles(request, fileName, "images/users");
		
		for(String path: facePath) {
			count = updateDao.updateFace(userId, path);
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
	
	// 修改行程信息
	public String UpdateTripDetail(HttpServletRequest request) {
		
		String status = "success";
		int row = 0;
		
		int days = Integer.parseInt(request.getParameter("days"));
		List<TripDetail> tripDetails = new ArrayList<TripDetail>();
		UpdateDao updateDao = new UpdateDao();
		
		for(int i = 1; i <= days; i++) {
			String id = "id" + i;
			String trip = "trip" + i;
			String food = "food" + i;
			String live = "live" + i;
			TripDetail tripDetail = new TripDetail();
			tripDetail.setDay(i);
			tripDetail.setTrip(request.getParameter(trip));
			tripDetail.setFood(request.getParameter(food));
			tripDetail.setLive(request.getParameter(live));
			tripDetail.setId(Integer.parseInt(request.getParameter(id)));
			tripDetails.add(tripDetail);
		}
		
		for(TripDetail tripDetail: tripDetails) {
			row = updateDao.updateTripMessage(tripDetail);
			if(row != 1) {
				status = "error";
				return status;
			}
		}
		
		return status;
		
	}
	
}
