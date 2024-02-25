<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
UserData user2 = (UserData) session.getAttribute("loggedinUserName");

if (user2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("addNoteLoginError", "Please login First !");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allComponent/allcomponent.jsp"%>
<link rel="stylesheet" href="CSS/style.css">
</head>
<body>
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container text-center mt-5">

		<div class="row">
			<div class="col-md-12 mt-3">
				<img src="allComponent/notes.png"
					style="max-width: 500px;" height="500px;">
			</div>
		</div>

		<a href="addNote.jsp" class="btn btn-info">Start Here</a>
	</div>


</body>
</html>