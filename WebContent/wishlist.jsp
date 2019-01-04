<%@page import="com.teamwork.model.bean.User"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="com.teamwork.model.bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Wishlist</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>


	<div class="banner-top">
		<div class="container">
			<h1>Wishlist</h1>
			<em></em>
			<h2>
				<a href="index.jsp">Home</a><label>/</label>Wishlist
			</h2>
		</div>
	</div>

	<%
		User user = null;
		if (session.getAttribute("user") != null) {
			user = (User) session.getAttribute("user");
		}
	%>

	<%
		ArrayList<Product> listProductWishList = null;
		if (request.getAttribute("listProductWishlist") != null) {
			listProductWishList = (ArrayList<Product>) request.getAttribute("listProductWishlist");
		
		}
	%>
	<%
		Locale localeVN = new Locale("vi", "VN");
		NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
	%>

	<div class="product">
		<%
			if (!listProductWishList.isEmpty()) {
		%>
		<div class="container">
			<div class="col-md-9">

				<%
					for (Product p : listProductWishList) {
				%>
				<div class="col-md-4 item-grid1 simpleCart_shelfItem">
					<div class=" mid-pop">
						<div class="pro-img">
							<img src="<%=p.getProductImage()%>" height="590" width="426"
								class="img-responsive" alt="">
							<div class="zoom-icon ">
								<a class="picture" href="<%=p.getProductImage()%>" rel="title"
									class="b-link-stripe b-animate-go  thickbox"><i
									class="glyphicon glyphicon-search icon "></i></a> <a
									href="single.jsp?productID=<%=p.getProductID()%>"><i
									class="glyphicon glyphicon-menu-right icon"></i></a>
							</div>
						</div>
						<div class="mid-1">
							<div class="women">
								<div class="women-top">
									<span><%="-"+p.getSaleOf()+"%" %></span>
									<h6>
										<a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a>
									</h6>
								</div>
								<div class="img item_add">
									<a
										href="CartServlet?command=plus&productID=<%=p.getProductID()%>"><img
										src="images/ca.png" alt=""></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="mid-2">
								<p>
									<label><%=currencyVN.format(p.getProductPriceOld())%></label><em
										class="item_price"><%=currencyVN.format(p.getProductPrice())%></em>
								</p>
								<div class="block">
									<div class="starbox small ghosting"></div>
								</div>

								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<div>

						<a
							href="WishListServlet?command=remove&product_id=<%=p.getProductID()%>&id_kh=<%=user.getUserID()%>"
							class="close1"></a>

					</div>
				</div>

				<%
					}
				%>
				<a
					href="WishListServlet?command=removeall&id_kh=<%=user.getUserID()%>"
					class="hvr-skew-backward">Remove All WishList </a>
			</div>
		</div>
		<%
			} else {
		%>
		<div class="container">
			<div class="wishlist">
				<p>Không có sản phẩm nào trong wishlist</p>
			</div>
		</div>
		<%
			}
		%>
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