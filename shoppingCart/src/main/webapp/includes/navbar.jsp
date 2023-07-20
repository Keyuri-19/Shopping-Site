<nav class="navbar navbar-expand-lg navbar-light bg-light"style="background-image: linear-gradient(to right,#F5E3E6,#D9E4F5);">
	<div class="container">
		<a class="navbar-brand" href="index.jsp" style="font-family:Gabriola;font-size:48px;color:palevioletred;text-decoration:underline;">Clothes For A Cause</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item" id="1"><a class="nav-link" href="index.jsp" style="font-family:Gabriola;font-style:italic;font-weight:bold;font-size:34px;color:palevioletred;">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp" style="font-family:Gabriola;font-style:italic;font-weight:bold;font-size:34px;color:palevioletred;">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
				<%
				if (auth != null) {
				%>
				<li class="nav-item"><a class="nav-link" href="orders.jsp" style="font-family:Gabriola;font-style:italic;font-weight:bold;font-size:34px;color:palevioletred;">Orders</a></li>
				<li class="nav-item"><a class="nav-link" href="log-out" style="font-family:Gabriola;font-style:italic;font-weight:bold;font-size:34px;color:palevioletred;">Logout</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="login.jsp" style="font-family:Gabriola;font-style:italic;font-weight:bold;font-size:34px;color:palevioletred;">Login</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</nav>