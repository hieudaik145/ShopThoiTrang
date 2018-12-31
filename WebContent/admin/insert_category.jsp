<%@page import="java.util.ArrayList"%>
<%@page import="com.teamwork.model.bean.Category"%>
<%@page import="com.teamwork.model.dao.CategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Category</title>
</head>
<body>
	
	<%
            if(request.getParameter("error")!=null){
            }
        %>

	<div id="panelwrap">

		<jsp:include page="header.jsp"></jsp:include>

		<div class="center_content">

			<div id="right_wrap">
			<div id="right_content">
			

					<ul id="tabsmenu" class="tabsmenu">
					<li class="active"><a href="#tab1">Insert Category</a></li>
				</ul>
					<div id="tab1" class="tabcontent">
						<h3>Information Category</h3>

						<%
							if (request.getAttribute("error") != null) {
						%>
						<b style="color: red; padding-left: 13px;"><%=request.getAttribute("error")%></b>
						<%
							}
						%>
						<form action="${pageContext.request.contextPath}/ManagerCategoryServlet?command=insert" method="post">


							<div class="form">
								<div class="form_row">
									<label>Category id:</label> <input type="text"
										class="form_input" name="category_id" />
								</div>
								<div class="form_row">
									<label>Category Name:</label> <input type="text"
										class="form_input" name="tenDanhMuc" />
								</div>
								<div class="form_row">
									<label>Sex:</label> <select class="form_select"
										name="sex">
										<option>Nam</option>
										<option>Nu</option>
									</select>
								</div>
								<div class="form_row">
									<input type="hidden" name="command" value="insert">
									<input type="submit" class="form_submit" value="Insert">
								</div>
								<div class="clear"></div>
							</div>
						</form>

					</div>
				
				</div>
				
				</div>
			
			<jsp:include page="menu.jsp"></jsp:include>

		</div>

		<jsp:include page="footer.jsp"></jsp:include>


	</div>
	
</body>
</html>