<%@page import="de.de.connection.DbCon"%>
<%@page import="de.de.dao.ProductDao"%>
<%@page import="de.de.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>Clothes For A Cause</title>
<style>
body{
background-image: linear-gradient(to right,#F5E3E6,#D9E4F5);
}
</style>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>

	<div class="container">
		<div class="card-header my-3" style="font-family:Gabriola;font-size:30px;background-color:lightgrey;">For Ladies</div>
		<div class="row">
			<%
			if (!products.isEmpty()) 
			{
				for (Product p : products) 
				{
					if (p.getCategory().equals("Female Dress"))
					{
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="product-imgs/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">Price: Rs.<%=p.getPrice() %></h6>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark"  style="background-color:hotpink;"href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> <a
								class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			
			<%
					}
				}
			} else {
			out.println("There is no products");
			}
			%>
		</div>
		
		<div class="container">
		<div class="card-header my-3" style="font-family:Gabriola;font-size:30px;background-color:lightgrey;">For Mens</div>
		<div class="row">
			<%
			if (!products.isEmpty()) 
			{
				for (Product p : products) 
				{
					if (p.getCategory().equals("Mens Dress"))
					{
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="product-imgs/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">Price: Rs.<%=p.getPrice() %></h6>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark"  style="background-color:hotpink;"href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> <a
								class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			
			<%
					}
				}
			} else {
			out.println("There is no products");
			}
			%>
		</div>
		
		<div class="container">
		<div class="card-header my-3" style="font-family:Gabriola;font-size:30px;background-color:lightgrey;">For Kids</div>
		<div class="row">
			<%
			if (!products.isEmpty()) 
			{
				for (Product p : products) 
				{
					if (p.getCategory().equals("Kids Wear"))
					{
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="product-imgs/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">Price: Rs.<%=p.getPrice() %></h6>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark"  style="background-color:hotpink;"href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> <a
								class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			
			<%
					}
				}
			} else {
			out.println("There is no products");
			}
			%>
		</div>
	
	<%@include file="/includes/footer.jsp"%>
</body>
</html>