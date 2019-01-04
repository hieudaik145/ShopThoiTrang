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
			<h2><a href="${pageContext.request.contextPath}/admin/manager_category.jsp">List Categorys</a></h2>

			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/insert_category.jsp" class="selected">Add a category</a></li>
			</ul>

			<h2><a href="${pageContext.request.contextPath}/admin/manager_product.jsp">List Products</a></h2>

			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/insert_product.jsp">Add a Product</a></li>
			</ul>

			<h2><a href="${pageContext.request.contextPath}/admin/manager_bill.jsp">List Bills</a></h2>

			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/manager_bill_detail.jsp">Bill Detail</a></li>
				
			</ul>
</div>
		<div class="clear"></div>
</body>
</html>