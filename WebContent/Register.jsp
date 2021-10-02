<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
	<div class="text-center"> <h1>Register</h1> </div>

		<div class="container px-4">
			<div class="row gx-5">
				<div class="col text-center">
					
					<img src="images/vendor.png" style="max-width:300px;" class="img-fluid">
					<br><br>
					<a href="vendor_registration.jsp" class="btn btn-primary fs-3 ">Register as a Vendor</a>
				</div>
				<div class="col text-center">
					
					<img src="images/buyer.png" style="max-width:300px;" class="img-fluid">
					<br><br><a href="buyer_registration.jsp" class="btn btn-warning fs-3">Register as a buyer</a>
				</div>
			</div>
		</div>

	</div>
</body>
</html>