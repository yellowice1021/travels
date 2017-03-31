package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.ReleaseTripService;
import com.tools.GetLatitude;

/**
 * Servlet implementation class ReleasePlaceServlet
 */
@WebServlet("/ReleasePlaceServlet")
public class ReleasePlaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReleasePlaceServlet() {
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
		
		String outCity = request.getParameter("outCity");
		String inCity = request.getParameter("inCity");
		String[] latitudes = new String[4];

		ReleaseTripService releaseTripService = new ReleaseTripService();
		latitudes = releaseTripService.getLatitude(inCity, outCity);

		request.setAttribute("outCity", outCity);
		request.setAttribute("inCity", inCity);
		request.setAttribute("latitudes", latitudes);
		request.getRequestDispatcher("pages/trip/type.jsp").forward(request, response);
		
	}

}
