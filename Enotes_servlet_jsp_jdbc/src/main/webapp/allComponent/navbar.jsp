<%@page import="com.User.UserData"%>
<%@page import="com.User.UserData"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary bg-info">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-note-sticky"></i><span> </span>Enotes</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.jsp"><i
						class="fa-solid fa-house"></i><span> </span>Home</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="addNote.jsp"><i
						class="fa-solid fa-square-plus"></i><span> </span>Add_Note</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="showNotes.jsp"><i
						class="fa-solid fa-eye"></i><span> </span>Show_Note</a></li>



			</ul>


		</div>


		<%
		UserData usd = (UserData) session.getAttribute("loggedinUserName");

		if (usd != null) {
		%>
		<form class="d-flex my-2 my-sm-0">


			<button type="button" class="btn btn-warning" data-bs-toggle="modal"
				data-bs-target="#exampleModal"><%=usd.getId()%></button>
			<span class="mx-2"></span> <a href="logoutServlet"
				class="btn btn-outline-light my-2 my-sm-0"> <i
				class="fa-solid fa-right-from-bracket"></i><span> </span>Logout
			</a>




			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">

							<table class="table">

								<tbody>
									<tr>
										<th>UserId</th>
										<td><%=usd.getId()%></td>
									</tr>

									<tr>
										<th>Name</th>
										<td><%=usd.getName()%></td>
									</tr>

									<tr>
										<th>Email</th>
										<td><%=usd.getEmail()%></td>
									</tr>

								</tbody>


							</table>




						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>

						</div>
					</div>
				</div>
			</div>

			<!--=============================================================  -->


		</form>
		<%
		} else {
		%>
		<form class="d-flex my-2 my-sm-0">

			<a href="login.jsp" class="btn btn-outline-light"> <i
				class="fa-solid fa-door-open"></i><span> </span>Login
			</a> <a href="register.jsp" class="btn btn-outline-light my-2 my-sm-0">

				<i class="fa-solid fa-user-plus"></i><span> </span>Register
			</a>


		</form>

		<%
		}
		%>
	</div>
</nav>
