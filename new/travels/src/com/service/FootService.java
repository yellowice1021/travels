package com.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import sun.print.resources.serviceui;

import com.dao.FootDao;
import com.dao.UpdateDao;
import com.model.Foot;
import com.tools.GetLatitude;

/*
 * 我的足迹
 */
public class FootService {
	
	// 添加足迹
	public String addFoot(Foot foot) {
		
		String status = "success";
		Map<String, String> cityMap = GetLatitude.getLatitude(foot.getCity(), foot.getCity());
		FootDao footDao = new FootDao();
		
		// 获取经纬度
		if(cityMap != null) {
			foot.setLongitude(cityMap.get("lng"));
			foot.setLatitude(cityMap.get("lat"));
			
		}
		
		// 判断该足迹是否已经存在
		if(footDao.ifFoot(foot) != 0) {
			status = "ifFootError";
			return status;
		} else if(footDao.addFoot(foot) != 1) {
			// 判断添加足迹是否成功
			status = "addFootError";
			return status;
		}
		
		return status;
		
	}
	
	// 查找足迹
	public void getFoot(int userId, List<Foot> foots) {
		
		FootDao footDao = new FootDao();
		
		footDao.getFoot(userId, foots);
		
	}
	
	// 修改足迹
	public String updateFoot(Foot foot) {
		
		String status = "success";
		FootDao footDao = new FootDao();

		if(footDao.updateDao(foot) != 1) {
			status = "updateError";
			return status;
		}
		
		return status;
		
	}
	
	// 删除足迹
	public String deleteFoot(int id) {
		
		String status = "success";
		FootDao footDao = new FootDao();
		
		if(footDao.deleteFoot(id) != 1) {
			status = "deleteError";
			return status;
		}
		
		return status;
		
	}

}
