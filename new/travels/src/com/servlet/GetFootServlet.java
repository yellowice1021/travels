package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.model.Foot;
import com.service.FootService;

/**
 * Servlet implementation class GetFootServlet
 */
@WebServlet("/GetFootServlet")
public class GetFootServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFootServlet() {
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
		
		int userId = (int) request.getSession().getAttribute("userId");
		FootService footService = new FootService();
		List<Foot> foots = new ArrayList<Foot>();
		
		footService.getFoot(userId, foots);
		
		response.setCharacterEncoding("utf-8");
		JSONArray json1 = JSONArray.fromObject(foots);
		response.getWriter().write(json1.toString());
		System.out.print(json1.toString() + "\n");
		response.getWriter().flush();
		response.getWriter().close();
		
	}

}
