<html>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
*{padding: 0;margin: 0}
a{text-decoration: none}
li{list-style: none}

.Main-nav a{
display: block;padding: 10px 0 10px 20px;
text-transform: UPPERCASE;
color:Black;
border-bottom:1px dotted gray;
}

.Main-nav a:hover{background-color: grey}

.Main-nav ul{display: none}

.Main-nav li:hover ul{display: block}


}


</style>


<body>
<div class="container col-md-8">
<div class="col-md-8 nav-header">
<ul class="nav-pills Main-nav" role="tablist">
<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Manage Category</a>
<ul class="dropdown-menu" role="menu">
<li><a href="InsertCategory">Insert Category</a>
<li><a href="SearchCategory">Search Category</a>
<li><a href="DisplayAllCategory">All Category</a>
</ul>
</li>

<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Manage Product</a>
<ul class="dropdown-menu" role="menu">
<li><a href="InsertProduct">Insert Product</a>
<li><a href="SeearchProduct">Search Product</a>
<li><a href="DisplayAllProduct">All Product</a>
</ul>
</li>


<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Manage Supplier</a>
<ul class="dropdown-menu" role="menu">
<li><a href="InsertSupplier">Insert Supplier</a>
<li><a href="SearchSupplier">Search Supplier</a>
<li><a href="DisplayAllSupplier">All Supplier</a>
</ul>
</li>
</ul>
</div>
</div>
</body>
</html>