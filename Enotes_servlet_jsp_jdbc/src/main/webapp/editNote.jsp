<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.Connection"%>
<%@page import="com.Db.DBConnection"%>
<%@page import="com.DAO.PostDAO"%>
<%@page import="com.User.UserPost"%>


<%
UserData userN = (UserData) session.getAttribute("loggedinUserName");

if (userN == null) {
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
	<%
	int noteid = Integer.parseInt(request.getParameter("note_id"));// note_id present in showNotes.jsp 

	Connection con = DBConnection.getCon();
	PostDAO post = new PostDAO(con);

	UserPost pos = post.geteditNoteData(noteid);
	%>



	<div class="container mt-5">
		<h1 class="text-center">Edit_Notes</h1>

		<div class="row">

			<div class="col-md-5 offset-md-3">

				<div class="card">

					<div class="card-body">
						<form action="NoteEditServlet" method="post">

							<input type="hidden" value="<%=noteid%>" name="noteid">

							<div class="mb-3">
								<label for="NoteTitle" class="form-label"><%=pos.getTitle()%></label>
								<input type="email" class="form-control" id="NoteTitle"
									aria-describedby="notetitle" name="EditNoteTitle"
									required="required">

							</div>

							<div class="mb-3">

								<textarea rows="8" class="form-control"
									placeholder="Write Your Notes here ....."
									name="EditNoteContent" required="required"><%=pos.getContent()%></textarea>
							</div>
							<div class="d-grid">

								<button type="submit" class="btn btn-primary btn-block">Submit</button>
							</div>

						</form>

					</div>
				</div>





			</div>

		</div>
	</div>




</body>
</html>