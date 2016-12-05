<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Rutu's Vision</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="home">Home</a></li>
			
			<li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="category">Category
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="dslr">DSLR</a></li>
          <li><a href="slr">SLR</a></li>
          <li><a href="digital">DIGITAL CAMERA</a></li>
        </ul>
      </li>
			<li><a href="contact">Contact</a></li>
			<li><a href="aboutus">About Us</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="registerHere"> <span
					class="glyphicon glyphicon-user"> </span> Sign Up
			</a></li>
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<c:if test="${not empty successmessage}">
				<li><a href="cart"> <span
						class="glyphicon glyphicon shopping-cart"> </span> my cart
				</a></li>

				<li><a href="logout"><span
						class="glyphicon glyphicon-log-out"></span> logout</a></li>

			</c:if>

			<c:if test="${empty successmessage}">
				<li><a href="login"><span
						class="glyphicon glyphicon-log-in"></span> login</a></li>

			</c:if>

		</ul>
	</div>
	</nav>
</body>
</html>
