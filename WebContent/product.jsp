<%@page import="com.teamwork.model.bean.CategoryMen"%>
<%@page import="com.teamwork.model.bean.Category"%>
<%@page import="com.teamwork.model.dao.CategoryMenDao"%>
<%@page import="com.teamwork.model.dao.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="com.teamwork.model.dao.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>product</title>
</head>
<body>

	<%@ page import="com.teamwork.model.dao.ProductDao,com.teamwork.model.bean.Product" %>
	<%
		ProductDao productDao = new ProductDao();
			long category_id = 0;
			if(request.getParameter("category_id")!=null)
			{
				category_id = (long) Long.parseLong(request.getParameter("category_id"));
			}	
	%>
	<%
		Cart cart =(Cart) session.getAttribute("cart");
		if(cart == null)
		{
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	%>
	<%-- Tao format ep thanh kieu tien te vnd --%>
	<%
		Locale localeVN = new Locale("vi","VN");
		NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
	%>
	
	<%-- code moi --%>
	<%
		int pages = 0, firstResult = 0, maxResult = 0, total = 0;
		if(request.getParameter("pages") != null) {
			pages = (int) Integer.parseInt(request.getParameter("pages"));
		}
		total = productDao.countProductByCategory(category_id);
		if(total<=5) {
			firstResult = 1;
			maxResult = total;
		} else {
			firstResult = (pages - 1) * 5;
			maxResult = 5;
		}
		
		ArrayList<Product> listProduct = productDao.getListProductByNav(category_id, firstResult, maxResult);
	%>
	

	<jsp:include page="header.jsp"></jsp:include>

	<div class="banner-top">
		<div class="container">
			<h1>Products</h1>
			<em></em>
			<h2>
				<a href="index.jsp">Home</a><label>/</label>Products
			</h2>
		</div>
	</div>

	<div class="product">
		<div class="container">
			<div class="col-md-9">
				<div class="mid-popular">
				
				
				<%
					for(Product p: listProduct){  
				%>
					<div class="col-md-4 item-grid1 simpleCart_shelfItem">
						<div class=" mid-pop">
							<div class="pro-img">
								<img src="<%=p.getProductImage() %>" height="590" width="426" class="img-responsive" alt="">
								<div class="zoom-icon ">
									<a class="picture" href="<%=p.getProductImage() %>" rel="title"
										class="b-link-stripe b-animate-go  thickbox"><i
										class="glyphicon glyphicon-search icon "></i></a> <a
										href="single.jsp?productID=<%=p.getProductID()%>"><i
										class="glyphicon glyphicon-menu-right icon"></i></a>
								</div>
							</div>
							<div class="mid-1">
								<div class="women">
									<div class="women-top">
									
								
										<span>Women</span>
								
										<h6>
											<a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName() %></a>
										</h6>
									</div>
									<div class="img item_add">
										<a href="CartServlet?command=plus&productID=<%=p.getProductID()%>"><img src="images/ca.png" alt=""></a>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="mid-2">
									<p>
										<label><%=currencyVN.format(p.getProductPriceOld()) %></label><em class="item_price"><%=currencyVN.format(p.getProductPrice()) %></em>
									</p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>

									<div class="clearfix"></div>
								</div>
								
							</div>
						</div>
					</div>
				<%} %>
				
					<div class="clearfix"></div>
					
					<!-- code moi -->
					<%
						int pageht = Integer.parseInt(request.getParameter("pages"));
						int pagepre ;
						int pagenext = pageht + 1;
						if(pageht == 1){
							pagepre = 1;
						}else
						{
							pagepre = pageht -1 ;
						}
						int maxpage = (total/5) + 1;
						if( pageht == maxpage){
							pagenext = pageht;
						}else
						{
							pagenext = pageht + 1;
						}
						
					%>
					<ul style="list-style-type:none;">
						<li style="display: inline-table;"><a style="text-decoration: none; display: block;" href="product.jsp?categpry_id=<%=category_id%>&pages=<%=pagepre%>"><i></i>pre</a></li>
						<%
							for (int i = 1; i <= (total/5)+1; i++) { %>
						
						<li style="display: inline-table;"><a style="text-decoration: none; display: block;" href="product.jsp?category_id=<%=category_id%>&pages=<%=i%>"><%=i%></a></li>
						<%
							}
						%>
						<li style="display: inline-table;" ><a style="text-decoration: none; display: block;" href="product.jsp?categpry_id=<%=category_id%>&pages=<%=pagenext%>"><i class="next"></i>next</a></li>
					</ul>
				</div>
			</div>
		<%
		CategoryDao categoryDao = new CategoryDao();
		CategoryMenDao categoryMenDao = new CategoryMenDao();
		%>
			<div class="col-md-3 product-bottom">
				<!--categories-->
				<div class=" rsidebar span_1_of_left">
					<h4 class="cate">Categories</h4>
					<ul class="menu-drop">
						<li class="item1"><a href="#">Women </a>
							<ul class="cute">
								<%
									for (Category c : categoryDao.getListCategory()) {
								%>
								<li class="subitem1"><a href="product.jsp?category_id=<%=c.getCategory_ID()%>&pages=1"><%=c.getCategory_Name() %>
										 </a></li>
								<%} %>
								
							</ul></li>
						<li class="item2"><a href="#">Men </a>
							<ul class="cute">
							<%
								for (CategoryMen c : categoryMenDao.getListCategoryMan()) {
							%>
								<li class="subitem1"><a href="product.jsp?category_id=<%=c.getCategoryMen_ID()%>&pages=1"><%=c.getCategoryMen_Name() %>
										 </a></li>
							<%} %>
							</ul></li>
					</ul>
				</div>
				<!--initiate accordion-->
				<script type="text/javascript">
					$(function() {
						var menu_ul = $('.menu-drop > li > ul'), menu_a = $('.menu-drop > li > a');
						menu_ul.hide();
						menu_a.click(function(e) {
							e.preventDefault();
							if (!$(this).hasClass('active')) {
								menu_a.removeClass('active');
								menu_ul.filter(':visible').slideUp('normal');
								$(this).addClass('active').next().stop(true,
										true).slideDown('normal');
							} else {
								$(this).removeClass('active');
								$(this).next().stop(true, true).slideUp(
										'normal');
							}
						});

					});
				</script>
				<!--//menu-->
				

			</div>
			<div class="clearfix"></div>
		</div>
		<!--products-->

		<!--//products-->
		<!--brand-->
		<div class="container">
			<div class="brand">
				<div class="col-md-3 brand-grid">
					<img src="images/ic.png" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="images/ic1.png" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="images/ic2.png" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="images/ic3.png" class="img-responsive" alt="">
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!--//brand-->


	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>