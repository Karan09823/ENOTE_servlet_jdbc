<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="allComponent/navbar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME_PAGE</title>
<%@include file="allComponent/allcomponent.jsp"%>
<link rel="stylesheet" href="CSS/style.css">
</head>
<body>
	<%
	UserData userN = (UserData) session.getAttribute("loggedinUserName");

	if (userN == null) {
		session.setAttribute("addNoteLoginError", "Please login First !");
		response.sendRedirect("login.jsp");

	} else {
	%>

	<div class="container text-center mt-5">

		<div class="row">
			<div class="col-md-12 mt-3">
				<img src="allComponent/notes.png" style="max-width: 500px;"
					height="500px;">
			</div>
		</div>

		<a href="addNote.jsp" class="btn btn-info">Start Here</a>
	</div>
	<%
	}
	%>





</body>
</html>
