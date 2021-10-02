
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
</head>
<body>

	<%@include file="buyer_navbar.jsp"%>






































	<div class="container">

		<div class="row">

			<div class="col-md-2 border-0">
				<div class="card border-0" data-toggle="modal"
					data-target="#viewProductsModal">
					<div class="card-body text-center ">
						<img alt="users" class="text-center" style="max-width: 70px"
							src="images/searchproduct.png">

						<h6 class="text-uppercase text-center text-muted">Search</h6>
					</div>
				</div>
			</div>
			<div class="col-md-2 border-0">
				<div class="card border-0" data-toggle="modal"
					data-target="#viewProductsModal">
					<div class="card-body text-center ">
						<img alt="users" class="text-center" style="max-width: 70px"
							src="images/favourite.png">

						<h6 class="text-uppercase text-center text-muted">Favourites</h6>
					</div>
				</div>
			</div>
			<div class="col-md-2 border-0">
				<div class="card border-0" data-toggle="modal"
					data-target="#viewProductsModal">
					<div class="card-body text-center ">
						<img alt="users" class="text-center" style="max-width: 70px"
							src="images/order (1).png">

						<h6 class="text-uppercase text-center text-muted">Orders</h6>
					</div>
				</div>
			</div>
			<div class="col-md-2 border-0">
				<div class="card border-0" data-toggle="modal"
					data-target="#viewProductsModal">
					<div class="card-body text-center ">
						<img alt="users" class="text-center" style="max-width: 70px"
							src="images/requestquotaton.png">

						<h6 class="text-uppercase text-center text-muted">Request</h6>
					</div>
				</div>
			</div>
			<div class="col-md-2 border-0">
				<div class="card border-0" data-toggle="modal"
					data-target="#viewProductsModal">
					<div class="card-body text-center ">
						<img alt="users" class="text-center" style="max-width: 70px"
							src="images/invoice.jpg">

						<h6 class="text-uppercase text-center text-muted">Quotation</h6>
					</div>
				</div>
			</div>
			<div class="col-md-2 border-0">
				<div class="card border-0" data-toggle="modal"
					data-target="#viewProductsModal">
					<div class="card-body text-center "></div>
				</div>
			</div>
		</div>
	</div>
	<!-- modal -->

	<div class="modal fade" id="viewProductsModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-secondary text-white">
					<h5 class="modal-title " id="exampleModalLabel">Your Product</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
					<div class="modal-body text-center" style="text-align: left;">
					</div>
				</div>
			</div>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>