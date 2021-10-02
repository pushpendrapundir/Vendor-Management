
<%@page import="entities.Contract"%>
<%@page import="vendordao.ContractDao"%>
<%@page import="entities.QuotationRequest"%>
<%@page import="servlets.SendQuotation"%>
<%@page import="vendordao.VendorDao"%>
<%@page import="entities.QuotationSend"%>
<%@page import="vendordao.QuotationDao"%>
<%@page import="helper.Message"%>
<%@page import="entities.Buyer"%>

<%@page import="entities.Product"%>
<%@page import="vendordao.ProductDao"%>
<%@page import="categories.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vendordao.CategoryDao"%>
<%@page import="entities.Vendor"%>


<%
	Buyer buyer = (Buyer) session.getAttribute("current_buyer");
%>

<%
	if (buyer == null) {
	response.sendRedirect("buyer_login.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
</head>
<body>
	<%@include file="buyer_navbar.jsp"%>







	<div>
		<%
			Message message = (Message) session.getAttribute("message");
		if (message != null) {
		%>

		<div class=" text-center alert  <%=message.getCssclass()%>"
			role="alert">
			<%=message.getContant()%>

		</div>

		<%
			session.removeAttribute("message");
		}
		%>
	</div>
	<div class="container">

		<!-- <div class="row">

			<div class="col-md-2 border-0">
				<div class="card border-0" data-toggle="modal"
					data-target="#searchProductsModal">
					<div class="card-body border border-success  text-center " style="">
						<img alt="users" class="text-center " style="max-width: 70px"
							src="images/searchproduct.png">

						<h6 class="text-uppercase mt-1 text-center text-muted">Search</h6>
					</div>
				</div>
			</div>
			<div class="col-md-2 border-0">
				<div class="card border-0" data-toggle="modal"
					data-target="#favProductsModal">
					<div class="card-body border border-success text-center ">
						<img alt="users" class="text-center" style="max-width: 70px"
							src="images/favourite.png">

						<h6 class="text-uppercase mt-1 text-center text-muted">Favourites</h6>
					</div>
				</div>
			</div>
			<div class="col-md-2 border-0">
				<div class="card border-0" data-toggle="modal"
					data-target="#ordersModal">
					<div class="card-body border border-success text-center ">
						<img alt="users" class="text-center" style="max-width: 70px"
							src="images/order (1).png">

						<h6 class="text-uppercase mt-1 text-center text-muted">Orders</h6>
					</div>
				</div>
			</div>
			<div class="col-md-2 border-0">
				<div class="card border-0" data-toggle="modal"
					data-target="#requestsModal">
					<div class="card-body border border-success text-center ">
						<img alt="users" class="text-center" style="max-width: 70px"
							src="images/requestquotaton.png">

						<h6 class="text-uppercase  mt-1 text-center text-muted">Requests</h6>
					</div>
				</div>
			</div>
			<div class="col-md-2 border-0">
				<div class="card border-0" data-toggle="modal"
					data-target="#quotationsModal">
					<div class="card-body border border-success text-center ">
						<img alt="users" class="text-center" style="max-width: 70px"
							src="images/invoice.jpg">

						<h6 class="text-uppercase mt-1 text-center text-muted">Quotations</h6>
					</div>
				</div>
			</div>
			<div class="col-md-2 border-0">
				<div class="card border-0" data-toggle="modal"
					data-target="#offersModal">
					<div class="card-body border border-success text-center ">

						<img alt="users" class="text-center" style="max-width: 70px"
							src="images/gift.png">

						<h6 class="text-uppercase text-center mt-1 text-muted">offers</h6>
					</div>
				</div>
			</div>
		</div> -->

		<!-- modal -->

		<!-- start search modal -->
		<div class="modal fade" id="searchProductsModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header bg-success text-white">
						<h5 class="modal-title " id="exampleModalLabel">Search
							Product Here</h5>
						<button type="button" class="btn-close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<div class="modal-body text-center" style="text-align: left;">

							<form class="form-inline form-group">
								<input class="form-control mr-sm-2" type="search"
									placeholder="Enter Product Name" aria-label="Search">
								<button class="btn btn-outline-success btn-sm mt-2"
									type="submit">Search</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- end search modal -->

		<!-- start fav modal -->
		<div class="modal fade" id="favProductsModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header bg-success text-white">
						<h5 class="modal-title " id="exampleModalLabel">Your
							Favourite Products</h5>
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

		<!-- end fav modal -->

		<!-- start orders modal -->
		<div class="modal fade" id="ordersModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header bg-success text-white">
						<h5 class="modal-title " id="exampleModalLabel">Your Orders</h5>
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

		<!-- end orders modal -->

		<!-- start send requests modal -->
		<%
			QuotationDao qd = new QuotationDao();

		ArrayList<QuotationRequest> quotationRequests = (ArrayList<QuotationRequest>) qd
				.getQuotationRequestsByBuyerID(buyer.getId());
		%>



		<div class="modal fade" id="requestsModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header bg-success text-white">
						<h5 class="modal-title " id="exampleModalLabel">Sent
							Quotation Request</h5>
						<button type="button" class="btn-close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<%
							if (quotationRequests != null) {
						%>
						<%
							for (QuotationRequest quotationRequest : quotationRequests) {
						%>

						<%
							VendorDao vd1 = new VendorDao();

						String vendor_name = vd1.getVendorNameByVendorId(quotationRequest.getVendor_id());
						%>


						<div class="border-bottom ">
							<table>
								<tr>
									<td class="text-secondary">You send a quotation request to</td>
									<td style="text-transform: capitalize; font-weight: bold;"><%=vendor_name%></td>

									<td>for</td>
									<td class="" style="font-weight: bold;"><%=quotationRequest.getQuantity()%></td>
									<td class="text-secondary">unit items</td>
								</tr>
							</table>

							<div class="mt-2 mb-2">





								<button class="btn btn-danger btn-sm  ">Cancel Request</button>
							</div>
						</div>
						<%
							}
						}
						%>
						</td>
					</div>
				</div>
			</div>
		</div>

		<!-- end requests modal -->

		<!-- start received quotations modal -->

		<%
			//QuotationDao qd = new QuotationDao();

		ArrayList<QuotationSend> quotationSends = (ArrayList<QuotationSend>) qd.getSendQuotationByBuyerID(buyer.getId());
		%>



		<div class="modal fade" id="quotationsModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header bg-success text-white">
						<h5 class="modal-title " id="exampleModalLabel">Received
							Quotations</h5>
						<button type="button" class="btn-close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<%
							if (quotationSends != null) {
						%>
						<%
							for (QuotationSend quotationSend : quotationSends) {
						%>

						<%
							VendorDao vd1 = new VendorDao();

						String vendor_name = vd1.getVendorNameByVendorId(quotationSend.getVendor_id());
						%>


						<div class="border-bottom ">
							<table>
								<tr>
									<td style="text-transform: capitalize; font-weight: bold;"><%=vendor_name%></td>
									<td class="text-secondary">Make a quotation and sent to
										you.</td>

									<%-- <td class="" style="font-weight: bold;"><%=quotationSend.getQuantity()%></td>
								<td class="text-secondary">unit items</td> --%>
								</tr>
							</table>

							<div class="mt-2 mb-2">


								<a class="btn btn-primary btn-sm "
									href="viewquotation.jsp?id=<%=quotationSend.getQuotation_id()%>">View
									quotation</a>
								<button class="btn btn-danger btn-sm  ">delete</button>
							</div>
						</div>
						<%
							}
						}
						%>
						</td>
					</div>
				</div>
			</div>
		</div>

		<!-- end received quotations modal -->

		<!-- start offers modal -->
		<div class="modal fade" id="offersModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header bg-success text-white">
						<h5 class="modal-title " id="exampleModalLabel">Special
							Offers</h5>
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

		<!-- end offers modal -->
		<div class="row ">

			<div class="col-md-3  ">

				<ul class="list-group mt-2 mb-2">
					<li class="list-group-item active">Categories</li>
					<%
						CategoryDao cd = new CategoryDao();
					ArrayList<Category> categories = (ArrayList<Category>) cd.getAllCategories();

					if (categories != null) {
					%>




					<%
						for (Category category : categories)

					{
					%>
					<li class="list-group-item" style="text-transform: capitalize;"><%=category.getCategory()%></li>

					<%
						}
					}
					%>

				</ul>

			</div>

			<div class="col-md-9  ">
				<div class="">
					<%
						ProductDao pd = new ProductDao();
					ArrayList<Product> products = (ArrayList<Product>) pd.getAllProduct();
					if (products != null) {
					%>
					<div class="mt-2  ">
						<%
							for (Product product : products)

						{
						%>

						<div class="card mt-2 borde">
							<div class="card-body">
								<div class="row">

									<div class="col-md-4  ">
										<div class="text-center mb-1">

											<div>
												<img style="max-width: 200px" class="mt-1"
													src="product_images/<%=product.getProduct_picture()%>">
												<br>

											</div>
											<div class="mt-3 mb-3 ">
												<button
													class="btn btn-secondary text-white btn-sm btn-outline-dark"
													data-toggle="modal" data-target="#moreImagesModel">View
													more images...</button>

											</div>
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
											<h6 style="text-transform: capitalize;">
												Category :
												<%=product.getProduct_cat()%></h6>
										</div>
										<div>
											<a class="btn btn-primary text-white mt-1 btn-sm"
												href="product_detailes.jsp?id=<%=product.getProduct_id()%>&amp;id1=<%=buyer.getId()%>">View
												more Detailes...</a>
											<button class="btn btn-warning mt-1 btn-sm "
												onclick="addToFav()">Add to favourites</button>
										</div>

									</div>

									<div class="col-md-3  text-center ">
										<img class="mt-1" alt="users" style="max-width: 30px"
											src="images/ads 2.png">
									</div>
								</div>
							</div>
						</div>
					</div>

					<%
						}
					}
					%>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->


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
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">


					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" id="profile_details">
					<div class="container" align="center">
						<h5>Your Profile Details</h5>
					</div>
					<table class="table">
						<tbody>
							<tr>
								<th scope="row">User ID:</th>
								<td><%=buyer.getId()%></td>

							</tr>

							<tr>
								<th scope="row">User Name</th>
								<td><%=buyer.getName()%></td>

							</tr>
							<tr>
								<th scope="row">User Email:</th>
								<td><%=buyer.getEmail()%></td>

							</tr>

						</tbody>
					</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<a class="nav-link btn btn-warning"
						href="buyer_profile_update.jsp?id=<%=buyer.getId()%>">Edit
						Profile</a>

				</div>
			</div>
		</div>
	</div>

	<!-- end modal -->

	<%
		ContractDao contractDao = new ContractDao();

	ArrayList<Contract> contractRequests = (ArrayList<Contract>) contractDao.getContractRequestsByBuyerID(buyer.getId());
	%>

	<!-- start contract request modal -->
	<div class="modal fade" id="contractRequestModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-success text-white">
					<h5 class="modal-title " id="exampleModalLabel">Sent Contract
						Requests</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
					<%
						if (contractRequests != null) {
					%>
					<%
						for (Contract contractRequest : contractRequests) {
					%>

					<%
						VendorDao vd1 = new VendorDao();

					String vendor_name = vd1.getVendorNameByVendorId(contractRequest.getVendor_id());
					%>


					<div class="border-bottom ">
						<table>
							<tr>
								<td class="text-secondary">You send a Contract request to</td>
								<td style="text-transform: capitalize; font-weight: bold;"><%=vendor_name%></td>

								<td>for</td>
								<td class="" style="font-weight: bold;">
									<%%>
								</td>
								<td class="text-secondary"></td>
							</tr>
						</table>

						<div class="mt-2 mb-2">





							<button class="btn btn-danger btn-sm  ">Cancel Request</button>
						</div>
					</div>
					<%
						}
					}
					%>
					</td>
				</div>
			</div>
		</div>
	</div>

	<!-- end contract request modal -->


	<!-- start accept contract modal -->
	<%
		//ContractDao contractDao = new ContractDao();

	ArrayList<Contract> acceptedContracts = (ArrayList<Contract>) contractDao.getAcceptedContractByBuyerID(buyer.getId());
	%>

	<div class="modal fade" id="acceptContractModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-success text-white">
					<h5 class="modal-title " id="exampleModalLabel">Accepted
						Contract</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
					<%
						if (acceptedContracts != null) {
					%>
					<%
						for (Contract acceptedContract : acceptedContracts) {
					%>

					<%
						VendorDao vd1 = new VendorDao();

					String vendor_name = vd1.getVendorNameByVendorId(acceptedContract.getVendor_id());
					%>


					<div class="border-bottom ">
						<table>
							<tr>

								<td style="text-transform: capitalize; font-weight: bold;"><%=vendor_name%></td>
								
								<td> Accepted your contract</td>
								<td class="" style="font-weight: bold;">
									<%%>
								</td>
								<td class="text-secondary"></td>
							</tr>
						</table>

						<div class="mt-2 mb-2">



							<h6>Contract id :<%=acceptedContract.getContract_id() %></h6>

							<a class="btn btn-primary btn-sm "
								href="viewSendContract.jsp?id=<%=acceptedContract.getContract_id()%>">View
								Contract</a>
							<button class="btn btn-success btn-sm  ">Payment</button>
						</div>
					</div>
					<%
						}
					}
					%>
					</td>
				</div>
			</div>
		</div>
	</div>

	<!-- end accept contract modal -->







	<div class="comtainer"></div>
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
		function addToFav() {
			swal("Product has been added to favorites !");

		}
	</script>
</body>
</html>