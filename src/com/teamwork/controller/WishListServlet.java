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
import com.teamwork.model.dao.WishListDao;

/**
 * Servlet implementation class WishListServlet
 */
@WebServlet("/WishListServlet")
public class WishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDao productDao = new ProductDao();
		WishListDao wishlistDao = new WishListDao();
		String id_kh = request.getParameter("id_kh");
		String product_id = request.getParameter("product_id");
		String command = request.getParameter("command");
		switch (command) {
		case "plus":

			int kq = wishlistDao.addWishList(Integer.parseInt(product_id), Integer.parseInt(id_kh));
			if (kq > 0) {
				request.setAttribute("wlsuccess", "Bạn đã thêm thành công vào mục ưa thích<3");
				RequestDispatcher rd = request.getRequestDispatcher("single.jsp?productID=" + product_id);
				rd.forward(request, response);
			} else {
				request.setAttribute("wlerr", "Sản phẩm này đã có trong mục ưa thích không thể thêm nữa! ");
				RequestDispatcher rd = request.getRequestDispatcher("single.jsp?productID=" + product_id);
				rd.forward(request, response);
			}
			break;

		case "view":
			ArrayList<Integer> listidproduct = wishlistDao.getListProductIDbyID_KH(Integer.parseInt(id_kh));
			ArrayList<Product> list = new ArrayList<Product>();

			for (int i : listidproduct) {
				int j = i;
				try {
					list.add(productDao.getProduct(j));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			request.setAttribute("listProductWishlist", list);
			RequestDispatcher rd = request.getRequestDispatcher("wishlist.jsp");
			rd.forward(request, response);
			break;
		case "remove":
			int status = wishlistDao.removeWishList(Integer.parseInt(id_kh), Integer.parseInt(product_id));
			if (status > 0) {
				request.setAttribute("removewlsuccess", "Remove Thành Công ");
				RequestDispatcher rd1 = request.getRequestDispatcher("WishListServlet?command=view&id_kh="+id_kh);
				rd1.forward(request, response);
			} else {
				request.setAttribute("removewlerr", "CÓ Lối Xảy Ra");
				RequestDispatcher rd1 = request.getRequestDispatcher("WishListServlet?command=view&id_kh="+id_kh);
				rd1.forward(request, response);
			}

			break;
		case "removeall":
			int status2 = wishlistDao.removeAllWishList(Integer.parseInt(id_kh));
			if (status2 > 0) {
				request.setAttribute("removeallwlsuccess", "Remove All Thành Công ");
				RequestDispatcher rd1 = request.getRequestDispatcher("WishListServlet?command=view&id_kh="+id_kh);
				rd1.forward(request, response);
			} else {
				request.setAttribute("removeallwlerr", "Remove All That Bai ");
				RequestDispatcher rd1 = request.getRequestDispatcher("WishListServlet?command=view&id_kh="+id_kh);
				rd1.forward(request, response);
			}
			break;
		}

	}

}
