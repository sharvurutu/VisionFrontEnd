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
</style>



<body>

	<div class="container col-md-8">
	<form:form action="" modelAttribute="product">
		<h3>Product List</h3>
		<h1 style="background-color: #c4e17f; border-radius: 5px; height: 5px"></h1>
		<table style="width: 100%;border-spacing:25px">
		<tr style="height: 50px;color: green">
		<th><h4><strong>Product Id</strong></h4></th>
		<th><h4><strong>Product Name</strong></h4></th>
		<th><h4><strong>Product Price</strong></h4></th>
		<th><h4><strong>Category_ID</strong></h4></th>
		<th><h4><strong>Supplier_Id</strong></h4></th>
		<th><h4><strong>Stock</strong></h4></th>
		</tr>
		 <c:forEach items="${productlist}" var="product">
		 <c:url var="modifyproduct" value="/ModifyProduct?pid=${product.id}"></c:url>
		  <c:url var="deleteproduct" value="/DeleteProduct?pid=${product.id}"></c:url>
 	<tr style="height: 30px">
		<td>${product.id}</td>
		<td>${product.name}</td>
		<td>${product.price}</td>
		<td>${product.category_Id}</td>
		<td>${product.supplier_Id}</td>
		<td>${product.stock}</td>
		<td><a href="${modifyproduct}">Modify</a></td>
		<td><a href="${deleteproduct}">Delete</a></td>
		</tr>
		</c:forEach> 		
		</table>
		</form:form>
	</div>
</body>
</html>