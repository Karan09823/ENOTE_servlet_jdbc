<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.Connection"%>
<%@page import="com.Db.DBConnection"%>
<%@page import="com.DAO.PostDAO"%>
<%@page import="com.User.UserPost"%>
<%@page import="java.util.*"%>

<%@include file="allComponent/navbar.jsp"%>
<%@include file="allComponent/allcomponent.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SHOW_NOTES</title>
</head>
<body>

	<%
	UserData userN = (UserData) session.getAttribute("loggedinUserName");

	if (userN == null) {
		session.setAttribute("addNoteLoginError", "Please login First !");
		response.sendRedirect("login.jsp");

	} else {
	%>

	<div class="container">
		<div class="text-center mt-3">

			<!--=======================================================================  -->
			<%
			String deletenote = (String) session.getAttribute("deletenoteMsg");
			if (deletenote != null) {
			%>
			<div class="alert alert-success" role="alert"><%=deletenote%></div>
			<%
			}
			session.removeAttribute("deletenoteMsg");
			%>

			<!--=======================================================================  -->




			<!--=======================================================================  -->

			<%
			String failDeletenoteMsg = (String) session.getAttribute("failDeletenote");
			if (deletenote != null) {
			%>
			<div class="alert alert-success" role="alert"><%=failDeletenoteMsg%></div>
			<%
			}
			session.removeAttribute("failDeletenote");
			%>


			<!--=======================================================================  -->

			<h1>ALL_NOTES</h1>
		</div>
		<div class="row">

			<div class="col-md-6 offset-md-3">


				<%
				if (userN != null) {

					Connection con = DBConnection.getCon();
					PostDAO pd = new PostDAO(con);

					List<UserPost> post = pd.getNotes(userN.getId());

					for (UserPost notes : post) {
				%>

				<div class="card">
					<img src="allComponent/notes.png" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px;">
					<div class="card-body">
						<h5 class="card-title mx-3"><%=notes.getTitle()%></h5>
						<p class="mx-3"><%=notes.getContent()%></p>

						<div class="container text-center mt-2">
							<a href="deleteServlet?note_id=<%=notes.getId()%>" class="btn btn-outline-danger">Delete</a>

							<a href="editNote.jsp?note_id=<%=notes.getId()%>"
								class="btn btn-outline-info">Edit</a>
						</div>

					</div>
				</div>

				<%
				}
				%>

				<%
				}
				%>


			</div>
		</div>

	</div>

	<%
	}
	%>


</body>
</html>
