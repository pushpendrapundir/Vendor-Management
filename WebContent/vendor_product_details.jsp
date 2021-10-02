<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="entities.Product"%>
<%@page import="vendordao.ProductDao"%>
<%@page import="java.util.ArrayList"%>

<%
	int Vendor_id = Integer.parseInt(request.getParameter("id"));
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
	<%@include file="vendor_navbar.jsp"%>


	<div>




		<%
			ProductDao pd = new ProductDao();
		ArrayList<Product> products = (ArrayList<Product>) pd.getProductsByID(Vendor_id);
		if (products != null) {
		%>


		<div class="mt-2 ">


			<%
				for (Product product : products)

			{
			%>

			<div class="card mt-2 border-0">



				<div class="card-body border-bottom">
					<div class="row">

						<div class="col-md-4 ">
							<div class="text-center mb-1">

								<div>



									<img style="max-width: 200px" class="mt-1"
										src="product_images/<%=product.getProduct_picture()%>">
									<br>

								</div>
								<div class="mt-3 mb-3 ">
									<button right" class="btn btn-info btn-sm" data-toggle="modal"
										data-target="#moreImagesModel">View more images...</button>
									<button right" class="btn btn-success btn-sm"
										data-toggle="modal" data-target="#addImagesModel">Add
										more images...</button>
								</div>



								<!-- model -->

								<!-- start more images model -->




								<!-- end more images model -->
							</div>
						</div>

						<div class="col-md-5">


							<div>
								<h5 class="text-secondary">
									<%=product.getProduct_name()%>
								</h5>
							</div>
							<div>

								<h2 class="text-success">
									&#8377

									<%=product.getProduct_price()%>/-



								</h2>


							</div>

							<div>
								<h6>
									Categories :
									<%=product.getProduct_cat()%></h6>
							</div>
							<div>


								<p>
									Description :
									<%=product.getProduct_desc()%>
								<p>
							</div>

						</div>

						<div class="col-md-3">

							<div style="text-align: right;">

								<button class="btn btn-danger btn-sm">Delete</button>
								<button class="btn btn-warning btn-sm">Update</button>
								</td>
							</div>

						</div>

					</div>


				</div>
			</div>



		</div>

		<%
			}
		}
		%>

		<!-- model -->

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

						<h5 class="text-secondary">There are no other images of this
							product</h5>
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


	<!-- add more images model -->


	<div class="modal fade" id="addImagesModel" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-success text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Images</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body text-center">

					<div class="form-group">
						<label class="mt-1">Select Product Photos :</label> <input
							class="form-control mt-3" name="product_picture" " type="file">
					</div>
					
					
					<button class="btn btn-primary btn-sm mt-2">Upload</button>
					<button class="btn btn-danger btn-sm mt-2">Cancel</button>
				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-secondary btn-sm "
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>

	<!-- end add images model -->
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