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
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
a{text-decoration: none}
</style>


<body>

<div class="container col-md-6">
<div class="row">
<center><h3 style="color: #17202a"><strong></strong>Select Payement Method</h3></center> 
<h1 style="background-color: #c4e17f; border-radius: 5px; height: 5px"></h1>
</div>
<form:form modelAttribute="paymentMethod">
<form:select path="paymentmethod">
<form:option value="Cash On Delivery">Cash On Delivery</form:option>
<form:option value="Credit Card/Debit Card">Credit Card/Debit Card</form:option>
<form:option value="PayTm wallet">PayTm</form:option>
</form:select>
<input type="submit" name="_eventId_submitPaymentMethod" class="btn btn-success btn-lg" value="Save">


</form:form>
</div>
<!-- 
<div ng-view></div>





<script>
var app = angular.module("myapp", ["ngRoute"]);
app.config(function($routeProvider) {
    $routeProvider
    .when("/cod", {
        templateUrl : "cod.jsp"
    })
    .when("/credit_debit", {
        templateUrl : "credit_debit.jsp"
    })
.when("/ecash", {
        templateUrl : "yellow.html"
    })

    .when("/paypal", {
        templateUrl : "green.html"
    })
    .when("/rupay", {
        templateUrl : "blue.html"
    });
});
</script>





 -->

</body>
</html>