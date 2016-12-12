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
			<form:form action="InsertCategoryform" class="well form-horizontal"
				method="post" modelAttribute="category">
				<div class="row">
					<h2>Insert A New Category</h2>
					<h1
						style="background-color: #c4e17f; border-radius: 5px; height: 5px"></h1>
				</div>
				<div class="row">
					<div class="col-md-6">
						<label for="name" class="control-label"><h4>Category ID</h4></label>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<form:input type="text" placeholder="Category ID" required="true" name="CatId" path="Id"
								class="form-control input-lg"></form:input>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<label for="name" class="control-label"><h4>Category Names</h4></label>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<form:input type="text" placeholder="Category Name" name="CatName" required="true" path="name"
								class="form-control input-lg"></form:input>
						</div>

					</div>



				</div>

<div class="row">
					 <div class="col-md-6"> 
						<label for="name" class="control-label"><h4>Category Description</h4></label>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<form:input type="text" placeholder="Category Description" required="true" name="CatDesc" path="description" class="form-control input-lg"></form:input>
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

	<form:form action="" modelAttribute="category">
		<h3>Category List</h3>
		<h1 style="background-color: #c4e17f; border-radius: 5px; height: 5px"></h1>
		<table style="width: 100%;border-spacing:25px">
		<tr style="height: 50px;color: green">
		<th><h4><strong>Category Id</strong></h4></th>
		<th><h4><strong>Category Name</strong></h4></th>
		<th><h4><strong>Category Description</strong></h4></th>
		</tr>
		 <c:forEach items="${categorylist}" var="category">
		 <c:url var="modifycategory" value="/ModifyCategory?cid=${category.id}"></c:url>
		  <c:url var="deletecategory" value="/DeleteCategory?cid=${category.id}"></c:url>
 	<tr style="height: 30px">
		<td>${category.id}</td>
		<c:set var="cat" value="${category.id}"></c:set>
		<td>${category.name}</td>
		<td>${category.description}</td>
		<td><a href="${modifycategory}">Modify</a></td>
		<td><a href="${deletecategory}">Delete</a></td>
		</tr>
		</c:forEach> 		
		</table>
</form:form>
	</div>
</body>
</html>