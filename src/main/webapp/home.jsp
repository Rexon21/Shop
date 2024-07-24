<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="FirstPage.css">
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
<body ">
<header>
		<h1>Fashion Store</h1>
		<nav>
			<a href="home.jsp">Home</a> <a href="FirstPage.jsp">Products</a> <a href="cartitems.jsp">Cart</a>
			<a href="Order.jsp">Your Order</a> <a style="cursor: pointer;" " class="menu"
				onClick="openSlide()">User</a>
		</nav>
	</header>
<div style="display:flex; 
flex-direction:column;
justify-items: center;
    align-items:center;
    
    " >
<h1>Welcome To</h1>  <h1>The </h1><h1> Fashion Store</h1>
</div>


	<div class="navbar">
		<a href="userpage.jsp" class="navbar_link"><span
			class="material-icons"> account_circle </span> User Profile</a> <a
			href="out" class="navbar_link"><span class="material-icons">
				exit_to_app </span> Logout </a>


	</div>


</body>
</html>