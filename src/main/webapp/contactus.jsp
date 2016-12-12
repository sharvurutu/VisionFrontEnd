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

	<div class="container col-md-8">

		<form:form method="post" action="SubmitContactUsForm"
			class="well form-horizontal" modelAttribute="contactus">
			<h2 style="color: #A9A9A9">ContactUs</h2>
			<h1 style="background-color: grey; border-radius: 5px; height: 5px"></h1>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span>
							<form:input type="text" class="form-control input-lg"
								path="fname" name="fname" placeholder="First Name"
								required="true" tabindex="1"></form:input>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span>
							<form:input type="text" name="lname" path="lname"
								placeholder="Last Name" required="true"
								class="form-control input-lg" tabindex="2"></form:input>
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
							<form:input type="text" name="email_id" path="emailid"
								class="form-control input-lg" required="true"
								placeholder="Email Id" tabindex="3"></form:input>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-earphone"></i>
							</span>
							<form:input type="text" name="mobile_no" path="mobile_no"
								placeholder="Mobile Number" required="true"
								class="form-control input-lg" tabindex="4"></form:input>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<form:textarea class="form-control input-lg" path="message"
							name="message" placeholder="Enter Your Message" required="true"
							tabindex="5"></form:textarea>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-offset-4">
					<div class="col-md-4">
						<div class="form-group" >
							<a href=""> <input type="submit"
								class="btn btn-success btn-block btn-lg" tabindex="6"
								value="Submit">
							</a>
						</div>
					</div>
				</div>


			</div>
		</form:form>



	</div>


</body>
</html>
