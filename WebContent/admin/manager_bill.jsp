<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<div id="panelwrap">

		<jsp:include page="header.jsp"></jsp:include>

		<div class="center_content">

			<div id="right_wrap">
			<div id="right_content">
				<h2>Tables section</h2>


				<table id="rounded-corner">
					<thead>
						<tr>
							<th></th>
							<th>Product</th>
							<th>Details</th>
							<th>Price</th>
							<th>Date</th>
							<th>Category</th>
							<th>User</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="12">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit, sed do eiusmod tempor incididunt ut.</td>
						</tr>
					</tfoot>
					<tbody>
						<tr class="odd">
							<td><input type="checkbox" name="" /></td>
							<td>Box Software</td>
							<td>Lorem ipsum dolor sit amet consectetur</td>
							<td>45$</td>
							<td>10/04/2011</td>
							<td>web design</td>
							<td>Alex</td>
							<td><a href="#"><img src="../images/edit.png" alt=""
									title="" border="0" /></a></td>
							<td><a href="#"><img src="../images/trash.gif" alt=""
									title="" border="0" /></a></td>
						</tr>
						<tr class="even">
							<td><input type="checkbox" name="" /></td>
							<td>Trial Software</td>
							<td>Lorem ipsum dolor sit amet consectetur</td>
							<td>155$</td>
							<td>12/04/2011</td>
							<td>web design</td>
							<td>Carrina</td>
							<td><a href="#"><img src="../images/edit.png" alt=""
									title="" border="0" /></a></td>
							<td><a href="#"><img src="../images/trash.gif" alt=""
									title="" border="0" /></a></td>
						</tr>
						<tr class="odd">
							<td><input type="checkbox" name="" /></td>
							<td>Hosting Pack</td>
							<td>Lorem ipsum dolor sit amet consectetur</td>
							<td>45$</td>
							<td>10/04/2011</td>
							<td>web design</td>
							<td>Alex</td>
							<td><a href="#"><img src="../images/edit.png" alt=""
									title="" border="0" /></a></td>
							<td><a href="#"><img src="../images/trash.gif" alt=""
									title="" border="0" /></a></td>
						</tr>
						<tr class="even">
							<td><input type="checkbox" name="" /></td>
							<td>Duo Software</td>
							<td>Lorem ipsum dolor sit amet consectetur</td>
							<td>745$</td>
							<td>10/04/2011</td>
							<td>web design</td>
							<td>Alex</td>
							<td><a href="#"><img src="../images/edit.png" alt=""
									title="" border="0" /></a></td>
							<td><a href="#"><img src="../images/trash.gif" alt=""
									title="" border="0" /></a></td>
						</tr>
						<tr class="odd">
							<td><input type="checkbox" name="" /></td>
							<td>Alavasti Software</td>
							<td>Lorem ipsum dolor sit amet consectetur</td>
							<td>45$</td>
							<td>10/04/2011</td>
							<td>web design</td>
							<td>John</td>
							<td><a href="#"><img src="../images/edit.png" alt=""
									title="" border="0" /></a></td>
							<td><a href="#"><img src="../images/trash.gif" alt=""
									title="" border="0" /></a></td>
						</tr>
						<tr class="even">
							<td><input type="checkbox" name="" /></td>
							<td>Box Software</td>
							<td>Lorem ipsum dolor sit amet consectetur</td>
							<td>45$</td>
							<td>10/04/2011</td>
							<td>web design</td>
							<td>Doe</td>
							<td><a href="#"><img src="../images/edit.png" alt=""
									title="" border="0" /></a></td>
							<td><a href="#"><img src="../images/trash.gif" alt=""
									title="" border="0" /></a></td>
						</tr>


					</tbody>
				</table>
				</div>
				</div>
			
			<jsp:include page="menu.jsp"></jsp:include>

		</div>

		<jsp:include page="footer.jsp"></jsp:include>


	</div>
	
</body>
</html>