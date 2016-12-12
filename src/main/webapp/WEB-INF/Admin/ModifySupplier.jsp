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
</style>
<body>
		<div class="col-md-8">
			<form:form action="ModifySupplierform" class="well form-horizontal"
				method="post" modelAttribute="supplier">
				<div class="row">
					<h2>Modify a Category</h2>
					<h1
						style="background-color: #c4e17f; border-radius: 5px; height: 5px"></h1>
				</div>
				<div class="row">
					<div class="col-md-6">
						<label for="name" class="control-label"><h4>
								Category ID</h4></label>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<form:input type="text" placeholder="Category ID" name="SupId" path="Id" readonly="true" class="form-control input-lg"></form:input>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<label for="name" class="control-label"><h4>
								Category Names</h4></label>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<form:input type="text" placeholder="Category Name" name="SupName" path="name"
								class="form-control input-lg"></form:input>
						</div>

					</div>
</div>	

<div class="row">
					 <div class="col-md-6"> 
						<label for="name" class="control-label"><h4> Category Description</h4></label>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<form:input type="text" placeholder="Category Description" name="SupDesc" path="description" class="form-control input-lg"></form:input>
						</div>
					</div>
				</div>



				<div class="row">
					<div class="col-md-offset-2 col-md-4">
						<div class="form-group">
							<a href=""> <input type="submit"
								class="btn btn-success btn-block btn-lg" value="Modify"></a>
						</div>
					</div>
				</div>




		</form:form>

	<form:form action="" modelAttribute="supplier">
		<h3>Category List</h3>
		<h1 style="background-color: #c4e17f; border-radius: 5px; height: 5px"></h1>
		<table style="width: 100%;border-spacing:25px">
		<tr style="height: 50px;color: green">
		<th><h4><strong>Supplier Id</strong></h4></th>
		<th><h4><strong>Supplier Name</strong></h4></th>
		<th><h4><strong>Supplier Description</strong></h4></th>
		</tr>
		 <c:forEach items="${supplierlist}" var="supplier">
		 <c:url var="modifysupplier" value="/ModifySupplier?sid=${supplier.id}"></c:url>
		  <c:url var="deletesupplier" value="/DeleteSupplier?sid=${supplier.id}">
		  
		  </c:url>
 	<tr style="height: 30px">
		<td>${supplier.id}</td>
<%-- 		//<c:set var="cat" value="${supplier.id}"></c:set>
 --%>		<td>${supplier.name}</td>
		<td>${supplier.description}</td>
		<td><a href="${modifysupplier}">Modify</a></td>
		<td><a href="${deletesupplier}">Delete</a></td>
		</tr>
		</c:forEach> 		
		</table>
</form:form>
	</div>
</body>
</html>