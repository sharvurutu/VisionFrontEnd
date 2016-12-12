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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>

<style>
table, th, td {
    border: 2px solid black;
    border-collapse: collapse;
 
}
th, td {
    padding: 5px;
}

select{ width:240px;height:40px
}
</style>
<body>
		<div class="col-md-8">
			<form:form action="ProcessInsertProductform" class="well form-horizontal" method="post" modelAttribute="product" enctype="multipart/form-data">
				<div class="row">
					<h2>Add A New Product</h2>
					<h1 style="background-color: #c4e17f; border-radius: 5px; height: 5px"></h1>
				</div>
				<div class="row">
					<div class="col-md-6">
						<label for="name" class="control-label"><h4>Product ID</h4></label>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<form:input type="text" placeholder="Product ID" name="ProdId" path="Id" required="true"
								class="form-control input-lg"></form:input>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<label for="name" class="control-label"><h4>Product Name</h4></label>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<form:input type="text" placeholder="Product Name" name="ProdName" path="name" required="true"
								class="form-control input-lg"></form:input>
						</div>
					</div>
		</div>

			<div class="row">
					 <div class="col-md-6"> 
						<label for="name" class="control-label"><h4>Category Id</h4></label>
					</div>
					<div class="col-md-4">
											<form:select path="Category_Id">
						<c:forEach items="${categorylist}" var="category">
						<form:option cssClass="width:50" value="${category.id}"></form:option>
						
						</c:forEach>
						
						</form:select>
						</div>
					</div>
				
				
				<div class="row">
					 <div class="col-md-6"> 
						<label for="name" class="control-label"><h4>Supplier Id</h4></label>
					</div>
					<div class="col-md-4">
						<div class="input-group">
						<form:select path="Supplier_Id">
						<c:forEach items="${supplierlist}" var="supplier">
						<form:option value="${supplier.id}"></form:option>
						</c:forEach>
						</form:select>
						</div>
					</div>
				</div>
<div class="row">
					<div class="col-md-6">
						<label for="name" class="control-label"><h4>Product Price</h4></label>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<form:input type="text" placeholder="Product Name" name="ProdPrice" path="price" required="true"
								class="form-control input-lg"></form:input>
						</div>
					</div>
		</div>
		
		<div class="row">
					<div class="col-md-6">
						<label for="name" class="control-label"><h4>Stock</h4></label>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<form:input type="text" placeholder="Product Name" name="ProdStock" path="stock" required="true"
								class="form-control input-lg"></form:input>
						</div>
					</div>
		</div>

<div class="row">
					<div class="col-md-6">
						<label for="name" class="control-label"><h4>Upload Image</h4></label>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<form:input type="file" path="image" name="image" ></form:input>
						</div>
					</div>
		</div>



				<div class="row">
					<div class="col-md-offset-2 col-md-4">
						<div class="form-group">
							<a href=""> <input type="submit"
								class="btn btn-success btn-block btn-lg" value="Submit"></a>
						</div>
					</div>
				</div>
</form:form>

	<form:form action="" modelAttribute="product">
		<h3>Category List</h3>
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