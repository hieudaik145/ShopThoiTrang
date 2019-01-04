<%@page import="com.teamwork.model.bean.BillDetail"%>
<%@page import="com.teamwork.model.dao.BillDetailDao"%>
<%@page import="com.teamwork.model.dao.UserDao"%>
<%@page import="com.teamwork.model.bean.Bill"%>
<%@page import="com.teamwork.model.bean.User"%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.teamwork.model.dao.BillDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Invoice Management</title>
</head>
<body>
	<%
		BillDao billdao = new BillDao();
		
		BillDetailDao billDetailDao = new BillDetailDao();
		ArrayList<BillDetail> listbilldetail = billDetailDao.getALLBillDetail();
		UserDao userDao = new UserDao();
		
	%>

	<div id="panelwrap">

		<jsp:include page="header.jsp"></jsp:include>

		<div class="center_content">

			<div id="right_wrap">
			<div id="right_content">
				<h2>Tables section</h2>


				<table id="rounded-corner">
					<thead>
						<tr>
							<th></th>
							<th>Bill Detail Id</th>
							<th>Bill ID</th>
							<th>Product ID</th>
							<th>Price</th>
							<th>Quantity</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="12">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit, sed do eiusmod tempor incididunt ut.</td>
						</tr>
					</tfoot>
				<%for(BillDetail bdetail : listbilldetail){ %>
					<tbody>
						<tr class="odd">
							<td><input type="checkbox" name="" /></td>
							<td><%=bdetail.getBillDetailID()%></td>	
							<td><%=bdetail.getBillID() %></td>
							<td><%=bdetail.getProductID()%></td>
							<td><%=bdetail.getPrice()%></td>
							<td><%=bdetail.getQuantity()%></td>
						</tr>
				
				<%} %>


					</tbody>
				</table>
				</div>
				</div>
			
			<jsp:include page="menu.jsp"></jsp:include>

		</div>

		<jsp:include page="footer.jsp"></jsp:include>


	</div>
	
</body>
</html>