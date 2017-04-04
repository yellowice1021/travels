package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.SearchTripDao;
import com.model.TripMessage;
import com.service.SearchTripService;

/**
 * Servlet implementation class SearchTripServlet
 */
@WebServlet("/SearchTripServlet")
public class SearchTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTripServlet() {
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
		
		String place = request.getParameter("place");
		int day = Integer.parseInt(request.getParameter("day"));

		byte[] bytes = place.getBytes("ISO-8859-1");	 
		place = new String(bytes,"utf-8");
		
		List<TripMessage> tripMessages = new ArrayList<TripMessage>();
		List<String> citys = new ArrayList<String>();
		SearchTripService searchTripService = new SearchTripService();
		
		searchTripService.searchTripMessage(place, day, tripMessages, citys);
		
		request.setAttribute("tripMessage", tripMessages);
		request.setAttribute("citys", citys);
		request.setAttribute("place", place);
		request.setAttribute("day", day);
		request.getRequestDispatcher("pages/search/search.jsp").forward(request, response);;
		
	}

}
