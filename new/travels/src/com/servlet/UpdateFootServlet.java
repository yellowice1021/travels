package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Foot;
import com.service.FootService;

/**
 * Servlet implementation class UpdateFootServlet
 */
@WebServlet("/UpdateFootServlet")
public class UpdateFootServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFootServlet() {
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

		int id = Integer.parseInt(request.getParameter("id"));
		String dates = request.getParameter("dates");
		int days = Integer.parseInt(request.getParameter("days"));
		String introduce = request.getParameter("introduce");
		Foot foot = new Foot();
		FootService footService = new FootService();
		
		foot.setId(id);
		foot.setDate(dates);
		foot.setDay(days);
		foot.setIntroduce(introduce);
		
		footService.updateFoot(foot);
		
	}

}
