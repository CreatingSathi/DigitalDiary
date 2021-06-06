<%@ page import="com.User.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	UserDetails user1 = (UserDetails) session.getAttribute("userD");

	if (user1 == null) {
		response.sendRedirect("login.jsp");
		session.setAttribute("Login-error", "Please Login!!!!!");

	}
%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<%@include file="all_component/navbar.jsp"%>

		<h1 class="text-center">AdD YouR NoTes</h1>


		<div class="container">

			<div class="row">
				<div class="col-md-12">

					<form action="AddNotesServlet" method="post">
						<div class="form-group">
							<%
								UserDetails us = (UserDetails) session.getAttribute("userD");
								if (us != null) {
							%>
							<input type="hidden" value="<%=us.getId()%>" name="uid">
							<%
								}
							%>



							<label for="exampleInputEmail1">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required">
						</div>
						<div class="from-group">
							<label for="exampleInputEmail1">Enter Content</label>
							<textarea rows="10" cols="" class="form-control" name="content"
								required="required"></textarea>
						</div>
						<div class="container text-center mt-3">
							<button type="submit" class="btn btn-primary">ADD NOTES</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>