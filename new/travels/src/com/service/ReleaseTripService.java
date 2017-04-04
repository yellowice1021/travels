package com.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.naming.java.javaURLContextFactory;
import org.eclipse.jdt.internal.compiler.env.IGenericField;

import com.dao.ReleaseTripDao;
import com.model.TripDetail;
import com.model.TripMessage;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.tools.GetLatitude;

/*
 * 发布行程
 */
public class ReleaseTripService {

	// 获取城市经纬度
	public String[] getLatitude(String inCity, String outCity) {
		
		String[] latitudes = new String[4];
		Map<String, String> inCityMap = GetLatitude.getLatitude(inCity, inCity);
		Map<String, String> outCityMap = GetLatitude.getLatitude(outCity, outCity);
		
		if(inCityMap != null) {
			latitudes[0] = inCityMap.get("lng");
			latitudes[1] = inCityMap.get("lat");
		}
		if(outCityMap != null) {
			latitudes[2] = outCityMap.get("lng");
			latitudes[3] = outCityMap.get("lat");
		}
		
		return latitudes;
		
	}
	
	// 填写行程信息
	public void setTripMessage(HttpServletRequest request, String path, TripMessage tripMessage) {
		
		int userId = (int) request.getSession().getAttribute("userId");
		String filePath = "";
		String filename = new Date().getTime() + "";
		tripMessage.setUsers(userId);
		
		// 获取当前日期时间
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String time = format.format(date);
		tripMessage.setDate(time);
		
		//判断上传表单是否为multipart/form-data类型
        if(ServletFileUpload.isMultipartContent(request))
        {
            try {
                // 创建DiskFileItemFactory对象，设置缓冲区大小和临时文件目录
                DiskFileItemFactory factory = new DiskFileItemFactory();
                
                // 创建ServletFileUpload对象，并设置上传文件的大小限制。
                ServletFileUpload  sfu = new ServletFileUpload(factory);
                sfu.setSizeMax(10*1024*1024);		//以byte为单位    不能超过10M  1024byte = 1kb  1024kb=1M 1024M = 1G
                sfu.setHeaderEncoding("utf-8");
                
                // 调用ServletFileUpload.parseRequest方法解析request对象，得到一个保存了所有上传内容的List对象。
                List<FileItem> fileItemList = sfu.parseRequest(request);
                Iterator<FileItem> fileItems = fileItemList.iterator();
                
                // 遍历list，每迭代一个FileItem对象，调用其isFormField方法判断是否是上传文件
                while(fileItems.hasNext())
                {
                    FileItem fileItem = fileItems.next();
                    // 普通表单元素
                    if(fileItem.isFormField())
                    {
                        String name = fileItem.getFieldName();//name属性值
                        String value = fileItem.getString("utf-8");//name对应的value值      
                        if(name.equals("title")) {
                        	tripMessage.setTitle(value);
                        }else if(name.equals("outCity")) {
                        	tripMessage.setOutCity(value);
                        }else if(name.equals("inCity")) {
                        	tripMessage.setInCity(value);
                        }else if(name.equals("days")) {
                        	tripMessage.setDays(Integer.parseInt(value));
                        }else if(name.equals("introduce")) {
                        	tripMessage.setIntroduce(value);
                        }
                    }
                    // <input type="file">的上传文件的元素
                    else
                    {
                        String fileName = fileItem.getName();//文件名称
                        System.out.println("原文件名：" + fileName);//Koala.jpg
                        
                        String suffix = fileName.substring(fileName.lastIndexOf('.'));
                        System.out.println("扩展名：" + suffix);//.jpg
                        
                        // 新文件名（唯一）
                        String newFileName = filename + suffix;
                        System.out.println("新文件名：" + newFileName);//image\1478509873038.jpg
                        
                        // 调用FileItem的write()方法，写入文件
                        File file = new File("D:/java/tomcat/webapps/travels/" + path + "/" + newFileName);
                        System.out.println(file.getAbsolutePath());
                        fileItem.write(file);
                        
                        // 调用FileItem的delete()方法，删除临时文件
                        fileItem.delete();
                        filePath = path + "/" + newFileName;
                        tripMessage.setPicture(filePath);
                    }
                }
                
            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
	}
	
	// 发布行程标题信息
	public String addTripMessage(TripMessage tripMessage) throws UnsupportedEncodingException, NoSuchAlgorithmException {
		
		String status = "success";
		ReleaseTripDao releaseTripDao = new ReleaseTripDao();
		
		if(releaseTripDao.addTripMessage(tripMessage) != 1) {
			status = "error";
		}
		
		return status;
		
	}
	
	// 填写行程具体信息
	public String addTripDetail(HttpServletRequest request) {
		
		String status = "success";
		int id = Integer.parseInt(request.getParameter("id"));
		int day = Integer.parseInt(request.getParameter("days"));
		List<TripDetail> tripDetails = new ArrayList<TripDetail>();
		ReleaseTripDao releaseTripDao = new ReleaseTripDao();
		int row = 0;
		
		for(int i = 1; i <= day; i++) {
			String trip = "trip" + i;
			String food = "food" + i;
			String live = "live" + i;
			TripDetail tripDetail = new TripDetail();
			tripDetail.setDay(i);
			tripDetail.setTrip(request.getParameter(trip));
			tripDetail.setFood(request.getParameter(food));
			tripDetail.setLive(request.getParameter(live));
			tripDetails.add(tripDetail);
		}
		
		for(TripDetail trip: tripDetails) {
			row = releaseTripDao.addTripDetail(id, trip);
			if(row != 1) {
				status = "error";
				return status;
			}
		}
		
		return status;
		
	}
	
}
