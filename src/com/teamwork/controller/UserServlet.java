package com.teamwork.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
		  request.setCharacterEncoding("UTF-8");
		    response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html; charset=UTF-8");
		doPost(request, response);
	}

   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
		    response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		String command = request.getParameter("command");
		System.out.println(command);
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
					ServletContext sc = getServletContext();
				
					if(sc.getAttribute("urlsaulogin")!= null)
					{
						
						response.sendRedirect("WishListServlet?command=view&id_kh="+user.getUserID());
						sc.removeAttribute("urlsaulogin");
					}
					else if(sc.getAttribute("urlcheckoutfn")!= null)
					{
						response.sendRedirect("checkout-finish.jsp");
						sc.removeAttribute("urlcheckoutfn");
					}else
					{
						response.sendRedirect("index.jsp");
					}
						
					
					
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
			request.setCharacterEncoding("UTF-8");
		    response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html; charset=UTF-8");
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
			
			session.removeAttribute("user");
			response.sendRedirect("login.jsp");
			break;
		case "loginadmin":
			
			String name = request.getParameter("name");
			String passwordadmin = request.getParameter("password");
			if(logindao.CheckLoginAdmin(name, passwordadmin)) {
				session.setAttribute("nameadmin", name);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/index.jsp");
				rd.forward(request, response);
			}
			else
			{	request.setAttribute("loginadminerr", "Sai Tên Đăng Nhập Và Mật Khẩu");
				RequestDispatcher rd = request.getRequestDispatcher("/admin/login.jsp");
				rd.forward(request, response);
			}
			break;
		case "logoutadmin":
			session.removeAttribute("nameadmin");
			response.sendRedirect("index.jsp");
			break;
		}
		
		
	}

}
