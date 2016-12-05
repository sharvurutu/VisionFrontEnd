<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>USER page</title>
</head>
<body>
	<div data-role="main" class="ui-content">

		<hr color="red" size="5">

		<ul id="menu">
			<c:if test="${not empty categoryList}">
				<c:forEach items="${categoryList}" var="category">
					<li><a href="${category.id}">${category.id}</a>
						<ul>
							<c:forEach items="${category_id.product}" var="product">
								<li><a href="<c:url value='product/get/${product.id}' />">${product.name}</a></li>
							</c:forEach>
						</ul></li>
				</c:forEach>
			</c:if>
		</ul>
	</div>
	<div>
		<c:if test="${!empty selectedProduct.id}">
			<table>
				<tr>
					<th align="left" width="80">Product ID</th>
					<th align="left" width="120">Product Name</th>
					<th align="left" width="80">Price</th>
					<!-- <th align="left" width="200">Product Category</th>
					<th align="left" width="200">Product Supplier</th> -->

				</tr>
				<tr>
					<td align="left">${Product.id}</td>
					<td align="left">${Product.name}</td>
					<td align="left">${Product.price}</td>
					<td align="left">${selectedProduct.category_id}</td>
					<td align="left">${selectedProduct.supplier_id}</td>
				</tr>
			</table>
		</c:if>
	</div>
	
	<table width="100%">
		<tr>

			<td align="right"><a href="myCart"> My Cart </a>( ${cartSize} )</td>


		</tr>
	</table>
	<h3>Product List</h3>
	<c:if test="${!empty productList}">
		<table border="2">
			<tr>
				<th width="80">Product ID</th>
				<th width="120">Product Name</th>
				<th width="120">Product Price</th>
				<th width="120">Product Image</th>
				<th width="120">Add to cart</th>
				<!-- <th width="60">Edit</th>
				<th width="60">Delete</th> -->
			</tr>
			<c:forEach items="${productList}" var="product">
				<tr>
					<td>${product.id}</td>
					<td>${product.name}</td>
					<td>${product.price}</td>
					<td><img alt="No image uploadded by admin" src=" ${product.fpath}"></td>
					<td><a href="<c:url value='/cart/add/${product.id}' />">Add to cart</a></td>
					<td><a href="<c:url value='category/edit/${product.id}' />">Edit</a></td>
					<td><a href="<c:url value='category/remove/${product.id}' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html> --%>