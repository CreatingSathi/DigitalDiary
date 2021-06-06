<%@page import="java.sql.Connection" %>
<%@page import="com.Db.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.back-img {
	background: url("img/bg.jpg");
	width: 100%;
	height: 83vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>



	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 style="font-family: Times New Roman;color: #FBEFEF;">WeLcOmE to DiGiTaL DiArY</h1>
			
			<h1 style="font-family: Times New Roman;color: #F6CECE;">Keep A Diary & Some Day It'll Keep You</h1>
			
			<h3 style="font-family: Times New Roman;color: #F78181;">Every Day Comes With New Thought, New Life & New Chance</h3>
			<h5 style="font-family: Times New Roman;color: #DF0101;">Don't Let Them Go....!!!!</h5><br><br><br><br>
			
			
			
			
			
			
			
			<a href="login.jsp" class="btn btn-light">Login</a> <a href="register.jsp"
				class="btn btn-light">Register</a>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>