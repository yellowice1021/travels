package com.servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Users;
import com.service.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		String status = "";
		UserService userService = new UserService();
		Users users = new Users();
		try {
			status = userService.checkLogin(username, passwords, verifyCode, picCode);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 记录用户信息到session中
		if(status == "success") {
			users = userService.getMessage(username);
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("userId", users.getUserId());
		}
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(status);
		response.getWriter().flush();
		response.getWriter().close();
		
	}

}
