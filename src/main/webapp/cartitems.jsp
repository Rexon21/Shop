<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="products.productcart"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="caritems.css">
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

<style type="text/css">
.products {
	display: flex;
	flex: justify-content: space-around;
	margin: 20px 0;
}
</style>
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
	<main>
		<section class="products">
			<%
			List<productcart> pro = (List<productcart>) session.getAttribute("productlist");
			int totalPrice = 0;
			if (pro != null) {

				for (productcart product : pro) {
					int productTotal = product.getPrice() * product.getQuantity();
					totalPrice += productTotal;
					System.out.println(product.getImg());
			%>
			<div class="product">
				<img src="<%=product.getImg()%>" alt="Product 2">
				<h2><%=product.getProduct_name()%></h2>

				<p>
					Amount : RS <span class="total-price"><%=product.getPrice()%></span>
				</p>

				<p>
					Quantity : <span class="quantity"> <%=product.getQuantity()%>
					</span>
				</p>
				<form action="cartdelete" method="post">
					<input type="hidden" name="id" id="id" value=<%=product.getId()%>>
					<input type="submit" value="Remove" class="remove">
				</form>

			</div>
			<script type="text/javascript">
				total =
			<%=product.getPrice()%>
				*
			<%=product.getQuantity()%>
				;
			</script>
			<%
			}
			} else {
			%>
			<h1>Cart is empty !!!</h1>

			<%
			}
			%>

		</section>
		<div class="carts">
			<section class="cart">
				<h2>Shopping Cart</h2>
				<p>
					Total Amount: RS.<span id="totalPrice"><%=totalPrice%></span>
				</p>
				<a href="Order"><button>Continue</button></a>
			</section>
		</div>

	</main>


	<div class="navbar">
		<a href="userpage.jsp" class="navbar_link"><span
			class="material-icons"> account_circle </span> User Profile</a> <a
			href="out" class="navbar_link"><span class="material-icons">
				exit_to_app </span> Logout </a>
	</div>

</body>
</html>