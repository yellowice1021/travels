package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.model.TripMessage;
import com.model.Users;
import com.service.UserService;

/**
 * Servlet implementation class SearchPersonalServelt
 */
@WebServlet("/SearchPersonalServelt")
public class SearchPersonalServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPersonalServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int userId = (int) request.getSession().getAttribute("userId");
		Users users = new Users();
		List<TripMessage> tripMessage = new ArrayList<TripMessage>();
		List<TripMessage> tripMessageSave = new ArrayList<TripMessage>();
		UserService userService = new UserService();
		
		userService.getPersonalMessage(userId, users, tripMessage, tripMessageSave);
		
		request.setAttribute("users", users);
		request.setAttribute("tripMessage", tripMessage);
		request.setAttribute("tripMessageSave", tripMessageSave);
		request.getRequestDispatcher("pages/users/personal.jsp").forward(request, response);
		
	}

}
