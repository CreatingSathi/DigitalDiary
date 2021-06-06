
<%@ page import="com.DAO.PostDAO"%>
<%@ page import="com.Db.DBConnect"%>
<%@ page import="com.User.Post"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	UserDetails user3 = (UserDetails) session.getAttribute("userD");

	if (user3 == null) {
		response.sendRedirect("login.jsp");
		session.setAttribute("Login-error", "Please Login!!!!!");

	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	<%
	String upMsg=(String)session.getAttribute("updateMsg");
	if(upMsg != null){%>
		<div class="alert alert-success" role="alert"><%=upMsg%></div>
	<%
	session.removeAttribute("updateMsg");
	
	}
	
	%>
	
	<%
	String wrongMsg=(String)session.getAttribute("WrongMsg");
	if(wrongMsg != null){%>
		<div class="alert alert-danger" role="alert"><%=wrongMsg%></div>
	<%
	session.removeAttribute("WrongMsg");
	
	}
	
	%>

	<div class="container">
		<h2 class="text-center">All Notes</h2>

		<div class="row">
			<div class="col-md-12">

				<%
					if (user3 != null) {
						PostDAO obj = new PostDAO(DBConnect.getCon());
						List<Post> post = obj.getData(user3.getId());
						for (Post p : post) {
				%>
				<div class="card mt-3">

					<img alt="" src="img/notes.jpg" class="card-img-top mt-2 mx-auto"
						style="max-width: 180px;">

					<div class="card-body p-4">



						<h5 class="card-title"><%= p.getTitle() %></h5>
						<p><%= p.getContent() %></p>

						<p>
							<b class="text-success">Note Written By:<%= user3.getName() %> </b></br> <b
								class="text-prmary"></b>
						</p>

						<p>
							<b class="text-success">Note Written Date:<%= p.getPdate() %> </b></br> <b
								class="text-prmary"></b>
						</p>


						<div class="container text-center mt2">
							<a href="DeleteServlet?note_id=<%= p.getId() %>" class="btn btn-danger">Delete</a> 
							
							<a href="Edit.jsp?note_id=<%= p.getId() %>" class="btn btn-primary">Edit</a>
						</div>
					</div>
					<%
						}
						}
					%>



				</div>
			</div>
		</div>
	</div>
</body>
</html>