<%@page import="helper.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="col-md-4 offset-md-4">

			<div class="card">
				<div class="card-header text-center bg-warning">LOGIN AS BUYER</div>

				<div>

					<%
						Message message = (Message) session.getAttribute("message");
					if (message != null) {
					%>

					<div class="alert <%=message.getCssclass()%>" role="alert"><%=message.getContant()%></div>

					<%
						session.removeAttribute("message");
					}
					%>
				</div>
				<div class="card-body">
					<form method="post" action="Buyer_login_servlet">
						<div class="mb-3">
							<label for="Email" class="form-label">Email address</label> <input
								name="buyer_email" type="email" class="form-control" id="Email">

						</div>
						<div class="mb-3">
							<label for="Password1" class="form-label">Password</label> <input
								name="buyer_password" type="password" class="form-control"
								id="Password1">
						</div>

						<button type="submit" class="btn btn-primary">Login</button>
					</form>

				</div>
				<div class="card-footer text-center  bg-secondary text-white">Message</div>

			</div>
		</div>

	</div>
</body>
</html>