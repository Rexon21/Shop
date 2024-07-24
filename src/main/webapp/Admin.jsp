<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="admin.css">
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
			 <a href="Admin.jsp">Products Add</a>
			 <a href="Productsmanage.jsp">Products Management</a>
			 <a href="Orderlist.jsp">List of Orders</a> <a style="cursor: pointer;" " class="menu"
				onClick="openSlide()">User</a>
		</nav>
	</header>
	<main>
        <section>
           
            <form action="Admin" method="post" enctype="multipart/form-data">
             <h2>Add New Product</h2>
                <label for="product_id">Product ID:</label>
                <input type="text" id="product_id" name="product_id" required><br>

                <label for="pname">Product Name:</label>
                <input type="text" id="pname" name="pname" required><br>

                <label for="price">Price:</label>
                <input type="text" id="price" name="price" required><br>

                <label for="quantity">Quantity:</label>
                <input type="text" id="quantity" name="quantity" required><br>

                <label for="img">Image:</label>
                <input type="file" id="img" name="img" required><br><br>

                <input type="submit" value="Add Product">
            </form>
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