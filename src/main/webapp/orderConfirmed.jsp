<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	
	<style>
	
	h2,h4{color: lightgreen;font-family: Arial, Helvetica, sans-serif}
	
	</style>
	
<body>
<div class="jumbotron" style="background-color: black">
<h2 style="color: lightgreen">Thank you Order has been Confirmed.</h2>
<h2>Product Will be Delivered Shortly.</h2>
<h3>Thank you so much for doing Business with us. Have a Good Day</h3>
<br>
<h4>
Order Number :- ${order.id }</h4>

<h4> ${order.sa}</h4>

<h4>${order.ba }</h4>
<h4>${order.pm }</h4>
<form:form>
<input type="submit" name="_eventId_finalHome" class="btn btn-success btn-lg" value="Save">

</form:form>





</div>

</body>
</html>