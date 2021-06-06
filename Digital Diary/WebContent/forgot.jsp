
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.back-img {
	background: url("img/forgot.jpg");
	width: 100%;
	height: 83vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
<%
						String wrongpwd = (String) session.getAttribute("wrongmsg");
						if (wrongpwd != null) {
					%>
	<div class="alert alert-danger alert-dismissible fade show"
		role="alert">
		<strong><b>Hey!</b></strong> Please Check Your Email..!!!!! Something You Submit Wrong :-( Please Check, Confirm &
		Resubmit it.. :-)
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
		session.removeAttribute("wrongmsg");
		}
	%>

	<div class="container-fluid back-img">
		<div class="text-center">
	
			<form action="Forgot" method="post">
<h1>Note: Enter Your Email-Id to Give Your New Password</h1>
<h6 class="text-danger"><b>Enter Email:   <small>(*mandatory)</small></b></h6> <input type="text" name="email"><br><br>
<h6 class="text-danger"><b>New_Password:</b></h6> <input type="password" name="pass"><br><br>


<input type="submit" value="Submit">




</form>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>