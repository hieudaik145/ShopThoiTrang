
<%@page import="com.teamwork.model.dao.SortDao"%>
<%@page import="com.teamwork.model.bean.Category"%>

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
	
	<%
		Locale localeVN = new Locale("vi","VN");
		NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
		
	%>
	<%
		ArrayList<Product> listProduct = null ;
		if(request.getAttribute("listsearch")!=null)
		{
			 listProduct = (ArrayList<Product>)request.getAttribute("listsearch");
		}
	%>
	


	<jsp:include page="header.jsp"></jsp:include>

	<div class="banner-top">
		<div class="container">
			<h1>Search</h1>
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
										<h6>
											<a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName() %></a>
										</h6>
									</div>
									<div class="img item_add">
										<a href="CartServlet?command=plusquantity&productID=<%=p.getProductID()%>&quantity=1"><img src="images/ca.png" alt=""></a>
									</div>
									<div class="clearfix"></div>
								</div>
								<span><%="-"+ p.getSaleOf()+"%" %></span>
								<div class="mid-2">
									
									<p>
										<label><%=currencyVN.format(p.getProductPriceOld()) %></label><em class="item_price"><%=currencyVN.format(p.getProductPrice())%></em>
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
				
				
				</div>
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