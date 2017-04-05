package com.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.SearchTripDao;
import com.service.SearchTripService;

/**
 * Servlet implementation class ReleaseCommentServlet
 */
@WebServlet("/ReleaseCommentServlet")
public class ReleaseCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReleaseCommentServlet() {
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
		
		String status = "";
		String path = "";
		int id = Integer.parseInt(request.getParameter("id"));
		String comment = request.getParameter("comment");
		int userid = (int) request.getSession().getAttribute("userId");		
		SearchTripService searchTripService = new SearchTripService();
		
		status = searchTripService.searchReleaseComment(id, userid, comment);
		
		path = "SearchDetailServlet?id=" + id + "&status=" + status;
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
