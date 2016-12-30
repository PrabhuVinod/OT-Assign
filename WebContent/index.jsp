<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello World</title>
<style type="text/css">
.hide {
	display: none;
}

.login_content {
	padding-top: 25px;
	padding-bottom: 25px;
}

.register_content {
	padding-top: 25px;
	padding-bottom: 25px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container well">
		<div class="row">
			<div class="col-md-6 tabs login_tab">
				<h1>Login</h1>
			</div>
			<div class="col-md-6 tabs register_tab">
				<h1>Register</h1>
			</div>
			<div class="col-md-6 col-md-offset-3">
				<div class="login_content">
					<form action="CheckLogin" method="POST">
						<div class="form-group">
							<input type="text" name="username" class="form-control"
								placeholder="Username">
						</div>
						<div class="form-group">
							<input type="password" name="password" class="form-control"
								placeholder="Password">
						</div>
						<div class="form-group">
							<button type="submit" class="form-control btn btn-primary">Login</button>
						</div>
					</form>
				</div>
				<div class="register_content hide">
					<form action="SaveUser" method="POST">
						<div class="form-group">
							<input type="text" name="username" class="form-control"
								placeholder="Username">
						</div>
						<div class="form-group">
							<input type="password" name="password" class="form-control"
								placeholder="Password">
						</div>
						<div class="form-group">
							<input type="password" name="confirm_password"
								class="form-control" placeholder="Confirm Password">
						</div>
						<div class="form-group">
							<input type="text" name="firstname" class="form-control"
								placeholder="First Name">
						</div>
						<div class="form-group">
							<input type="text" name="lastname" class="form-control"
								placeholder="Last Name">
						</div>
						<div class="form-group">
							<input type="email" name="email" class="form-control"
								placeholder="Email">
						</div>
						<div class="form-group">
							<input type="number" name="age" class="form-control"
								placeholder="Age">
						</div>
						<div class="form-group">
							<input type="text" name="mobile" class="form-control"
								placeholder="Mobile Number">
						</div>
						<div class="form-group">
							<textarea rows="4" cols="15" name="address" class="form-control"
								placeholder="Address"></textarea>
						</div>
						<div class="form-group">
							<button type="submit" class="form-control btn btn-primary">Register</button>
						</div>
					</form>
				</div>

			</div>

		</div>

	</div>
	<script type="text/javascript">
		$(".login_tab").click(function(){
			$(".register_content").hide();
			$(".login_content").fadeIn();
			});
		$(".register_tab").click(function(){
			$(".login_content").hide();
			$(".register_content").removeClass("hide");
			$(".register_content").fadeIn();
		});
	</script>
</body>
</html>