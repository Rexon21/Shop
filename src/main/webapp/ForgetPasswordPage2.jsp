<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="ForgetPage2.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="ForgetPassword.js"></script>


</head>
<body>
	<div
		class="container min-vh-100 d-flex justify-content-center align-items-center ">
		<%
		String MobileNo = (String) request.getAttribute("mobile");
		String Email = (String) request.getAttribute("user");
		%>

		<form action="for" method="post" onSubmit="return doCheck()">
			<div class="page">
				<div class="passh" id="head">Create New Password</div>
				<div class="pass">
					<input type="text" placeholder="Enter Your New Password"
						name="Newpass" id="NewPass" required /> <br>
					<p id="passerror"></p>
					<input type="password" placeholder="Confirm Password" name="CPassw"
						id="CPassw" required /> <br>
					<p id="cpasswError"></p>
					<p id="Success"></p>

					<div class="passb" id="passb">
						<input type="submit" value="Confirm" />
					</div>
					<input type="hidden" name="MobileNo" value=<%=MobileNo%>> <input
						type="hidden" name="Email" value=<%=Email%>>

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
		String value = null;
		value = (String) request.getAttribute("value");
		if (value != null) {
		%>
		<script type="text/javascript">
		      
	    	document.getElementById("Success").innerHTML="<%=value%>";
			document.getElementById("head").innerHTML = "";
			document.getElementById("CPassw").remove();
			document.getElementById("NewPass").remove();
			document.getElementById("passb").remove();
		</script>

		<style type="text/css">
    #Success {
	text-align: center;
	font-size: 40px;
	padding-bottom: 40px;
	font-family: mo;
	color: #ecf300
}
</style>

		<%
		} else {
		%>
		<script type="text/javascript">
			document.getElementById("head").innerHTML = "Create New Password";
		</script>

		<%
		}
		%>





	</div>

</body>
</html>