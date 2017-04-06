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
import com.model.TripComment;
import com.model.TripDetail;
import com.model.TripMessage;
import com.service.SearchTripService;

/**
 * Servlet implementation class SearchDetailServlet
 */
@WebServlet("/SearchDetailServlet")
public class SearchDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchDetailServlet() {
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
		
		int id = Integer.parseInt(request.getParameter("id"));
		String status = request.getParameter("status");
		int userid = (int) request.getSession().getAttribute("userId");

		SearchTripService searchTripService = new SearchTripService();
		TripMessage message = new TripMessage();
		List<TripDetail> tripDetails = new ArrayList<TripDetail>();
		List<TripComment> tripComments = new ArrayList<TripComment>();
		
		searchTripService.searchTripDetail(userid, id, message, tripDetails, tripComments);
		
		if(status == null) {
			request.setAttribute("status", "search");
		} else {
			request.setAttribute("status", status);
		}
		
		request.setAttribute("message", message);
		request.setAttribute("tripDetails", tripDetails);
		request.setAttribute("tripComments", tripComments);
		request.getRequestDispatcher("pages/search/detail.jsp").forward(request, response);
		
	}

}
