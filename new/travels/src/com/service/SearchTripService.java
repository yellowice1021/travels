package com.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dao.SearchTripDao;
import com.model.TripComment;
import com.model.TripDetail;
import com.model.TripMessage;
import com.sun.org.apache.xerces.internal.util.Status;

/*
 * 查看行程
 */
public class SearchTripService {

	// 查看行程标题信息
	public void searchTripMessage(String city, int day, List<TripMessage> tripMessages, List<String> citys) {
		
		SearchTripDao searchTripDao = new SearchTripDao();
		
		// 查看行程信息
		if(city.equals("全部") && day == 0) {
			searchTripDao.searchAllTripMessage(tripMessages);				
		} else if(city.equals("全部") && day != 0) {
			searchTripDao.searchDayTripMessage(tripMessages, day);
		} else if(!city.equals("全部") && day == 0) {
			searchTripDao.searchCityTripMessage(city, tripMessages);
		} else if(!city.equals("全部") && day != 0) {
			searchTripDao.searchCityDayTripMessage(tripMessages, city, day);
		}
		
		// 查看城市信息
		searchTripDao.searchTripCity(citys);
		
	}
	
	// 查看行程详细信息
	public void searchTripDetail(int userid, int id, TripMessage message, List<TripDetail> tripDetails, List<TripComment> tripComments) {
		
		SearchTripDao searchTripDao = new SearchTripDao();
		
		searchTripDao.searchIdTripMessage(id, message);
		if(searchTripDao.searchIfSaveTripMessage(userid, id) == 1) {
			message.setSave(1);
		} else {
			message.setSave(0);
		}
		searchTripDao.searchDetailTripMessage(id, tripDetails);
		searchTripDao.searchTripComment(id, tripComments);

		
	}
	
	// 发布行程评论
	public String searchReleaseComment(int id, int userid, String comment) {
		
		String status = "success";
		SearchTripDao searchTripDao = new SearchTripDao();
		
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String time = format.format(date);
		
		if(searchTripDao.searchReleaseComment(id, userid, comment, time) != 1) {
			status = "error";
			return status;
		}
		
		return status;
		
	}
	
	// 查看用户行程
	public void searchUserTripMessage(int planId, TripMessage tripMessage, List<TripDetail> tripDetails) {
		
		SearchTripDao searchTripDao = new SearchTripDao();
		
		searchTripDao.searchIdTripMessage(planId, tripMessage);
		searchTripDao.searchDetailTripMessage(planId, tripDetails);
		
	}
	
}
