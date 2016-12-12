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

<head>

</head>
<body>
<%-- <c:set var="imagefolder" value="D:\\DT NIIT\\yamahaonline\\ProductImages\\"></c:set>
 --%>
 <c:set var="imagefolder" value="resources/img/"></c:set>
 
 
 <div class="container col-md-8">
			<div class="list col-md-4 ">
<div class="thumbnail">
<img src="${imagefolder}${ProductId}.jpg">
<div class="caption"><h4><strong>${Productname}</strong></h4></div>
</div>
</div>
<c:url var="addtocart" value="/AddToCart?pid=${ProductId}"></c:url>
 <a class="btn btn-success" href="cart_checkout">Checkout</a>
 <a class="btn btn-success" href="${addtocart}">Add To Cart</a>
</div>

</body>
</html>