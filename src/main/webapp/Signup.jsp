<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Signup.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="signin.js"></script>
</head>
<body>
	<div
		class="container min-vh-100 d-flex justify-content-center align-items-center ">

		<form action="sign" method="Post" onSubmit="return dataCheck()">
			<div class="page">
				<div class="Signh">Sign In</div>
				<div class="Signin">


					<input type="text" placeholder="Enter Your Name" id="user"
						name="User" required /> <br> <br> <input type="tel"
						placeholder="Enter Your mobile Number" id="mobileno"
						name="Mobileno" required /> 
					<p id="mobilenoError"></p>
					<input type="email" placeholder="Enter Your Email" id="Email"
						name="Email" required /> 
					<p id="emailError"></p>
					<input type="password" placeholder="Password" id="Passw"
						name="Password" required /> 
					<p id="passwordError"></p>

					<input type="password" placeholder="Confirm Password" id="cpassw"
						name="Cpassword" required /> 
					<p id="confirmpasswordError"></p>

					<div class="Signb">
						<input type="submit" value="Sign In" />
					</div>

					<div class="log">
						Already Exist User? <a href="index.jsp">Log In</a>
					</div>


				</div>
			</div>
			
			<%
			String InvalidUser=(String)request.getAttribute("Invuser");
			String InvalidMobile=(String)request.getAttribute("InvNum");
			
			if(InvalidUser!=null){
			
			%>
			<script type="text/javascript">
			document.getElementById("emailError").innerHTML="<%=InvalidUser%>";
			</script>
			<%
			}
			else if (InvalidMobile!=null){
				
			%>
			<script type="text/javascript">
			document.getElementById("mobilenoError").innerHTML="<%=InvalidMobile%>";
			</script>
			<%
			}else{
				
			
			%>
			<script type="text/javascript">
			document.getElementById("mobilenoError").innerHTML=""
			document.getElementById("emailError").innerHTML=""
			</script>
			<%
			}
			%>



		</form>
	</div>

</body>
</html>