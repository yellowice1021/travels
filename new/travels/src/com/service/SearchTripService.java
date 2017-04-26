package com.service;

import java.sql.SQLClientInfoException;
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
import com.sun.xml.internal.bind.v2.model.core.ID;

/*
 * 查看行程
 */
public class SearchTripService {

	// 查看行程标题信息
	public void searchTripMessage(String city, int day, List<TripMessage> tripMessages, List<String> citys, int currentPage) {
		
		SearchTripDao searchTripDao = new SearchTripDao();
		int showCount = 6;
		
		// 查看行程信息
		if(city.equals("全部") && day == 0) {
			searchTripDao.searchAllTripMessage(tripMessages, currentPage, showCount);				
		} else if(city.equals("全部") && day != 0) {
			searchTripDao.searchDayTripMessage(tripMessages, day, currentPage, showCount);
		} else if(!city.equals("全部") && day == 0) {
			searchTripDao.searchCityTripMessage(city, tripMessages, currentPage, showCount);
		} else if(!city.equals("全部") && day != 0) {
			searchTripDao.searchCityDayTripMessage(tripMessages, city, day ,currentPage, showCount);
		}
		
		// 查看城市信息
		searchTripDao.searchTripCity(citys);
		
	}
	
	// 查看行程详细信息
	public void searchTripDetail(int userid, int id, TripMessage message, List<TripDetail> tripDetails, List<TripComment> tripComments, int currentPage) {
		
		SearchTripDao searchTripDao = new SearchTripDao();
		int showCount = 4;
		
		searchTripDao.searchIdTripMessage(id, message);
		if(searchTripDao.searchIfSaveTripMessage(userid, id) == 1) {
			message.setSave(1);
		} else {
			message.setSave(0);
		}
		searchTripDao.searchDetailTripMessage(id, tripDetails);
		searchTripDao.searchTripComment(id, tripComments, currentPage, showCount);

		
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
	
	// 查看分页信息
	public String searchTripPages(int currentPage, String place, int day, String operator, int id) {
		
		int pages;
		int count;
		SearchTripDao searchTripDao = new SearchTripDao();
		String sql = "";
		
		if(operator.equals("search")) {
			if(place.equals("全部") && day == 0) {
				sql = "select count(*) from travels_plan";
			} else if(place.equals("全部") && day != 0) {
				sql = "select count(*) from travels_plan where day="+ day;
			} else if(!place.equals("全部") && day == 0) {
				sql = "select count(*) from travels_plan where destination='"+ place + "'";
			} else if(!place.equals("全部") && day != 0 ) {
				sql = "select count(*) from travels_plan where destination='" + place + "' and day=" + day;
			}
		} else if(operator.equals("users")) {
			sql = "select count(*) from travels_plan where userid=" + id;
		} else if(operator.equals("save")) {
			sql = "select count(*) from travels_save where userid=" + id;
		}
		
		count = searchTripDao.searchTripCount(sql);
		
		if(count%6 == 0) {
			pages = count/6;
		} else {
			pages = count/6 + 1;
		}
		StringBuffer sb = new StringBuffer();
		
		if(pages == 1) {
			sb.append("");
		} else if(operator.equals("search")){
		
			if(currentPage > 1) {
				sb.append("<a href='SearchTripServlet?page=" + (currentPage - 1) + "&place=" + place + "&day=" + day + "'>上一页</a>\n");
			}
			
			for(int i = 1; i <= pages; i++) {
				if(i == currentPage) {
					sb.append("<a href='javascript:void(0);' class='active'>" + i + "</a>\n");
				} else {
					sb.append("<a href='SearchTripServlet?page=" + i + "&place=" + place + "&day=" + day + "'>" + i + "</a>\n");
				}
			}
			
			if(currentPage < pages) {
				sb.append("<a href='SearchTripServlet?page=" + (currentPage + 1) + "&place=" + place + "&day=" + day + "'>下一页</a>\n");
			}
			
		} else if (operator.equals("users")) {
			
			if(currentPage > 1) {
				sb.append("<a href='UsersTripServlet?page=" + (currentPage - 1) + "'>上一页</a>\n");
			}
			
			for(int i = 1; i <= pages; i++) {
				if(i == currentPage) {
					sb.append("<a href='UsersTripServlet?page=" + i + "' class='active'>" + i + "</a>\n");
				} else {
					sb.append("<a href='UsersTripServlet?page=" + i + "'>" + i + "</a>\n");
				}
			}
			
			if(currentPage < pages) {
				sb.append("<a href='UsersTripServlet?page=" + (currentPage + 1) + "'>下一页</a>\n");
			}
			
		} else if(operator.equals("save")) {
			
			if(currentPage > 1) {
				sb.append("<a href='UsersSaveServlet?page=" + (currentPage - 1) + "'>上一页</a>\n");
			}
			
			for(int i = 1; i <= pages; i++) {
				if(i == currentPage) {
					sb.append("<a href='UsersSaveServlet?page=" + i + "' class='active'>" + i + "</a>\n");
				} else {
					sb.append("<a href='UsersSaveServlet?page=" + i + "'>" + i + "</a>\n");
				}
			}
			
			if(currentPage < pages) {
				sb.append("<a href='UsersSaveServlet?page=" + (currentPage + 1) + "'>下一页</a>\n");
			}
			
		}
		
		return sb.toString();
		
	}
	
	// 查看评论分页信息
	public String searchCommentPage(int currentPage, int planId) {
		
		int pages;
		int count;
		SearchTripDao searchTripDao = new SearchTripDao();
		
		count = searchTripDao.searchCommentCount(planId);
		
		System.out.print(count);
		
		if(count%4 == 0) {
			pages = count/4;
		} else {
			pages = count/4 + 1;
		}
		
		StringBuffer sb = new StringBuffer();
		
		if(pages == 1) {
			sb.append("");
		} else {
		
			if(currentPage > 1) {
				sb.append("<a href='SearchDetailServlet?page=" + (currentPage - 1) + "&id=" + planId + "'>上一页</a>\n");
			}
			
			for(int i = 1; i <= pages; i++) {
				if(i == currentPage) {
					sb.append("<a href='javascript:void(0);' class='active'>" + i + "</a>\n");
				} else {
					sb.append("<a href='SearchDetailServlet?page=" + i + "&id=" + planId + "'>" + i + "</a>\n");
				}
			}
			
			if(currentPage < pages) {
				sb.append("<a href='SearchDetailServlet?page=" + (currentPage + 1) + "&id=" + planId + "'>下一页</a>\n");
			}
			
		}
		
		return sb.toString();
		
	}
	
}
