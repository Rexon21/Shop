<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="ForgetPassword.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	<div
		class="container min-vh-100 d-flex justify-content-center align-items-center ">

		<form action="ffff" method="post">
			<div class="page">
				<div class="passh">Forget Password !!!</div>
				<div class="pass">

					
					<input type="Email" placeholder="Enter Your UserName" name="User"
						id="User" required /> <br> <br> <input type="tel"
						placeholder="Enter Your Mobile Number" name="Mobileno"
						id="Mobileno" required /> <br>
						<p id="Invalid"></p>

					<div class="passb">
						<input type="submit" value="Check" />
					</div>

					<div class="signup">
						Not register yet ? <a href="Signup.jsp">Sign up</a>
					</div>
					<div class="log">
						Go Back To - <a href="index.jsp">Log In</a>
					</div>


				</div>
			</div>



		</form>

		<%
		String value = (String) request.getAttribute("invalid");
		if (value != null) {
		%>
		<script type="text/javascript">
		document.getElementById("Invalid").innerHTML="<%=value%>"
		</script>
		<%
		} else {
		%>
		<script type="text/javascript">
			document.getElementById("Invalid").innerHTML = ""
		</script>
		<%
		}
		%>
	</div>

</body>
</html>