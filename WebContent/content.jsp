<%@page import="com.teamwork.model.bean.Product"%>
<%@page import="com.teamwork.model.dao.SortDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.teamwork.model.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>content</title>
</head>
<body>
	<%
		SortDao sortDao = new SortDao();
		ProductDao productDao = new ProductDao();
		ArrayList<Product>listProduct = productDao.getALLProduct();
		sortDao.sortSaleMaxMin(listProduct);
	%>
	<div class="content">
			<div class="container">
				
				<!--products-->
			<div class="content-mid">
				<h3>Trending Items</h3>
				<label class="line"></label>
				<div class="mid-popular">
				
				<%for(int i = 0; i< 8; i ++){ 
					Product product= listProduct.get(i);%>
					<div class="col-md-3 item-grid simpleCart_shelfItem">
					<div class=" mid-pop">
					<div class="pro-img">
						<img src="<%=product.getProductImage() %>" class="img-responsive" alt="">
						<div class="zoom-icon ">
						<a class="picture" href="<%=product.getProductImage() %>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
						<a href="single.jsp?productID=<%=product.getProductID()%>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
						</div>
						</div>
						<div class="mid-1">
						<div class="women">
						<div class="women-top">
							<span><%="-" +product.getSaleOf()+"%" %></span>
							<h6><a href="single.jsp?productID=<%=product.getProductID()%>"><%=product.getProductName() %></a></h6>
							</div>
							<div class="img item_add">
								<a href="CartServlet?command=plusquantity&productID=<%=product.getProductID()%>&quantity=1"><img src="images/ca.png" alt=""></a>
							</div>
							<div class="clearfix"></div>
							</div>
							<div class="mid-2">
								<p ><label><%=product.getProductPriceOld() %></label><em class="item_price"><%=product.getProductPrice() %></em></p>
								  <div class="block">
									<div class="starbox small ghosting"> </div>
								</div>
								
								<div class="clearfix"></div>
							</div>
							
						</div>
					</div>
					</div>
					<%} %>
					<div class="clearfix"></div>
				</div>
			</div>
			<!--//products-->
			<!--brand-->
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
			<!--//brand-->
			</div>
			
		</div>
	
</body>
</html>