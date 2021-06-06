<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.back-img {
	background: url("img/reg.jpg");
	width: 100%;
	height: 83vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rigister Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="continer-fluid back-img">
		<div class="row">
			<div class="col-md-4 offset-md-7">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
						<h4 style="font-family: Times New Roman;color: #FBEFEF;">Create Your Account</h4>
					</div>

					<%
						String regMsg = (String) session.getAttribute("reg-sucess");

						if (regMsg != null) {
					%>

					<div class="alert alert-success" role="alert"><%=regMsg%> Login<a href="login.jsp">Click Here</a></div>

					<%
					session.removeAttribute("reg-sucess");
						}
					%>

					<%
						String FailedMsg = (String) session.getAttribute("failed-msg");

						if (FailedMsg != null) {
					%>

					<div class="alert alert-danger" role="alert"><%=FailedMsg%></div>

					<%
					session.removeAttribute("failed-msg");
						}
					%>



					<div class="card-body">
						<form action="UserServlet" method="post">
							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="fname">
							</div>

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
								class="btn btn-primary bodge-pill btn-block">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>