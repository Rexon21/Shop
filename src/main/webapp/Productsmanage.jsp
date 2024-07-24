<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="productsmanage.css">
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
		<h3>Admin Panel</h3>
		<nav>
			<a href="Admin.jsp">Products Add</a> <a href="Productsmanage.jsp">Products
				Management</a> <a href="Orderlist.jsp">List of Orders</a> <a
				style="cursor: pointer;" " class="menu" onClick="openSlide()">User</a>
		</nav>
	</header>
	<main>
		<section class="products">
			<%
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/UserDetails", "root", "Rexon@2002");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from productdetails");

			while (rs.next()) {
			%>
			<div class="product">

				<form action="productmodify" method="post" id="add-to-cart">
					<img class="image" src="<%=rs.getString("images")%>"
						alt="<%=rs.getString("pname")%>"> <input type="text"
						name="pname" value="<%=rs.getString("pname")%>"> <input
						type="hidden" name="product_id" value="<%=rs.getInt("id")%>">
					<input type="text" name="price" value="<%=rs.getInt("price")%>">
					<label for="quantity">Quantity:</label> <input type="number"
						id="quantity" name="quantity" value="1" min="1"
						max="<%=rs.getInt("quantity")%>"> <input type="submit"
						name="action" id="update" value="Update"> <input type="submit"
						name="action" id="remove" value="Remove">
				</form>
			</div>

			<%
			}
			%>

			<!-- Add more products as needed -->
		</section>

	</main>


	<div class="navbar">
		<a href="userpage.jsp" class="navbar_link"><span
			class="material-icons"> account_circle </span> User Profile</a> <a
			href="out" class="navbar_link"><span class="material-icons">
				exit_to_app </span> Logout </a>
	</div>

</body>
</html>