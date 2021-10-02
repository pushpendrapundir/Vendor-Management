<%@page import="entities.Buyer"%>
<%@page import="entities.Vendor"%>
<%@page import="vendordao.VendorDao"%>
<%@page import="entities.Product"%>
<%@page import="vendordao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
	int product_id = Integer.parseInt(request.getParameter("id"));
int buyer_id = Integer.parseInt(request.getParameter("id1"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
</head>
<body>
	<%@include file="buyer_navbar.jsp"%>


	<%
		ProductDao pd = new ProductDao();
	Product product = pd.getProductsByProductID(product_id);
	%>



	<%
		VendorDao vd = new VendorDao();
	Vendor vendor = vd.getVendorByID(product.getVendor_id());
	%>

	<div class="container">

		<div class="row mt-3">

			<div class="col-md-4 text-center">

				<div>



					<img style="max-width: 350px"
						src="product_images/<%=product.getProduct_picture()%>"> <br>
					<button class="btn btn-info mt-1 btn-sm btn-" data-toggle="modal"
						data-target="#moreImagesModel">View more images</button>
				</div>

			</div>

			<div class="col-md-6">
				<h5 class="">
					<%=product.getProduct_name()%>
					</h4>

					<div>

						<table>
							<tr>
								<td class="text-secondary">Price :</td>
								<td>
									<h3 class="text-danger">
										&#8377
										<%=product.getProduct_price()%>
									</h3>
								</td>
							</tr>

							<tr>
								<td class="text-secondary">Category :</td>
								<td class="text-primary" style="text-transform: capitalize;"><%=product.getProduct_cat()%></td>
							</tr>


						</table>

						<div class=" border-top mt-2">



							<h6 class="mt-2">Description about this product</h6>
							<p><%=product.getProduct_desc()%>
							</p>

						</div>
					</div>
					<div class="border-top mt-1">


						<table class="mt-2">
							<tr>

								<td><h6 class="text-secondary">Vendor Name :</h6></td>
								<td><h6 class="text-primary"
										style="text-transform: capitalize;">
										<%=vendor.getName()%>
									</h6></td>
							</tr>

							<tr>

								<td><h6 class="text-secondary">Comapany Name :</h6></td>
								<td><h6 class="text-success"
										style="text-transform: capitalize;">
										<%=vendor.getCompany()%>
									</h6></td>
							</tr>
						</table>
					</div>
			</div>

			<div class="col-md-2  border">

				<button class="btn btn-danger mt-3 btn-sm " data-toggle="modal"
					data-target="#quotationModel">Request for quotation</button>
				<button class="btn btn-success mt-1 btn-sm " onclick="addToFav()">Add
					to favourites</button>


			</div>




		</div>



		<!-- Modala -->

		<!-- modal start for quotation request -->

		<div class="modal fade" id="quotationModel" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header bg-success text-white">
						<h5 class="modal-title" id="exampleModalLabel">Quotation</h5>
						<button type="button" class="btn-close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body text-center">


						<form action="QuotationRequestServlet" method="post">

							<div class="form-group">
								<h6>How much quantity do you need</h6>
								<input required="required" type="number" class="form-control" name="quantity" placeholder="Enter quantity">

							</div>
							
							
							<div class="form-group">
							<textarea required="required" rows="5" cols="" class="form-control mt-1"
								name="message" placeholder="Type a message"></textarea>
						</div>
							
							
							

							<input hidden="hidden" class="form-control" name="product_id"
								value="<%=product.getProduct_id()%>"> <input
								hidden="hidden" class="form-control" name="vendor_id"
								value="<%=vendor.getId()%>"> <input hidden="hidden"
								class="form-control" name="buyer_id" value="<%=buyer_id%>">




							<div>
								<button type="submit" class="btn btn-primary btn-sm mt-2"
									onclick="quotation()">Send Quotation Request</button>
							</div>
						</form>











					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary btn-sm"
							data-dismiss="modal">Close</button>

					</div>
				</div>
			</div>
		</div>

		<!-- modal end for quotation request -->



		<!-- start more images model -->


		<div class="modal fade" id="moreImagesModel" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header bg-success text-white">
						<h5 class="modal-title" id="exampleModalLabel">Product Images</h5>
						<button type="button" class="btn-close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body text-center">

						<h5 class="text-secondary">There are no other images of this product</h5>
					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-secondary btn-sm "
							data-dismiss="modal">Close</button>

					</div>
				</div>
			</div>
		</div>

		<!-- end more images model -->

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
	<script type="text/javascript">
		function quotation() {

			swal("You have send a quotation request!",
					"You will get quotation soon!", "success");
		}

		function addToFav() {
			swal("Product has been added to favorites !");

		}
	</script>
</body>
</html>