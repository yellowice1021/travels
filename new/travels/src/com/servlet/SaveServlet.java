package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.model.Users;
import com.service.UserService;

/**
 * Servlet implementation class SaveServlet
 */
@WebServlet("/SaveServlet")
public class SaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveServlet() {
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
		
		String operate = request.getParameter("operate");
		int planId = Integer.parseInt(request.getParameter("planId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		int loginId = (int) request.getSession().getAttribute("userId");
		
		UserService userService = new UserService();
		String status = "";
		
		if(operate.equals("save")) {
			status = userService.saveTrip(loginId, userId, planId);
		} else if(operate.equals("delete")) {
			status = userService.deleteSave(planId, loginId);
		}
		
		System.out.print(status);
		
		response.getWriter().write(status);
		response.getWriter().flush();
		response.getWriter().close();
		
	}

}
