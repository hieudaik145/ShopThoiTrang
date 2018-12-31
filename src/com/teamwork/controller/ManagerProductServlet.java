package com.teamwork.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamwork.model.bean.Category;
import com.teamwork.model.bean.Product;
import com.teamwork.model.dao.ProductDao;


@WebServlet("/ManagerProductServlet")
public class ManagerProductServlet extends HttpServlet {
	ProductDao productDao = new ProductDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
	        String command = request.getParameter("command");
	        String product_id = request.getParameter("product_id");

	        String url = "";
	        try {
	            switch (command) {

	                case "delete":
	                	productDao.deleteProduct(Long.parseLong(product_id));
	                    url = "/admin/manager_product.jsp";
	                    break;
	            }
	        } catch (Exception e) {
	        }
	        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
	        rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String tenDanhMuc = request.getParameter("tenDanhMuc");
        String product_id = request.getParameter("product_id");
        
        String url = "", error = "";
        if (tenDanhMuc.equals("")) {
            error = "Vui lòng nhập tên danh mục!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                    	if(productDao.insertProduct(new Product(Long.parseLong(product_id), 
                    			0, tenDanhMuc, error, error, error, 0, 0, error, error, error, error))) {
                    		 url = "/admin/manager_product.jsp";
                    	}
                       
                        break;
                        
                    case "update":
                    	productDao.updateProduct(new Product(Long.parseLong(request.getParameter("product_id")),
                               0, tenDanhMuc, error, error, error, 0, 0, error, error, error, error));
                        url = "/admin/manager_product.jsp";
                        break;
                }
            } else {
                url = "/admin/insert_product.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

	}

}
