<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- css/start -->
<link rel="stylesheet" href="CSS/style.css">
<!-- css/end -->
<title>Enotes_RegisterPage</title>
</head>
<body>
	<%@include file="allComponent/allcomponent.jsp"%>
	<%@include file="allComponent/navbar.jsp"%>

	<div class="container-fluid ">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5 ">

					<div class="card-header text-center">

						<h2>REGISTER</h2>
					</div>
					<%
					String MsgSucess = (String) session.getAttribute("reg-sucess");

					if (MsgSucess != null) {
					%>
					<div class="alert alert-success"><%=MsgSucess%></div>
					<%
					session.removeAttribute("reg-sucess");
					}
					%>

					<%
					String MsgFail = (String) session.getAttribute("reg-fail");
					if (MsgFail != null) {
					%>
					<div class="alert alert-danger"><%=MsgFail%></div>
					<%
					session.removeAttribute("reg-fail");
					}
					%>

					<div class="card-body">
						<form action="RegisterServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Enter
									Your Name</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="nameHelp"
									name="username">

							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="useremail">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" name="userpassword">
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