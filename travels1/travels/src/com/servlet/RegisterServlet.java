package com.servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.RegisterDao;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		
		String username = request.getParameter("username");
		String passwords = request.getParameter("passwords");
		String verifyCode = request.getParameter("verifyCode");
		
		String picCode = (String) request.getSession().getAttribute("piccode");
		
//		response.setCharacterEncoding("utf-8");
//		// 判断验证码是否正确
//		if(!verifyCode.equals(picCode)) {
//			response.getWriter().write("verify");
//		} else {
//			response.getWriter().write("success");
//		}
//		response.getWriter().flush();
//		response.getWriter().close();
		
		RegisterDao registerDao = new RegisterDao();
		try {
			registerDao.addUsers();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
