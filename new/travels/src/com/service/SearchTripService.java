package com.service;

import java.util.ArrayList;
import java.util.List;

import com.dao.SearchTripDao;
import com.model.TripMessage;

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
	
}
