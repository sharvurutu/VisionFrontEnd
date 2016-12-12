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
h3,label{color: #17202a  }	
input{margin-bottom: 20px}
input[type=text] {
    border: 2px solid lightgreen;
    border-radius: 4px;
}
label{margin-bottom: 20px}

 
}
	</style>
	
<body>
<div class="container col-md-6">

<form:form action="" class="well form-veritical" modelAttribute="billingAddress" >
<div class="row">
<center><h3><strong></strong>Add Billing Address</h3></center> 
<h1 style="background-color: #c4e17f; border-radius: 5px; height: 5px"></h1>
</div>
<div class="row">
<div class="col-md-4">
<label><h4><strong>Address Line1</strong></h4></label>
</div>
<div class="col-md-6">
<form:input type="text" name="address_line1" path="address_line1" class="form-control input-lg" required="true"></form:input>
</div>
</div>

<div class="row">
<div class="col-md-4">
<label><h4><strong>Address Line2</strong></h4></label>
</div>
<div class="col-md-6">
<form:input type="text" name="address_line2" path="address_line2" class="form-control input-lg" required="true" ></form:input>
</div>
</div>

<div class="row">
<div class="col-md-4">
<label><h4><strong>State</strong></h4></label>
</div>
<div class="col-md-6">
<form:input type="text" name="state" path="state"   class="form-control input-lg" required="true" ></form:input>
</div>
</div>

<div class="row">
<div class="col-md-4">
<label><h4><strong>City</strong></h4></label>
</div>
<div class="col-md-6">
<form:input type="text" required="true" name="city" path="city"  class="form-control input-lg"></form:input>
</div>
</div>

<div class="row">
<div class="col-md-4">
<label><h4><strong>Pincode</strong></h4></label>
</div>
<div class="col-md-6">
<form:input type="text" name="pincode" class="form-control input-lg" path="pincode" pattern="^[1-9][0-9]{5}$" title="PinCode should only contains Numbers and only 5 digits" ></form:input>
</div>
</div>
<div class="row">
<div class="col-md-3 col-md-offset-4">
<input type="submit" name="_eventId_submitBillingAddress" class="btn btn-success btn-lg" value="Save">
</div>
<div class="col-md-3">
<input type="submit" name="_eventId_cancel" class="btn btn-danger btn-lg" value="Cancel">
</div>
</div>

</form:form>

</div>

</body>
</html>