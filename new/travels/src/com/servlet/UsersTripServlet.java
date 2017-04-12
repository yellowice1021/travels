package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.TripMessage;
import com.service.UserService;

/**
 * Servlet implementation class UsersTripServlet
 */
@WebServlet("/UsersTripServlet")
public class UsersTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersTripServlet() {
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
		List<TripMessage> tripMessages = new ArrayList<TripMessage>();
		UserService userService = new UserService();
		
		userService.getUserTripMessage(userId, tripMessages);
		
		request.setAttribute("tripMessages", tripMessages);
		request.getRequestDispatcher("pages/users/trips.jsp").forward(request, response);
		
	}

}
