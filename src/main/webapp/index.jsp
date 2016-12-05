
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
</head>

<body background="Images/41.jpg">

	<div class="container text-center">
		<h1>VISION</h1>
		<p>A camera is a tool for learning how to see without a camera.</p>
	</div>


	<%@ include file="./navbar.jsp"%>

	${successmessage} ${errormessage} ${registermessage}

	<!-- if the error message is there, I have to open login.jsp -->
	<c:if test="${!empty logoutMessage}">
		<div class="alert alert-success">${logoutMessage}</div>
	</c:if>

	<c:if test="${!empty errorMessage}">
		<div class="alert alert-danger">${errorMessage}</div>
	</c:if>

	<c:if test="${!empty successMessage}">
		<div class="alert alert-success">${errorMessage}</div>
	</c:if>

	<c:if test="${!empty selectedProduct.name}">
		<%@ include file="./selectedproduct.jsp"%>
	</c:if>
	<c:if test="${isuserClickedRegisterHere==true}">
		<%@include file="./register.jsp"%>
	</c:if>

	<c:if test="${isUserClickedLoginHere==true || invalidCredentials==true}">
		<div id="error">${errorMessage}</div>
		<%@include file="./login.jsp"%>
	</c:if>
	
	<%-- <c:if test="${isAdmin==true}">
	<%@ include file="./admin/adminHome.jsp" %></c:if>
	 --%>
	 
	<%--  <c:if test="${isAdminClickedCategories==true }">
	<%@ include file="./admin/adminHome.jsp" %>
	<%@ include file="./admin/category.jsp" %>
	</c:if> --%>
	 
	 
	 <c:if test="${isAdmin==true}">
	<%@ include file="./adminHome.jsp" %></c:if>
	
	<c:if test="${isAdminClickedCategories==true }">
	<%@ include file="./adminHome.jsp" %>
	<%@ include file="./category.jsp" %>
	</c:if>

	<c:if test="${isuserClickedLogout}">
		<jsp:include page="logout.jsp"></jsp:include>

	</c:if>


	<c:if test="${isuserClickedHome}">
		<jsp:include page="home.jsp"></jsp:include>

	</c:if>

	<c:if test="${isuserClickedContact}">
		<jsp:include page="contact.jsp"></jsp:include>

	</c:if>

	<c:if test="${isuserClickedAboutus}">
		<jsp:include page="aboutus.jsp"></jsp:include>

	</c:if>

	<c:if test="${isuserClickedDslr}">
		<jsp:include page="dslr.jsp"></jsp:include>

	</c:if>

	<c:if test="${isuserClickedSlr}">
		<jsp:include page="slr.jsp"></jsp:include>

	</c:if>

	<c:if test="${isuserClickedDigital}">
		<jsp:include page="digital.jsp"></jsp:include>

	</c:if>


</body>
</html>