package com.teamwork.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamwork.model.dao.BillDao;
import com.teamwork.model.dao.BillDetailDao;

/**
 * Servlet implementation class ManagerBillServlet
 */
@WebServlet("/ManagerBillServlet")
public class ManagerBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	BillDao billDao = new BillDao();
	BillDetailDao billdetailDao = new BillDetailDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		String billID= request.getParameter("billid");
		
		switch(command) {
		case "delete":
			try {
				if(billDao.deleteBill(Long.parseLong(billID))) {
					billdetailDao.deleteBillDetailwithbillid(Long.parseLong(billID));
					RequestDispatcher rd = request.getRequestDispatcher("admin/manager_bill.jsp");
					rd.forward(request, response);
				}
			} catch (NumberFormatException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
		
	}

}
