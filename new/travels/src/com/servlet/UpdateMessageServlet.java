package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UpdateDao;
import com.service.UpdateService;

/**
 * Servlet implementation class UpdateMessageServlet
 */
@WebServlet("/UpdateMessageServlet")
public class UpdateMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMessageServlet() {
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
		String username = request.getParameter("username");
		String sex = request.getParameter("sex");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String introduce = request.getParameter("introduce");
		
		String status = "";
		UpdateService updateService = new UpdateService();
		status = updateService.UpdateMessage(username, sex, province, city, introduce);
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(status);
		response.getWriter().flush();
		response.getWriter().close();
		
	}

}
