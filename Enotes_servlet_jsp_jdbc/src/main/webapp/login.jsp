<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<!-- css/start -->
<link rel="stylesheet" href="CSS/style.css">
<!-- css/end -->
<title>Enotes_LoginPage</title>
</head>
<body>
	<%@include file="allComponent/allcomponent.jsp"%>
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container-fluid ">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5 ">
					<div class="card-header text-center">

						<h2>LOGIN</h2>
					</div>
					<%
					//==start=================================================================
					%>
					<%
					String loginfailMsg = (String) session.getAttribute("login-fail");

					if (loginfailMsg != null) {
					%>

					<div class="alert alert-danger" role="alert"><%=loginfailMsg%></div>

					<%
					session.removeAttribute("login-fail");
					}
					%>
					<%
					//==end======================================================================
					%>





					<%
					String logoutmsg = (String) session.getAttribute("logoutMsg");

					if (logoutmsg != null) {
					%>

					<div class="alert alert-danger" role="alert"><%=logoutmsg%></div>


					<%
					session.removeAttribute("logoutMsg");
					}
					%>






					<%
					//==start=============================================================
					%>

					<%
					String addNoteErrorMsg = (String) session.getAttribute("addNoteLoginError");

					if (addNoteErrorMsg != null) {
					%>

					<div class="alert alert-danger" role="alert"><%=addNoteErrorMsg%></div>

					<%
					session.removeAttribute("addNoteLoginError");
					}
					%>

					<%
					//==end==============================================================
					%>
					<div class="card-body">
						<form action="LoginServlet" method="post">
							<div class="mb-3">
								<label for="exampleUserName" class="form-label">Username
								</label> <input type="text" class="form-control"
									id="exampleInputUserName" aria-describedby="UserNameHelp"
									name="logineUserName">

							</div>




							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="loginemail">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" name="loginpassword">
							</div>

							<div class="d-grid text-center">
								<button type="submit" class="btn btn-primary ">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>