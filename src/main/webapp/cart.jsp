<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<table>
		<tr>
			<th align="left" width="80">Cart ID</th>
			<th align="left" width="120">Product Name</th>
			<th align="left" width="200">Quantity</th>
			<th align="left" width="80">Price</th>
			<th align="left" width="center">Cart ID</th>

		</tr>
		
		<c:forEach items="${cartList}" var="cart">
		<tr>
		<td align="left">${cart.id}
		<td align="left">${cart.productName}
		<td align="left">${cart.quantity}
		<td align="left">${cart.price}
		<td align="left"><a href="<c:url value='/myCart/delete/${cart.id}'/>">Delete</a>
	</table>
</body>
</html>