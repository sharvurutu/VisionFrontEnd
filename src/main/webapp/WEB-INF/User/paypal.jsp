<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.paypal{padding-top: 10px}
input{margin-bottom: 20px;padding-top: 10px}

</style>


<body>
<div class="container col-md-8">
<div class="row">
<div class="text-center">
<h3 style="color: #17202a">Pay By PayPal</h3>
<h1 style="background-color: #c4e17f; border-radius: 5px; height: 5px"></h1>
</div>
<div class="col-md-6 col-md-offset-2">
<div class="paypal">
<div class="row col-md-12">
<h4 class="text-muted">Account Number</h4>
</div>
<div class="row col-md-12">
<input type="text" class="form-control" placeholder="Account Number">
</div>

<div class="row col-md-12">
<h4 class="text-muted">Password</h4>
</div>
<div class="row col-md-12">
<input type="text" class="form-control">
</div>




<div class="row" >
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