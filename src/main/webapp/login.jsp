<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
Please login with your credentials
<br>
${message}
<c:url var="action" value="/validate">
</c:url>

<c:url var="action" value="/j_spring_security_check">
</c:url>

<form name="loginForm" action= "${action}" method="post">

<div class ="input-group margin-bottom-sn">
<span class="input-group-addon">
<i class="fa fa-envelop-o fa-fw"></i></span>
<input class="form-control" type="text" name="username" placeholder=User ID">
</div>

<div class="input-group">
<span class="input-group-addon">
<i class="fa fa-key fa-fw"></i></span>
<input class="form-control" type="password" name="password" placeholder="Password">
</div>

<input type="hidden" name="${_csrf.parameterName}"
value="${_csrf.token}" /> <input type="submit"
class="btn btn-default" value="Login">
</form>



</body>
</html>
