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


<body>
	<div class="container col-md-8" align="center">
		<form:form method="post" action="userform"
			class="well form-horizontal" modelAttribute="user">
			<h2 style="color: #A9A9A9">
				 Sign up
			</h2>
			<h1
				style="background-color: #A9A9A9; border-radius: 5px; height: 5px"></h1>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i></span>
							<form:input type="text" name="name" id="name"
								placeholder="First Name" path="name"
								class="form-control input-lg" tabindex="1" />
							<font color="RED"><form:errors path="name"></form:errors></font>

						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i></span>
							<form:input type="text" name="last_name" placeholder="Last Name"
								path="last_name" class="form-control input-lg" tabindex="2" />
							<font color="RED"><form:errors path="last_name"></form:errors></font>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-envelope"></i></span>
							<form:input type="mail" name="mail_id" id="mail-id"
								class="form-control input-lg" path="mail" placeholder="Mail Id"
								tabindex="3" />
							<font color="RED"><form:errors path="mail"></form:errors></font>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-earphone"></i>
							</span>
							<form:input type="text" name="contact" id="contact"
								placeholder="Mobile Number" path="contact"
								class="form-control input-lg" tabindex="4" />
							<font color="RED"><form:errors path="contact"></form:errors></font>
						</div>
					</div>
				</div>
			</div>




			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<form:input type="password" name="password" id="password"
							placeholder="Password" path="password"
							class="form-control input-lg" tabindex="5" />
						<font color="RED"><form:errors path="password"></form:errors></font>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<form:input type="password" name="confirm-password"
							id="confirm-password" path="ConfirmPassword"
							placeholder="Confirm Password" class="form-control input-lg"
							tabindex="6" />
						<font color="RED"><form:errors path="ConfirmPassword"></form:errors></font>
					</div>
				</div>
			</div>

			<div class="row">

				<!-- <div class="col-md-6">
					By clicking <strong class="label label-primary">Register</strong>,
					you agree to the Terms and Conditions
				</div> -->
			</div>
			<h1
				style="background-color: #A9A9A9; border-radius: 5px; height: 5px"></h1>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block btn-lg"
							tabindex="7" value="Register" onclick="return validate()">

					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<input type="reset" class="btn btn-primary btn-block btn-lg"
							tabindex="7" value="Reset">
					</div>
				</div>

			</div>
		</form:form>

	</div>


</body>
</html>