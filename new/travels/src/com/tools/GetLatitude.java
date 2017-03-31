package com.tools;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.omg.CORBA.PUBLIC_MEMBER;

/*
 * 获取经纬度
 */
public class GetLatitude { 
     
	private static final String Ak = "1YY9z07lbmdpPu5ZZEosE6Wo8PQ7bMNV";  
    
    public static Map<String, String> getLatitude(String address, String city) {  
    	
        try {  
            // 将地址转换成utf-8的16进制  
            address = URLEncoder.encode(address, "UTF-8");  
            city = URLEncoder.encode(city, "UTF-8"); 
  
            URL resjson = new URL("http://api.map.baidu.com/geocoder/v2/?output=json&address=" + address + "&city=" + city + "&ak=" + Ak);  
            BufferedReader in = new BufferedReader(new InputStreamReader(resjson.openStream()));  
            String res;  
            StringBuilder sb = new StringBuilder("");  
            while ((res = in.readLine()) != null) {  
                sb.append(res.trim());  
            }  
            in.close();  
            String str = sb.toString();  
            System.out.println("return json:" + str);  
            if(str!=null&&!str.equals("")){  
                Map<String, String> map = null;  
                int lngStart = str.indexOf("lng\":");  
                int lngEnd = str.indexOf(",\"lat");  
                int latEnd = str.indexOf("},\"precise");  
                if (lngStart > 0 && lngEnd > 0 && latEnd > 0) {  
                    String lng = str.substring(lngStart + 5, lngEnd);  
                    String lat = str.substring(lngEnd + 7, latEnd);  
                    map = new HashMap<String, String>();  
                    map.put("lng", lng);  
                    map.put("lat", lat);  
                    return map;  
                }  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return null;  
    }  
}