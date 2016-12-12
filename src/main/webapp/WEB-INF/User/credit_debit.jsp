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
.credit-card{padding-top: 10px}
</style>


<body>
<div class="container col-md-8">
<div class="row">
<div class="text-center">
<h3 style="color: #17202a">Credit Card / Debit Card Details</h3>
<h1 style="background-color: #c4e17f; border-radius: 5px; height: 5px"></h1>
</div>
<div class="col-md-6 col-md-offset-2">
<div class="credit-card">
<div class="row col-md-12">
<h4 class="text-muted">Credit Card Number / Debit Card Number</h4>
</div>

<div class="row">
<div class="col-md-3">
<input type="text" class="form-control" placeholder="0000">
</div>

<div class="col-md-3">
<input type="text" class="form-control" placeholder="0000">
</div>

<div class="col-md-3">
<input type="text" class="form-control" placeholder="0000">
</div>

<div class="col-md-3">
<input type="text" class="form-control" placeholder="0000">
</div>
</div>
<h1 style="background-color: #c4e17f; border-radius: 5px; height: 5px"></h1>
<div class="row">
<div class="col-md-4">
<h4 class="text-muted">Expiry Month</h4>
</div>

<div class="col-md-4">
<h4 class="text-muted">Expiry Year</h4>
</div>

<div class="col-md-4">
<h4 class="text-muted">CCV</h4>
</div>
</div>


<div class="row">
<div class="col-md-4">
<input type="text" class="form-control" placeholder="MM">
</div>

<div class="col-md-4">
<input type="text" class="form-control" placeholder="YY">
</div>

<div class="col-md-4">
<input type="text" class="form-control" placeholder="CCV">
</div>
</div>
<h1 style="background-color: #c4e17f; border-radius: 5px; height: 5px"></h1>
<div class="row col-md-12">
<input type="text" class="form-control" placeholder="Name On The Card">
</div>

<div class="row">
 <div class=" checkbox col-md-8">
 <label>
     <input type="checkbox" checked class="text-muted"> Save details for fast payments.
   </label>
   </div>
</div>
<h1 style="background-color: #c4e17f; border-radius: 5px; height: 5px"></h1>
<div class="row">
<div class="col-md-6">
 <input type="submit" class="btn btn-danger" value="CANCEL" />
</div>

<div class="col-md-6">
 <input type="submit" class="btn btn-warning" value="PAY NOW" />
</div>

</div>
</div>

</div>



</div>
</div>





</body>
</html>