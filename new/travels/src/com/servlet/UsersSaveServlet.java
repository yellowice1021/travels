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
import com.service.SearchTripService;
import com.service.UserService;

/**
 * Servlet implementation class UsersSaveServlet
 */
@WebServlet("/UsersSaveServlet")
public class UsersSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersSaveServlet() {
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
		int currentPage = 1;
		String bar = "";
		SearchTripService searchTripService = new SearchTripService();
		
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		userService.getSaveMessage(userId, tripMessages, currentPage);
		bar = searchTripService.searchTripPages(currentPage, "", 0, "save", userId);
		
		request.setAttribute("tripMessages", tripMessages);
		request.setAttribute("bar", bar);
		request.getRequestDispatcher("pages/users/save.jsp").forward(request, response);
		
	}

}
