<%@page import="com.teamwork.model.bean.Product"%>
<%@page import="com.teamwork.model.dao.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.teamwork.model.dao.CategoryDao"%>
<%@page import="com.teamwork.model.bean.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Product</title>

</head>
<body>

	<%
		String product_id = request.getParameter("product_id");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	%>
	<%
		String error = "";
		if (request.getParameter("error") != null) {
			error = (String) request.getParameter("error");
		}
	%>
	
	<%
		CategoryDao categoryDao = new CategoryDao();
		ProductDao productDao = new ProductDao();
		Product product = productDao.getProduct(Long.parseLong(product_id));
		ArrayList<Category> listCategory = categoryDao.getAllListCategory();
	%>

	<div id="panelwrap">

		<jsp:include page="header.jsp"></jsp:include>

		<div class="center_content">

			<div id="right_wrap">
				<div id="right_content">


					<ul id="tabsmenu" class="tabsmenu">
						<li class="active"><a href="#tab1">Update Category</a></li>
						<li><a href="#tab2">Tab two</a></li>
						<li><a href="#tab3">Tab three</a></li>
						<li><a href="#tab4">Tab four</a></li>
					</ul>
					<div id="tab1" class="tabcontent">
						<h3>Information Product</h3>

						<form action="${pageContext.request.contextPath}/ManagerProductServlet?command=update" method="post">
							<div class="form">
								<div class="form_row">
									<label>Product Name:</label> <input type="text"
										class="form_input" name="tenSP"  value="<%=product.getProductName()%>"/>
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
									<label>Image :</label><input type="file" name="image"
										style="height: 50px; width: 300px" value="<%=product.getProductImage() %>" >
								</div>
								<div class="form_row">
									<label>Image 1:</label><input type="file" name="image1"
										style="height: 50px; width: 300px" value="<%=product.getProductImage1() %>">
								</div>
								<div class="form_row">
									<label>Image 2:</label><input type="file" name="image2"
										style="height: 50px; width: 300px" value="<%=product.getProductImage2() %>">
								</div>
								<div class="form_row">
									<label>Product Price:</label> <input type="text"
										class="form_input" name="price" value="<%=product.getProductPrice()%>" />
								</div>
								<div class="form_row">
									<label>Product Old Price:</label> <input type="text"
										class="form_input" name="oldPrice" value="<%=product.getProductPriceOld() %>" />
								</div>
								<div class="form_row">
									<label>Description:</label>
									<textarea class="form_textarea" name="description"  ><%=product.getProductDescription()%></textarea>
								</div>
								<div class="form_row">
									<label>Overview:</label>
									<textarea class="form_textarea" name="overview" ><%=product.getProductOverview() %></textarea>
								</div>
								<div class="form_row">
									<label>Additional:</label>
									<textarea class="form_textarea" name="additional" ><%=product.getProductAdditonal() %></textarea>
								</div>
								<div class="form_row">
									<label>Review:</label>
									<textarea class="form_textarea" name="review" ><%=product.getProductReview() %></textarea>
								</div>
								<div class="form_row">
									<input type="hidden" name="command" value="update">
									<input type="hidden" name="product_id" value="<%=request.getParameter("product_id")%>">
									<input type="submit" class="form_submit" value="Save">
								</div>
								<div class="clear"></div>

							</div>
						</form>
					</div>
					<div id="tab2" class="tabcontent">
						<h3>Tab two title</h3>
						<ul class="lists">
							<li>Consectetur adipisicing elit error sit voluptatem
								accusantium doloremqu sed</li>
							<li>Sed do eiusmod tempor incididunt</li>
							<li>Ut enim ad minim veniam is iste natus error sit</li>
							<li>Consectetur adipisicing elit sed</li>
							<li>Sed do eiusmod tempor error sit voluptatem accus antium
								dolor emqu incididunt</li>
							<li>Ut enim ad minim veniam</li>
							<li>Consectetur adipisi error sit voluptatem accusantium
								doloremqu cing elit sed</li>
							<li>Sed do eiusmod tempor in is iste natus error sit
								cididunt</li>
							<li>Ut enim ad minim ve is iste natus error sitniam</li>
						</ul>
					</div>

					<div id="tab3" class="tabcontent">
						<h3>Tab three title</h3>
						<p>
							Lorem ipsum <a href="#">dolor sit amet</a>, consectetur
							adipisicing elit, sed do eiusmod tempor incididunt ut labore et
							dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
							exercitation ullamco laboris nisi ut aliquip ex ea commodo
							consequat.Sed ut perspiciatis unde omnis iste natus error sit
							voluptatem accusantium doloremque laudantium, totam rem aperiam,
							eaque ipsa quae ab illo inventore veritatis et quasi architecto
							beatae vitae dicta sunt explicabo. <br /> <br />Nemo enim ipsam
							voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed
							quia consequuntur magni dolores eos qui ratione voluptatem sequi
							nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor
							sit amet, consectetur, adipisci velit, sed quia non numquam eius
							modi tempora incidunt ut labore et dolore magnam aliquam quaerat
							voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem
							ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi
							consequatur? Quis autem vel eum iure reprehenderit qui in ea
							voluptate velit esse quam nihil molestiae consequatur, vel illum
							qui dolorem eum fugiat quo voluptas nulla pariatur?
						</p>
					</div>

					<div id="tab4" class="tabcontent">
						<h3>Tab four title</h3>
						<p>
							Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit
							aut fugit, sed quia consequuntur magni dolores eos qui ratione
							voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem
							ipsum quia dolor sit amet, consectetur, ad <br /> <br />Nemo
							enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut
							fugit, sed quia consequuntur magni dolores eos qui ratione
							voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem
							ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia
							non numquam eius modi tempora incidunt ut labore et dolore magnam
							aliquam quaerat voluptatem. Ut enim ad minima veniam, quis
							nostrum exercitationem ullam corporis suscipit laboriosam, nisi
							ut aliquid ex ea commodi consequatur? Quis autem vel eum iure
							reprehenderit qui in ea voluptate velit esse quam nihil molestiae
							consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla
							pariatur?
						</p>
					</div>

					<div class="form_sub_buttons">
						<a href="#" class="button green">Edit selected</a> <a href="#"
							class="button red">Delete selected</a>
					</div>

				</div>

			</div>

			<jsp:include page="menu.jsp"></jsp:include>

		</div>

		<jsp:include page="footer.jsp"></jsp:include>


	</div>

</body>
</html>