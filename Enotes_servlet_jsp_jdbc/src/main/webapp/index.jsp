<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.Db.DBConnection"%>

<%@include file="allComponent/allcomponent.jsp"%>
<%@include file="allComponent/navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- cssfile/start -->
<link rel="stylesheet" href="CSS/style.css">
<!-- cssfile/end -->

<style type="text/css">
.bg-img {
	background: url("allComponent/notes.jpg");
	width: 100%;
	height: 90vh;
	background-size: fill;
	background-position: center;
}

.an {
	color:red;
	
	
}

.ani {
	color:orange;
	background-color:cyan;
}
</style>

<title>Enotes_IndexPage</title>
</head>
<body>

	<div class="container-fluid bg-img">
		<div class="text-center">
			<br> <br>
			<h1 class="an">ENOTES</h1>
			<marquee  class="ani">
				<h2>Save Your Important Notes !</h2>
			</marquee>
		</div>
		s

	</div>
	<%
	Connection con = DBConnection.getCon();

	System.out.println(con);
	%>


</body>
</html>
