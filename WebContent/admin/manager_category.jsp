<%@page import="com.teamwork.model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.teamwork.model.dao.CategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý danh mục</title>
</head>
<body>

	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> listCategory = categoryDao.getAllListCategory();
	%>

	<div id="panelwrap">

		<jsp:include page="header.jsp"></jsp:include>

		<div class="center_content">

			<div id="right_wrap">
			<div id="right_content">
				<h3>Manager Category</h3>
				<h2><a href="${pageContext.request.contextPath}/admin/insert_category.jsp">Insert Category</a></h2>

				<table id="rounded-corner">
					<thead>
						<tr>
							<th>STT</th>
							<th>Category ID</th>
							<th>Category Name</th>
							<th>Sex</th>
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
                            for(Category category : listCategory){
                                count++;
                        %>

						<tbody>
						<tr class="odd">
							<td><%=count%></td>
							<td><%=category.getCategory_ID()%></td>
							<td><%=category.getCategory_Name()%></td>
							<td><%=category.getSex() %></td>
								<td><a
									href="${pageContext.request.contextPath}/admin/update_category.jsp?command=update&category_id=<%=category.getCategory_ID()%>"><img
										src="${pageContext.request.contextPath}/images/edit.png" alt="" title="" border="0" /></a></td>
								<td><a
									href="/ShopThoiTrang/ManagerCategoryServlet?command=delete&category_id=<%=category.getCategory_ID()%>"><img
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