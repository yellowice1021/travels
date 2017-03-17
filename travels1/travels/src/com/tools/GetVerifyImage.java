package com.tools;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 获取验证码
 */
public class GetVerifyImage {
	 
	public String verifyImage(HttpServletRequest request, HttpServletResponse response, int width, int height) throws IOException {
		
		//设置不缓存图片  
        response.setHeader("Pragma", "No-cache");  
        response.setHeader("Cache-Control", "No-cache");  
        response.setDateHeader("Expires", 0);  
        
        //指定生成的响应图片,一定不能缺少这句话,否则错误.  
        response.setContentType("image/jpg");  
		
		// 定义BufferedImage对象，获得图像数据缓冲区
		BufferedImage bImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		
		// 获得Graphics对象，Graphics绘制图片
		Graphics graphics = bImage.getGraphics();
		
		// color获取颜色
		Color color = new Color(212, 212, 212);
		graphics.setColor(color);
		graphics.fillRect(0, 0, width, height);
		
		// 设置字体
		graphics.setFont(new Font("Times New Roman", Font.PLAIN, 30));
		
		// 通过random产生随机验证码信息
		char[] ch = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
		Random random = new Random();
		int len = ch.length,
			index;
		StringBuffer sBuffer = new StringBuffer();
		for(int i = 0; i < 4; i++) {
			index = random.nextInt(len);
			graphics.setColor(new Color(random.nextInt(150), random.nextInt(188), random.nextInt(255)));
			graphics.drawString(ch[index] + "", (i*28) + 8, 28);
			sBuffer.append(ch[index]);
		}
		
		// 设置干扰点
		for (int i = 0; i < 30; i++) {  
            int x = random.nextInt(width);   
            int y = random.nextInt(height);   
            graphics.setColor(new Color(random.nextInt(256), random.nextInt(256), random.nextInt(256)));  
            graphics.drawOval(x,y,random.nextInt(5), random.nextInt(5));   
        }   
		graphics.dispose();
		
		// 使用ImageIO输出图片
		ImageIO.write(bImage, "JPG", response.getOutputStream());
		
		return sBuffer.toString();
	}
	
}
