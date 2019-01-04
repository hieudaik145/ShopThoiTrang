package com.teamwork.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamwork.model.bean.Product;
import com.teamwork.model.dao.ProductDao;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ProductDao productDao = new ProductDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String search = request.getParameter("search");
			try {
				ArrayList<Product> listSearch = productDao.getListProductSearch(search);
				request.setAttribute("listsearch",listSearch);
				RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
				rd.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
