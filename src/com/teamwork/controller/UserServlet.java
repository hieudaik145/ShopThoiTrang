package com.teamwork.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teamwork.model.bean.User;
import com.teamwork.model.dao.LoginDao;
import com.teamwork.model.dao.RegisterDao;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	User user = new User();
	LoginDao logindao = new LoginDao();
	RegisterDao registerDao = new RegisterDao();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String command = request.getParameter("command");
	
		switch(command) {
		case "login":
			String email  = request.getParameter("email");
			String pass = request.getParameter("password");
			user.setEmail(email);
			user.setPassword(pass);
			if(logindao.CheckLogin(user)) {
				try {
					logindao.getDataKH(user);
					session.setAttribute("user", user);
					response.sendRedirect("index.jsp");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}else
			{
				request.setAttribute("err", "Tên đăng nhập or mật khẩu không đúng!");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			break;
		case "register":
			String username= request.getParameter("username");
			String phone = request.getParameter("phone");
			String password = request.getParameter("password");
			String email2 = request.getParameter("email");
			user.setUsername(username);
			user.setPhone(Integer.parseInt(phone));
			user.setEmail(email2);
			user.setPassword(password);
			int i = registerDao.register(user);
			if(i>0) {
				try {
					logindao.getDataKH(user);
					session.setAttribute("user", user);
					response.sendRedirect("index.jsp");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else
			{
				request.setAttribute("err-register", "Địa chỉ email đã tồn tại , không thể thêm");
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			}
			break;
		case "logout":
			session.invalidate();
			response.sendRedirect("login.jsp");
			
		}
		
	}

}
