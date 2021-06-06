<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.back-img {
	background: url("img/login.jpg");
	width: 100%;
	height: 83vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>

	<%@include file="all_component/navbar.jsp"%>
	<div class="continer-fluid back-img ">
		<div class="row">
			<div class="col-md-4 offset-md-1">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
						
						<h4 style="font-family: Times New Roman;color: #FBEFEF;">Login to Digital Diary</h4>
					</div>



					<%
						String invalidMsg = (String) session.getAttribute("login-failed");

						if (invalidMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=invalidMsg%></div>


					<%
						session.removeAttribute("login-failed");
						}
					%>
					<%
						String withoutLogin = (String) session.getAttribute("Login-error");
						if (withoutLogin != null) {
					%>
					<div class="alert alert-warning alert-dismissible fade show"
						role="alert">
						<strong>Hey!</strong> Please Login First!!!!!
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<%
						session.removeAttribute("Login-error");
						}
					%>

					<%
						String loutMsg = (String) session.getAttribute("logoutMsg");
						if (loutMsg != null) {
					%>
					<div class="alert alert-success" role="alert">
						<h4 class="alert-heading">Well done!</h4>
						<p>Aww Yeah, You Successfully LogOut.</p>
						<hr>
						<p class="mb-0">Whenever you need to go to this Page, be sure
							that you are Logged in..!!!!</p>
					</div>
					<%
						session.removeAttribute("logoutMsg");
						}
					%>
					
					
					<%
						String forgetpassword = (String) session.getAttribute("forgotmsg");
						if (forgetpassword != null) {
					%>
					<div class="alert alert-success" role="alert">
						<h4 class="alert-heading">Yeah :-)</h4>
						<p>You Successfully Saved Your Password.</p>
						<hr>
						<p class="mb-0">Remember Your Password</p>
					</div>
					<%
						session.removeAttribute("forgotmsg");
						}
					%>



					<div class="card-body">
						<form action="loginServlet" method="post">


							<div class="form-group">
								<label>Enter Your Email</label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uemail">
							</div>
							<div class="form-group">

								<label for="exampleInputPassword1"> Enter Your Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" name="upassword">
							</div>

							<button type="submit"
								class="btn btn-primary bodge-pill btn-block">Login</button>
						
							<a href="forgot.jsp">Forgot Password......!!!!!</a>
							
							
						
						
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>

</body>
</html>