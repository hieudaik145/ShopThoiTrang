<%@page import="com.teamwork.model.dao.CategoryDao"%>
<%@page import="com.teamwork.model.bean.Category"%>
<%@page import="com.teamwork.model.bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.teamwork.model.dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý Sản Phẩm</title>
</head>
<body>

	<%
		ProductDao productDao = new ProductDao();
		ArrayList<Product> listProduct = productDao.getALLProduct();
	%>
	
	<div id="panelwrap">

		<jsp:include page="header.jsp"></jsp:include>

		<div class="center_content">

			<div id="right_wrap">
			<div id="right_content">
				<h3>Manager Product</h3>
				<h2><a href="${pageContext.request.contextPath}/admin/insert_product.jsp">Insert Product</a></h2>

				<table id="rounded-corner">
					<thead>
						<tr>
							<th>STT</th>
							<th>Category Name</th>
							<th>Product Name</th>
							<th>Image</th>
							<th>Old Price</th>
							<th>Price</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="12">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit, sed do eiusmod tempor incididunt ut.</td>
						</tr>
					</tfoot>

						<%
                            int count = 0;
                            for(Product product : listProduct){
                                count++;
                        %>


						<tbody>
						<tr class="odd">
							<td><%=count%></td>
							<%
								CategoryDao categoryDao = new CategoryDao();
								Category c = categoryDao.selectCategory(product.getCategoryID());
								
							%>
							<td><%=c.getCategory_Name()%></td> 
							
							<td><%=product.getProductName()%></td>
							<td><%=product.getProductImage() %></td>
							<td><%=product.getProductPriceOld() %></td>
							<td><%=product.getProductPrice() %></td>
							
							
								<td><a
									href="${pageContext.request.contextPath}/admin/update_product.jsp?command=update&product_id=<%=product.getProductID()%>"><img
										src="${pageContext.request.contextPath}/images/edit.png" alt="" title="" border="0" /></a></td>
								<td><a
									href="/ShopThoiTrang/ManagerProductServlet?command=delete&product_id=<%=product.getProductID()%>"><img
										src="${pageContext.request.contextPath}/images/trash.gif" alt="" title="" border="0" /></a></td>
							</tr>

					</tbody>
					
					<%}%>
			
				</table>
				</div>
				</div>
			
			<jsp:include page="menu.jsp"></jsp:include>

		</div>

		<jsp:include page="footer.jsp"></jsp:include>


	</div>
	
</body>
</html>