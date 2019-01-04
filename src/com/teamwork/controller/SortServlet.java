package com.teamwork.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamwork.model.bean.Product;
import com.teamwork.model.dao.SortDao;

/**
 * Servlet implementation class SortServlet
 */
@WebServlet("/SortServlet")
public class SortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
		    response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html; charset=UTF-8");
		 SortDao sortDao = new SortDao();
		String sapxeptheo = request.getParameter("sort");
		String category_id = request.getParameter("category_id");
		String pages = request.getParameter("page");

		switch(sapxeptheo)
		{
		case "Mặc Định":
			request.setAttribute("sort", "0");
			break;
		case "Price Tăng Dần":
			request.setAttribute("sort", "1");
			break;
		case "Price Giảm Dần":
			request.setAttribute("sort", "2");
			break;
		case "Sale Tăng Dần":
			request.setAttribute("sort", "3");
			break;
		case "Sale Giảm Dần":
			request.setAttribute("sort", "4");
			break;
		}
		RequestDispatcher rd = request.getRequestDispatcher("product.jsp?category_id="+category_id+"&pages="+pages);
		rd.forward(request, response);
	}

}
