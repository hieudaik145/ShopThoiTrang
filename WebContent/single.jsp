<%@page import="sun.java2d.*"%>
<%@page import="com.teamwork.model.bean.Category"%>
<%@page import="com.teamwork.model.dao.CategoryDao"%>
<%@page import="com.teamwork.model.bean.User"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.teamwork.model.bean.Product"%>
<%@page import="com.teamwork.model.dao.ProductDao"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>single</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->

<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!--theme-style-->
<link href="css/style4.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<script src="js/jquery.min.js"></script>
<!--- start-rate---->
<script src="js/jstarbox.js"></script>
<link rel="stylesheet" href="css/jstarbox.css" type="text/css"
	media="screen" charset="utf-8" />
<script type="text/javascript">
	jQuery(function() {
		jQuery('.starbox')
				.each(
						function() {
							var starbox = jQuery(this);
							starbox
									.starbox(
											{
												average : starbox
														.attr('data-start-value'),
												changeable : starbox
														.hasClass('unchangeable') ? false
														: starbox
																.hasClass('clickonce') ? 'once'
																: true,
												ghosting : starbox
														.hasClass('ghosting'),
												autoUpdateAverage : starbox
														.hasClass('autoupdate'),
												buttons : starbox
														.hasClass('smooth') ? false
														: starbox
																.attr('data-button-count') || 5,
												stars : starbox
														.attr('data-star-count') || 5
											})
									.bind(
											'starbox-value-changed',
											function(event, value) {
												if (starbox.hasClass('random')) {
													var val = Math.random();
													starbox.next().text(
															' ' + val);
													return val;
												}
											})
						});
	});
