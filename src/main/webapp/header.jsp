<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title> meta http-equiv="Content-Type"
content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<c:if test="${empty loggedInUser}">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="registerHere"><span
						class="glyphicon glyphicon-user"></span>Sign Up</a></li>
			</ul>
		</c:if>

		<!-- <ul class="nav navbar-nav navbar-center">
			<form class="navbar-form" role="search">
				<div class="input-group">
					<input type="text" size="80%" class="form-control"
						placeholder="Search for a Products, Categories and more..">
				</div>
			</form>
		</ul>
 -->
		<ul class="nav navbar-nav navbar-right">

			<c:if test="${empty loggedInUser}">
				<li><a href="loginHere"> <span
						class="glyphicon glyphicon-user"></span>Login
				</a></li>
			</c:if>

			<c:if test="${!empty loggedInUser}">
				<span class="glyphicon glyphicon-shopping-cart"></span>
				<c:if test="${empty isAdmin}">
					<a href="myCart">My Cart</a>
					<i class="fa fa-shopping-cart">${cartSize}</i>
				</c:if>

				<li><a href=j_spring_security_logout><span
						class="glyphicon glyphicon-logout"></span>Logout</a></li>
			</c:if>
		</ul>
	</div>
	</nav>
</body>
</html>