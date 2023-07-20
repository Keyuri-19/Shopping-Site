<%@page import="de.de.connection.DbCon"%>
<%@page import="de.de.dao.ProductDao"%>
<%@page import="de.de.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>Your Cart</title>
<style type="text/css">
.table tbody td{
vertical-align: middle;
background-color:thistle;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 25px;
}
body{
background-image: linear-gradient(to right,#F5E3E6,#D9E4F5);
}
</style>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>

	<div class="container my-3">
		<div class="d-flex py-3"><h3>Your Total Amount: Rs. ${(total>0)?dcf.format(total):0} </h3> <a class="mx-3 btn btn-primary" href="cart-check-out" style="background-color:lavender;color:black;border-color:green;">Check Out</a></div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Wishing to Buy!</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%= dcf.format(c.getPrice())%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a> 
								<input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly> 
								<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm" style="background-color:lavender;color:black;border-color:green;">Buy</button>
						</form>
					</td>
					<td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger" style="background-color:lavender;color:black;border-color:green;">Remove</a></td>
				</tr>

				<%
				}}%>
			</tbody>
		</table>
	</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>