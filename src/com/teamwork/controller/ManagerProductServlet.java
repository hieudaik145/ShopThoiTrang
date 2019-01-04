package com.teamwork.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamwork.model.bean.Category;
import com.teamwork.model.bean.Product;
import com.teamwork.model.dao.CategoryDao;
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
        String tenSP = request.getParameter("tenSP");
        String product_id = request.getParameter("product_id");
        String category_name= request.getParameter("category_name");
        String image = "images/"+request.getParameter("image");
        String image1 ="images/"+ request.getParameter("image1");
        String image2 = "images/"+request.getParameter("image2");
        String price = request.getParameter("price");
        String oldPrice = request.getParameter("oldPrice");
        String description = request.getParameter("description");
        String overview = request.getParameter("overview");
        String additional = request.getParameter("additional");
        String review = request.getParameter("review");
        System.out.println(command);
        System.out.println(image);
       
        CategoryDao categoryDao = new CategoryDao();
        Category c = new Category();
		try {
			c = categoryDao.selectCategorybyName(category_name);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
        System.out.println(c.getCategory_ID());
        
        String url = "";
      
        try {
    
                switch (command) {
                    case "insert":
                    	if(productDao.insertProduct(new Product(
                    		(int) c.getCategory_ID(),tenSP, image, image1, image2, Double.parseDouble(price), Double.parseDouble(oldPrice), description, overview, additional, review))) {
                    		url = "/admin/manager_product.jsp";
                    	}
                    	else
                    	{
                    		request.setAttribute("inserterr", "Lỗi Thêm product");
                    		url = "/admin/insert_product.jsp";
                    	}
                        break;
                        
                    case "update":
                    	if(productDao.updateProduct(new Product(Long.parseLong(product_id), (int) c.getCategory_ID(),tenSP, image, image1, image2, Double.parseDouble(price), Double.parseDouble(oldPrice), description, overview, additional, review))) {
                    		url = "/admin/manager_product.jsp";
                    	}
                    	else
                    	{
                    		request.setAttribute("inserterr", "Lỗi Thêm product");
                    		url = "/admin/update_product.jsp";
                    	}
                        break;
                }
            
        } catch (Exception e) {
        	e.printStackTrace();
        }
        RequestDispatcher rd =	request.getRequestDispatcher(url);
        rd.forward(request, response);

	}

}
