<html>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Rutu's World</a>
		</div>

		<ul class="nav navbar-nav">
			<li class="active"><a href="home">HOME</a></li>
			<li><a href="aboutus">ABOUT US</a></li>
			<li><a href="contactus">CONTACT US</a></li>
			<!-- <li> <a class="btn btn-success" href="cart_checkout"></a>
			</li>
 -->
			

					</ul>




		<ul class="nav navbar-nav navbar-right">
		<c:if test="${not empty UserLoginSuccessMessage}">
		<li><a href="mycart"><span
					class="glyphicon glyphicon-shopping-cart"></span> My Cart</a></li>
			<li><a href="logout"><span
					class="glyphicon glyphicon-log-out"></span>Logout</a></li>	
		</c:if>
		
			<c:if test="${not empty AdminSuccessMessage}">
			<li><a href="logout"><span
					class="glyphicon glyphicon-log-out"></span>Logout</a></li>	
		</c:if>
		
		<c:if test="${empty UserLoginSuccessMessage && empty AdminSuccessMessage}"> 
			<li><a href="user-register"><span
					class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			<li><a href="showloginform"><span
					class="glyphicon glyphicon-log-in"></span> Login</a></li>
					</c:if>
		</ul>
		</div>
	</nav>
	</body></html>