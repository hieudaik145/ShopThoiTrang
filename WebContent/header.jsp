
<%@page import="com.teamwork.model.dao.Cart"%>
<%@page
	import="com.teamwork.model.dao.CategoryDao"%>
<%@page import="com.teamwork.model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>header</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<style >
.box{
margin-top: 20px;
}
.container-4{
  overflow: hidden;
  width: 400px;
  vertical-align: middle;
  white-space: nowrap;
  
}
.container-4 input#search{
  width: 400px;
  height: 40px;
  background: #2b303b;
  border: none;
  font-size: 10pt;
  float: left;
  color: #fff;
  padding-left: 15px;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
}
.container-4 input#search::-webkit-input-placeholder {
   color: #65737e;
}
 
.container-4 input#search:-moz-placeholder { /* Firefox 18- */
   color: #65737e;  
}
 
.container-4 input#search::-moz-placeholder {  /* Firefox 19+ */
   color: #65737e;  
}
 
.container-4 input#search:-ms-input-placeholder {  
   color: #65737e;  
}
.container-4 button.icon{
 
  border: none;
  background: #232833;
  height: 40px;
  width: 70px;
  color: #4f5b66;
  opacity: 0;
  font-size: 10pt;
  -webkit-transition: all .55s ease;
  -moz-transition: all .55s ease;
  -ms-transition: all .55s ease;
  -o-transition: all .55s ease;
  transition: all .55s ease;
}
.container-4:hover button.icon, .container-4:active button.icon, .container-4:focus button.icon{
    outline: none;
    opacity: 1;
    margin-left: -65px;
  }
 
  .container-4:hover button.icon:hover{
    background: white;
  }
  </style>
</head>
<body>
	
	<%@page
		import="com.teamwork.model.bean.Category"%>
	<%
		CategoryDao categoryDao = new CategoryDao();
	%>
	
	<%-- --%>
	<%
		User user = null;
		if (session.getAttribute("user") != null) {
			user = (User) session.getAttribute("user");
		}
	%>

	<%--chuc nang gio hang --%>
	<%
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	%>

	<div class="header">
		<div class="container">
			<div class="head">
				<div class=" logo">
					<a href="index.jsp"><img src="images/logo.png" alt=""></a>
				</div>
			</div>
		</div>
		<div class="header-top">
			<div class="container">
				<div class="col-sm-5 col-md-offset-2  header-login">
					<ul>
						<%
							if (user != null) {
						%>
						<li><a href="QuanLyTaiKhoan.jsp"><%=user.getUsername()%></a></li>
						<li><a href="UserServlet?command=logout">Logout</a></li>
						<li><a href="checkout.jsp">Checkout</a></li>
						<%
							} else {
						%>
						<li><a href="login.jsp">Login</a></li>
						<li><a href="register.jsp">Register</a></li>
						<li><a href="checkout.jsp">Checkout</a></li>
						<%
							}
						%>
						

					</ul>
				</div>

				<div class="col-sm-5 header-social">
					<ul>
						<%if(session.getAttribute("nameadmin")!=null){ %>
						<li><a style="color: red;" href="${pageContext.request.contextPath}/admin/index.jsp">Trang Quản Trị</a></li>
						<%}else{ %>
						<li><a style="color: red;" href="${pageContext.request.contextPath}/admin/login.jsp">Trang Quảng Trị</a></li>
						<%} %>
					</ul>

				</div>
				<div class="clearfix"></div>
			</div>
		</div>

		<div class="container">

			<div class="head-top">

				<div class="col-sm-8 col-md-offset-2 h_menu4">
					<nav class="navbar nav_bottom" role="navigation">

						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header nav_2">
							<button type="button"
								class="navbar-toggle collapsed navbar-toggle1"
								data-toggle="collapse" data-target="#bs-megadropdown-tabs">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>

						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
							<ul class="nav navbar-nav nav_1">
								<li><a class="color" href="index.jsp">Home</a></li>

								<li class="dropdown mega-dropdown active"><a class="color1"
									href="#" class="dropdown-toggle" data-toggle="dropdown">Women<span
										class="caret"></span></a>
									<div class="dropdown-menu ">
										<div class="menu-top">
											<div>
												<div class="h_nav">
													<h4 style="padding-bottom: 30px; text-align: center;">Thời
														Trang Nữ</h4>
													<%--lay danh sach product theo ten danh muc --%>
													<%
														for (Category c : categoryDao.getListCategory("nu")) {
													%>
													
													<%-- code moi --%>
													<ul
														style="display: inline-table; text-decoration: none; list-style: none; border: none; list-style-type: none;">
														<li><a
															href="product.jsp?category_id=<%=c.getCategory_ID()%>&pages=1"><%=c.getCategory_Name()%></a></li>
													</ul>
													<%
														}
													%>


												</div>
											</div>


										</div>
									</div></li>
								<li class="dropdown mega-dropdown active"><a class="color2"
									href="#" class="dropdown-toggle" data-toggle="dropdown">Men<span
										class="caret"></span></a>
									<div class="dropdown-menu mega-dropdown-menu">
										<div class="menu-top">
											<div>
												<div class="h_nav">
													<h4 style="padding-bottom: 30px; text-align: center;">Thời
														Trang Nam</h4>
													<%
														for (Category c : categoryDao.getListCategory("nam")) {
													%>
													<ul
														style="display: inline-table; text-decoration: none; list-style: none; border: none; list-style-type: none; padding-bottom: 20px;">
														<li><a
															href="product.jsp?category_id=<%=c.getCategory_ID()%>&pages=1"><%=c.getCategory_Name()%></a></li>
													</ul>
													<%
														}
													%>
												</div>
											</div>

										</div>
									</div></li>
								<li><a class="color3" href="product.html">Sale</a></li>
								<li><a class="color4" href="404.html">About</a></li>
						
								<li><a class="color6" href="contact.html">Contact</a></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->

					</nav>
				</div>
				<div class="col-sm-2 search-right">
					<ul class="heart">
					
						<li><a href="WishListServlet?command=view"> <span
								class="glyphicon glyphicon-heart" aria-hidden="true"></span>
						</a></li>
					</ul>
					<div class="cart box_1">
						<a href="checkout.jsp">
							<h3>
								<div class="total">
									<span><%=cart.format(cart.total())%></span>
								</div>
								<img src="images/cart.png" alt="" />
							</h3>
						</a>
						<p>
							<a href="CartServlet?command=removeall&productID=0">Empty Cart</a>
						</p>

					</div>
					<div class="clearfix"></div>
				
		
				</div>
				
				<div class="clearfix"></div>
				<form action="SearchServlet" method="get">
						<div class="box" align="left" style="margin-left: 250;">
								<div class="container-4">
									<input type="search" id="search" name="search" placeholder="Search..." />
									<button class="icon"  type="submit">
										<i class="fa fa-search">Tìm Kiếm</i>
									</button>
								</div>
							</div>	
				</form>
				
			</div>
					
						
		</div>
	</div>

</body>
</html>