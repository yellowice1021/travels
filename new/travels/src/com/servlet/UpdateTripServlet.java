package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.TripDetail;
import com.model.TripMessage;
import com.service.SearchTripService;

/**
 * Servlet implementation class UpdateTripServlet
 */
@WebServlet("/UpdateTripServlet")
public class UpdateTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTripServlet() {
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
		
		int planId = Integer.parseInt(request.getParameter("planId"));
		
		System.out.print(planId);
		
		TripMessage tripMessage = new TripMessage();
		List<TripDetail> tripDetails = new ArrayList<TripDetail>();
		SearchTripService searchTripService = new SearchTripService();
		
		searchTripService.searchUserTripMessage(planId, tripMessage, tripDetails);
		
		request.setAttribute("tripMessage", tripMessage);
		request.setAttribute("tripDetails", tripDetails);
		request.getRequestDispatcher("pages/search/update.jsp").forward(request, response);
		
	}

}
