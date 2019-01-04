package com.teamwork.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.teamwork.model.bean.Category;
import com.teamwork.model.dao.CategoryDao;

@WebServlet("/ManagerCategoryServlet")
public class ManagerCategoryServlet extends HttpServlet {

	CategoryDao categoryDao = new CategoryDao();
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String category_id = request.getParameter("category_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                	categoryDao.deleteCategory(Long.parseLong(category_id));
                    url = "/admin/manager_category.jsp";
                    break;
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String tenDanhMuc = request.getParameter("tenDanhMuc");
        String category_id = request.getParameter("category_id");
        String sex = request.getParameter("sex");
        String url = "", error = "";
        if (tenDanhMuc.equals("")) {
            error = "Vui lòng nhập tên danh mục!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                    	Category c = new Category();
                    	c.setCategory_Name(tenDanhMuc);
                    	c.setSex(sex);
                    	if(categoryDao.insertCategory(c)) {
                    		 url = "/admin/manager_category.jsp";
                    	}
                       
                        break;
                        
                    case "update":
                    	
                    	categoryDao.updateCategory(new Category(Long.parseLong(request.getParameter("category_id")),
                               tenDanhMuc,sex));
                        url = "/admin/manager_category.jsp";
                        break;
                }
            } else {
                url = "/admin/insert_category.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }
   

}