</script>
<!---//End-rate---->
<link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>

	<%
		ProductDao productDao = new ProductDao();
		Product product = new Product();
		
		String productID= "";
		if(request.getParameter("productID")!= null)
		{
			productID = request.getParameter("productID");
			product = productDao.getProduct(Long.parseLong(productID));
			
		}
	%>
	<%
		Locale localeVN = new Locale("vi","VN");
		NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
	%>

	<%
		User user = null;
		if (session.getAttribute("user") != null) {
		user = (User) session.getAttribute("user");
		}
	%>

	<!--header-->
	<jsp:include page="header.jsp"></jsp:include>
	<!--banner-->
	<div class="banner-top">
		<div class="container">
			<h1>Single</h1>
			<em></em>
			<h2>
				<a href="index.jsp">Home</a><label>/</label>Single
			</h2>
		</div>
	</div>
	
	<div class="single">
		
		<div class="container">
			<div class="col-md-9">
				<div class="col-md-5 grid">
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="<%=product.getProductImage() %>">
								<div class="thumb-image">
									<img src="<%=product.getProductImage() %>" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
							<li data-thumb="<%=product.getProductImage1()%>">
								<div class="thumb-image">
									<img src="<%=product.getProductImage1()%>" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
							<li data-thumb="<%=product.getProductImage2()%> "  >
								<div class="thumb-image">
									<img src="<%=product.getProductImage2()%>" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-7 single-top-in">
					<div class="span_2_of_a1 simpleCart_shelfItem">
						<h3><%=product.getProductName() %></h3>
						
						<div class="price_single">
							<span class="reducedfrom item_price"><%=currencyVN.format(product.getProductPrice())%><a></a>
							<div class="clearfix"></div>
						</div>
						<h4 class="quick">Quick Overview:</h4>
						<p class="quick_desc"><%=product.getProductOverview() %></p>
						<div class="wish-list">
						
							<%if(request.getAttribute("wlsuccess")!=null){%>
								<span style="color: blue; text-align: center;"><%= request.getAttribute("wlsuccess") %> </span>
						<%}if(request.getAttribute("wlerr")!=null) { %>
								<span style="color: red; text-align: center;"><%= request.getAttribute("wlerr") %></span>
						<%} %>
						
							<ul>
								
								<%if(user!=null){
%>
								<li class="wish"><a href="WishListServlet?command=plus&id_kh=<%= user.getUserID()%>&product_id=<%=product.getProductID()%>"><span
										class="glyphicon glyphicon-check" aria-hidden="true"></span>Add
										to Wishlist</a></li>
										<%} else{ %>
								<li class="wish"><a href="login.jsp"><span
										class="glyphicon glyphicon-check" aria-hidden="true"></span>Add
										to Wishlist</a></li>	
										<%} %>	
								
							</ul>
						</div>
						<form action="CartServlet?command=plusquantity&productID=<%=product.getProductID()%>" method="post">
						<div class="quantity">
								<div class="entry value">
									<input type="number" name="quantity" value="1" min="1" max="10"  >
								</div>
						</div>
				
							<input type="submit" class="add-to item_add hvr-skew-backward" value="Add to cart">
						</form>
						<div class="clearfix"></div>
					</div>

				</div>
				<div class="clearfix"></div>
				<!---->
				<div class="tab-head">
					<nav class="nav-sidebar">
						<ul class="nav tabs">
							<li class="active"><a href="#tab1" data-toggle="tab">Product
									Description</a></li>
							<li class=""><a href="#tab2" data-toggle="tab">Additional
									Information</a></li>
							<li class=""><a href="#tab3" data-toggle="tab">Reviews</a></li>
						</ul>
					</nav>
					<div class="tab-content one">
						<div class="tab-pane active text-style" id="tab1">
							<div class="facts">
								<p><%= product.getProductDescription() %></p>
								
							</div>

						</div>
						<div class="tab-pane text-style" id="tab2">

							<div class="facts">
								<p><%= product.getProductAdditonal() %></p>
							
							</div>

						</div>
						<div class="tab-pane text-style" id="tab3">

							<div class="facts">
								<p><%= product.getProductReview() %></p>
							
							</div>

						</div>

					</div>
					<div class="clearfix"></div>
				</div>
				<!---->
			</div>
			<!----->

			<%
		CategoryDao categoryDao = new CategoryDao();
		%>
			<div class="col-md-3 product-bottom">
				<!--categories-->
				<div class=" rsidebar span_1_of_left">
					<h4 class="cate">Categories</h4>
					<ul class="menu-drop">
						<li class="item1"><a href="#">Women </a>
							<ul class="cute">
								<%
									for (Category c : categoryDao.getListCategory("nu")) {
								%>
								<li class="subitem1"><a href="product.jsp?category_id=<%=c.getCategory_ID()%>&pages=1"><%=c.getCategory_Name() %>
										 </a></li>
								<%} %>
								
							</ul></li>
						<li class="item2"><a href="#">Men </a>
							<ul class="cute">
							<%
								for (Category c : categoryDao.getListCategory("nam")) {
							%>
								<li class="subitem1"><a href="product.jsp?category_id=<%=c.getCategory_ID()%>&pages=1"><%=c.getCategory_Name() %>
										 </a></li>
							<%} %>
							</ul></li>
					</ul>
				</div>
				</div>
			<div class="clearfix"></div>
		</div>

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

	<!--//content-->
	<!--//footer-->
	<div class="footer">
		<div class="footer-middle">
			<div class="container">
				<div class="col-md-3 footer-middle-in">
					<a href="index.html"><img src="images/log.png" alt=""></a>
					<p>Suspendisse sed accumsan risus. Curabitur rhoncus, elit vel
						tincidunt elementum, nunc urna tristique nisi, in interdum libero
						magna tristique ante. adipiscing varius. Vestibulum dolor lorem.</p>
				</div>

				<div class="col-md-3 footer-middle-in">
					<h6>Information</h6>
					<ul class=" in">
						<li><a href="404.html">About</a></li>
						<li><a href="contact.html">Contact Us</a></li>
						<li><a href="#">Returns</a></li>
						<li><a href="contact.html">Site Map</a></li>
					</ul>
					<ul class="in in1">
						<li><a href="#">Order History</a></li>
						<li><a href="wishlist.html">Wish List</a></li>
						<li><a href="login.html">Login</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-3 footer-middle-in">
					<h6>Tags</h6>
					<ul class="tag-in">
						<li><a href="#">Lorem</a></li>
						<li><a href="#">Sed</a></li>
						<li><a href="#">Ipsum</a></li>
						<li><a href="#">Contrary</a></li>
						<li><a href="#">Chunk</a></li>
						<li><a href="#">Amet</a></li>
						<li><a href="#">Omnis</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-middle-in">
					<h6>Newsletter</h6>
					<span>Sign up for News Letter</span>
					<form>
						<input type="text" value="Enter your E-mail"
							onfocus="this.value='';"
							onblur="if (this.value == '') {this.value ='Enter your E-mail';}">
						<input type="submit" value="Subscribe">
					</form>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container">
				<ul class="footer-bottom-top">
					<li><a href="#"><img src="images/f1.png"
							class="img-responsive" alt=""></a></li>
					<li><a href="#"><img src="images/f2.png"
							class="img-responsive" alt=""></a></li>
					<li><a href="#"><img src="images/f3.png"
							class="img-responsive" alt=""></a></li>
				</ul>
				<p class="footer-class">
					&copy; 2016 Shopin. All Rights Reserved | Design by <a
						href="http://w3layouts.com/" target="_blank">W3layouts</a>
				</p>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--//footer-->
	<script src="js/imagezoom.js"></script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script defer src="js/jquery.flexslider.js"></script>
	<link rel="stylesheet" href="css/flexslider.css" type="text/css"
		media="screen" />

	<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>

	<script src="js/simpleCart.min.js"> </script>
	<!-- slide -->
	<script src="js/bootstrap.min.js"></script>


</body>
</html>