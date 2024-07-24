<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="NewFile.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="login.js"></script>
</head>
<body>
	<div
		class="container min-vh-100 d-flex justify-content-center align-items-center ">

		<form action="Log" method="Post" onsubmit="return logIn()">
			<div class="page">
				<div class="loginh">LogIn</div>
				<div class="login">
					<input type="text" id="user" placeholder="Enter Your UserName"
						name="User" required />
					<p id="iuser"></p>
					<input type="password" id="password" placeholder="Password"
						name="Password" /> <br>
					<p id="ipassw"></p>
					<div class="fpwd">
						<a href="ForgetPassword.jsp">Forget Password ?</a>
					</div>
					<div class="loginb">
						<input type="submit" value="LogIn" />
					</div>
					<div class="signup">
						Not register yet ? <a href="Signup.jsp">Sign up</a>
					</div>

				</div>
			</div>



		</form>
		<%
		    String invalid=(String)request.getAttribute("password");
		   
	    	if(invalid==null){
	    		%>
	    		<script type="text/javascript">
	    		document.getElementById("ipassw").innerHTML=""
	    		</script>
	    		<%
	    		
	    		
	    	}else{
	    		%>
	    		<script type="text/javascript">
	    		document.getElementById("ipassw").innerHTML="<%=invalid%>"
	    		</script>
	    		
	    		<% 
	    		
	    	}
	    	String user=(String)request.getAttribute("user");
	    	if(user==null){
	    		%>
	    		<script type="text/javascript">
	    		document.getElementById("iuser").innerHTML=""
	    		</script>
	    		<%
	    		
	    	}else{ 
	    		%>
	    	    <script type="text/javascript">
	    		document.getElementById("iuser").innerHTML="<%=user%>"
	    		</script>
		<%
	    	}
	    	
		%>
		
	</div>

</body>
</html>