<%@page import="com.teamwork.model.dao.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.teamwork.model.bean.Category"%>
<%@page import="com.teamwork.model.bean.Product"%>
<%@page import="com.teamwork.model.dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager Product</title>

</head>
<body>

	<%
		if (request.getParameter("error") != null) {
		}
	%>
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> listCategory = categoryDao.getAllListCategory();
	%>

	<div id="panelwrap">

		<jsp:include page="header.jsp"></jsp:include>

		<div class="center_content">

			<div id="right_wrap">
				<div id="right_content">


					<ul id="tabsmenu" class="tabsmenu">
						<li class="active"><a href="#tab1">Insert Product</a></li>

					</ul>
					<div id="tab1" class="tabcontent">
						<h3>Add Product:</h3>

						<%
							if (request.getAttribute("error") != null) {
						%>
						<b style="color: red; padding-left: 13px;"><%=request.getAttribute("error")%></b>
						<%
							}
						%>
						<form
							action="${pageContext.request.contextPath}/ManagerProductServlet?command=insert"
							method="post">


							<div class="form">
								<div class="form_row">
									<label>Product Name:</label> <input type="text"
										class="form_input" name="tenSP" />
								</div>

								<div class="form_row">
									<label>Category Name:</label> <select class="form_select"
										name="category_name">
										<%
											for (Category c : listCategory) {
										%>
										<option><%=c.getCategory_Name()%></option>
										<%
											}
										%>
									</select>
								</div>
								<div class="form_row">
									<label>Image:</label><input type="file" name="image"
										style="height: 50px; width: 300px">
								</div>
								<div class="form_row">
									<label>Image 1:</label><input type="file" name="image1"
										style="height: 50px; width: 300px">
								</div>
								<div class="form_row">
									<label>Image 2:</label><input type="file" name="image2"
										style="height: 50px; width: 300px">
								</div>
								<div class="form_row">
									<label>Product Price:</label> <input type="text"
										class="form_input" name="price" />
								</div>
								<div class="form_row">
									<label>Product Old Price:</label> <input type="text"
										class="form_input" name="oldPrice" />
								</div>
								<div class="form_row">
									<label>Description:</label>
									<textarea class="form_textarea" name="description"></textarea>
								</div>
								<div class="form_row">
									<label>Overview:</label>
									<textarea class="form_textarea" name="overview"></textarea>
								</div>
								<div class="form_row">
									<label>Additional:</label>
									<textarea class="form_textarea" name="additional"></textarea>
								</div>
								<div class="form_row">
									<label>Review:</label>
									<textarea class="form_textarea" name="review"></textarea>
								</div>
								<div class="form_row">
									<input type="hidden" name="command" value="insert"> <input
										type="submit" class="form_submit" value="Insert">
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