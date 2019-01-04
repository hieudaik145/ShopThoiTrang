<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<title>Insert title here</title>

</head>
<body>
	
		<div class="header">
			<div class="title">
				<a href="#">Manager</a>
			</div>

			<div class="header_right">
			<%if(session.getAttribute("nameadmin")!=null){ %>
				Welcome: <%=session.getAttribute("nameadmin") %>
				<%} %>
				<a href="#" class="settings">Settings</a> <a href="${pageContext.request.contextPath}/UserServlet?command=logoutadmin" class="logout">Logout</a>
			</div>

			<div class="menu">
				<ul>
					<li><a href="#" class="selected">Main page</a></li>
					<li><a href="#">Categories</a></li>
					<li><a href="#">Products</a></li>
					<li><a href="#">Bills</a></li>
					<li><a href="#">Help</a></li>
					<li><a href="#">Contact</a></li>
					<li><a href="#">About</a></li>
				</ul>
			</div>

		</div>
	
</body>
</html>