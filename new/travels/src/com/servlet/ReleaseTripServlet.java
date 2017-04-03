package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.management.counter.Variability;

import com.dao.ReleaseTripDao;
import com.model.TripDetail;
import com.service.ReleaseTripService;

/**
 * Servlet implementation class ReleaseTripServlet
 */
@WebServlet("/ReleaseTripServlet")
public class ReleaseTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReleaseTripServlet() {
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
		
		request.setCharacterEncoding("utf-8");
		
		ReleaseTripService releaseTripService = new ReleaseTripService();
		String status = "";
		
		status = releaseTripService.addTripDetail(request);
		if(status == "success") {
			response.sendRedirect("pages/common/success.jsp");
		} else if(status == "error") {
			response.sendRedirect("pages/common/fail.jsp");
		}
		
	}

}
