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
 * Servlet implementation class AddFootServlet
 */
@WebServlet("/AddFootServlet")
public class AddFootServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFootServlet() {
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
		
		int userId = (int) request.getSession().getAttribute("userId");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String dates = request.getParameter("dates");
		int days = Integer.parseInt(request.getParameter("days"));
		String introduce = request.getParameter("introduce");
		FootService footService = new FootService();
		String status = "";
		
		Foot foot = new Foot();
		foot.setProvince(province);
		foot.setCity(city);
		foot.setDate(dates);
		foot.setDay(days);
		foot.setIntroduce(introduce);
		foot.setUserid(userId);
		
		status = footService.addFoot(foot);
		
		response.getWriter().write(status);
		response.getWriter().flush();
		response.getWriter().close();
		
	}

}
