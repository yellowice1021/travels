package com.tools;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/*
 * 上传文件
 */
public class Upload {

	public static List<String> uploadFiles(HttpServletRequest request, String filename, String path) {
		
		List<String> facePath = new ArrayList<String>();
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
                        System.out.println(name + " = "+value);
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
                        facePath.add(path + "/" + newFileName);
                    }
                }
                
            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return facePath;
	}
	
}
