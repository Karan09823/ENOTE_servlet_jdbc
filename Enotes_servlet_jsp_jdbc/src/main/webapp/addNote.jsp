<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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




	<div class="container mt-5">

		<div class="row">

			<div class="col-md-5 offset-md-3">

				<div class="card">
					<h1 class=" text-center mt-3 ms-2">Add_Note</h1>
					<div class="card-body">
						<form action="AddNoteServlet" method="post">

							<%
							UserData ul = (UserData) session.getAttribute("loggedinUserName"); // when a user is logged in  then a id is assigned to a user

							if (ul != null) {
							%>

							<input type="hidden" value="<%=ul.getId()%>"
								name="loggedinUserid">

							<%
							}
							%>



							<div class="mb-3">
								<label for="NoteTitle" class="form-label">Title</label> <input
									type="text" class="form-control" id="NoteTitle"
									aria-describedby="notetitle" name="InNoteTitle"
									required="required">

							</div>

							<div class="mb-3">

								<textarea rows="8" class="form-control"
									placeholder="Write Your Notes here ....." name="InNoteContent"
									required="required"></textarea>
							</div>
							<div class="d-grid">

								<button type="submit" class="btn btn-info btn-block">Submit</button>
							</div>

						</form>

					</div>
				</div>





			</div>

		</div>
	</div>



</body>
</html>