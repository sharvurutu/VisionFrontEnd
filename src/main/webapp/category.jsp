<html>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<style>
*{padding: 0;margin: 0}
a{text-decoration: none}
li{list-style: none}

.main-nav a{
display: block;padding: 10px 0 10px 20px;
text-transform: UPPERCASE;
color:Black;
border-bottom:1px dotted gray;
}

.main-nav{
background-color:lightgray}

.main-nav a:HOVER {background-color: darkgray}

.main-nav-ul li:hover ul{display: block}

.main-nav-ul li{
margin-left: 30px
}

.main-nav-ul ul{
display: none;
}

.nav-header{

display: block;padding: 10px 0 10px 20px;
text-transform: UPPERCASE;
color:#A9A9A9;
border-bottom:1px dotted gray;


}

</style>


<body>
<div class="container col-md-4" style="background:lightgray">
<div class="nav-header">
<h3><strong>Camera Category</strong></h3>
</div>
<form action=""method="get">
<ul class="main-nav-ul main-nav">
<c:forEach items= "${categorylist}" var="category">
<li><h4><a><strong>${category.name}</strong></a></h4>
<ul>
<c:forEach items="${category.products}" var="product">
<c:url var="userselectedproduct" value="/UserSelectedProduct?pid=${product.id}"></c:url>

<li><a href="${userselectedproduct}" >${product.name}</a></li>


</c:forEach>

</ul>
</li>


</c:forEach>
</ul>


<!-- <li><h4><a><strong>Search bikes,.</strong></a></h4></li>
<li><h4><a><strong>Upcoming Bikes</strong></a></h4></li>
 -->


</form>

</div>
</body>
</html>