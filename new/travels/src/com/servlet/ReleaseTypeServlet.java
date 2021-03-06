package com.servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ReleaseTripDao;
import com.model.TripMessage;
import com.service.ReleaseTripService;
import com.tools.Upload;

/**
 * Servlet implementation class ReleaseTypeServlet
 */
@WebServlet("/ReleaseTypeServlet")
public class ReleaseTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReleaseTypeServlet() {
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
		
		String status = "";
		TripMessage tripMessage = new TripMessage();
		ReleaseTripService releaseTripService = new ReleaseTripService();
		
		releaseTripService.setTripMessage(request, "images/trip/title", tripMessage);
		try {
			status = releaseTripService.addTripMessage(tripMessage);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.print(status);
		
		request.setAttribute("tripMessage", tripMessage);
		request.getRequestDispatcher("pages/trip/trip.jsp").forward(request, response);
		
	}

}
