<html>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<style>
table, th, td {
    border: 2px solid black;
    border-collapse: collapse;
 
}
th, td {
    padding: 5px;
}
 
a
{
text-decoration: none;
}



</style>



<body>

	<div class="container col-md-8">
	<form:form action="" modelAttribute="cart">
		<h3>My Cart</h3>
		<h1 style="background-color: #c4e17f; border-radius: 5px; height: 5px"></h1>
		<table style="width: 100%;border-spacing:25px">
		<tr style="height: 50px;color: green">
		<th><h4><strong>Cart Id</strong></h4></th>
		<th><h4><strong>Product Name</strong></h4></th>
		<th><h4><strong>Quantity</strong></h4></th>
		<th><h4><strong>Price</strong></h4></th>
		</tr>
		 <c:forEach items="${cartlist}" var="cart">
		  <c:url var="deletecart" value="/DeleteCart?cid=${cart.id}"></c:url>
	<tr style="height: 30px">
		<td>${cart.id}</td>
		<td>${cart.product_Name}</td>
		<td>${cart.quantity}</td>
		<td>${cart.price}</td>
		<td><a class="btn btn-lg btn-warning" href="${deletecart}">Delete</a></button></td>
	 	</tr>
		</c:forEach> 		
		</table><br><br>
		
		<div class="row col-md-offset-2">
<label class="col-md-4"><h4><strong>Total Amount</strong></h4></label>		
	<h4>	 <input class="col-md-2" type="text" class="form-control input-lg" value="Rs.${TotalAmount}" readonly="true"></h4>
	<h4> <a class="btn btn-success col-md-offset-2" href="cart_checkout">Checkout</a></h4>
	
		</div>
		
		
		</form:form>
	</div>
</body>
</html>