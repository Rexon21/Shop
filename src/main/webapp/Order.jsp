<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Order.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Playwrite+CU:wght@100..400&display=swap"
	rel="stylesheet">
<script type="text/javascript">
	function openSlide() {
		document.querySelector(".navbar").classList.toggle("navbar-open");

	}
</script>
</head>

<body>
	<header>
		<h1>Fashion Store</h1>
		<nav>
			<a href="home.jsp">Home</a> <a href="FirstPage.jsp">Products</a> <a
				href="cartitems.jsp">Cart</a> <a href="Order.jsp">Your Order</a> <a
				style="cursor: pointer;" " class="menu" onClick="openSlide()">User</a>
		</nav>
	</header>
	<section class="products">
		<div class="productlist">
		<h3>Product Name</h3>
		<h3>Price</h3>
		<h3>Quantity</h3>
		<h3>Order Date</h3>
		</div>
	<%
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDetails", "root", "Rexon@2002");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from orderdetails");
	String email = (String) session.getAttribute("Mail");
	while (rs.next()) {
		if (email.equals(rs.getString("Email"))) {
	%>
	
		<div class="product">

			<p><%=rs.getString("pname")%></p>

			<p>
				RS.<%=rs.getString("price")%>
			</p>

			<p>
				<%=rs.getString("quantity")%>

			</p>
			<p><%=rs.getString("orderdate")%></p>


		</div>
	
	<%
	}
	}
	%>
	</section>
	
	<div class="navbar">
		<a href="userpage.jsp" class="navbar_link"><span
			class="material-icons"> account_circle </span> User Profile</a> <a
			href="out" class="navbar_link"><span class="material-icons">
				exit_to_app </span> Logout </a>


	</div>
</body>
</html>