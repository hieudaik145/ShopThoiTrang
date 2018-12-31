<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="sidebar" id="sidebar">
			<h2><a href="${pageContext.request.contextPath}/index.jsp">Main Page</a></h2>
			<h2><a href="${pageContext.request.contextPath}/admin/manager_category.jsp">List Category</a></h2>

			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/insert_category.jsp" class="selected">Add a category</a></li>
			</ul>

			<h2><a href="${pageContext.request.contextPath}/admin/manager_product.jsp">List Product</a></h2>

			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/insert_product.jsp">Add a category</a></li>
			</ul>

			<h2><a href="${pageContext.request.contextPath}/admin/manager_bill.jsp">List Product</a></h2>

			<ul>
				<li><a href="#">Bills</a></li>
				<li><a href="#">Add a bill</a></li>
				<li><a href="#">Edit Bills</a></li>
			</ul>
</div>
		<div class="clear"></div>
</body>
</html>