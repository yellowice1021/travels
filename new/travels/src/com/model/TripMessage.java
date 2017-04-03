package com.model;

/*
 * 发布行程信息类
 */
public class TripMessage {

	private String title;
	private String outCity;
	private String inCity;
	private String days;
	private String introduce;
	private String picture;
	private String date;
	private int users;
	private int id;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOutCity() {
		return outCity;
	}
	public void setOutCity(String outCity) {
		this.outCity = outCity;
	}
	public String getInCity() {
		return inCity;
	}
	public void setInCity(String inCity) {
		this.inCity = inCity;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getUsers() {
		return users;
	}
	public void setUsers(int users) {
		this.users = users;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
