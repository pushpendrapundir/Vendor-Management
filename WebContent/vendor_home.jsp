<%@page import="vendordao.ContractDao"%>
<%@page import="entities.Contract"%>
<%@page import="entities.QuotationSend"%>
<%@page import="servlets.SendQuotation"%>
<%@page import="helper.Message"%>
<%@page import="vendordao.BuyerDao"%>
<%@page import="vendordao.VendorDao"%>
<%@page import="servlets.Vendor_login_servlet"%>
<%@page import="entities.QuotationRequest"%>
<%@page import="vendordao.QuotationDao"%>
<%@page import="entities.Product"%>
<%@page import="vendordao.ProductDao"%>
<%@page import="categories.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vendordao.CategoryDao"%>
<%@page import="entities.Vendor"%>
<%
	Vendor vendor = (Vendor) session.getAttribute("current_vendor");
%>

<%
	if (vendor == null) {
	response.sendRedirect("vendor_login.jsp");
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
	<%@include file="vendor_navbar.jsp"%>

	<div>

		<%
			Message message = (Message) session.getAttribute("message");
		if (message != null) {
		%>

		<div class="  text-center alert <%=message.getCssclass()%>"
			role="alert"><%=message.getContant()%>
			</div>

		<%
			session.removeAttribute("message");
		}
		%>
	</div>


	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header ">


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
								<td><%=vendor.getId()%></td>

							</tr>

							<tr>
								<th scope="row">User Name</th>
								<td><%=vendor.getName()%></td>

							</tr>
							<tr>
								<th scope="row">User Email:</th>
								<td><%=vendor.getEmail()%></td>

							</tr>

						</tbody>
					</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>



					<a class="nav-link btn btn-warning"
						href="vendor_profile_update.jsp?id=<%=vendor.getId()%>">Edit
						Profile</a>

				</div>
			</div>
		</div>
	</div>





	<div class="container admin">


		<div class="container-fluid mt-1"></div>
		<!-- row 1 -->
		<div class="row mt-1">
			<!-- col 1 -->
			<div class="col-md-4 text-center">
				<!-- card 1 -->
				<div class="card">

					<div class="card-body">
						<img alt="users" style="max-width: 150px" src="images/order.png">
						
						<h1 class="text-uppercase text-muted">Orders</h1>
					</div>
				</div>

			</div>
			<!-- col 2 -->
			<div class="col-md-4 text-center">
				<!-- card 2 -->
				<div class="card" data-toggle="modal"
					data-target="#viewCategoriesModal">

					<div class="card-body">
						<img alt="users" style="max-width: 150px"
							src="images/categories.jpg">
						
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>

				<!-- START VIEW CATEGORIES MODEL -->

				<div class="modal fade " id="viewCategoriesModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header bg-secondary text-white">
								<h5 class="modal-title" id="exampleModalLabel">Your
									Categories</h5>

								<button type="button" class="btn-close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true"></span>
								</button>
							</div>
							<div class="modal-body" style="text-align: center;">


								<%
									CategoryDao cd = new CategoryDao();
								ArrayList<Category> categories = (ArrayList<Category>) cd.getCategoriesByID(vendor.getId());

								if (categories != null) {
								%>


								<table class="table">
									<thead>
										<tr>
											<th scope="col">Category ID</th>
											<th scope="col">Category Name</th>
											<th scope="col">Category Description</th>
											<th scope="col">Handle</th>
										</tr>
									</thead>
									<tbody>


										<%
											for (Category category : categories)

										{
										%>
										<tr>
											<th scope="row"><%=category.getCat_id()%></th>
											<td style="text-transform: capitalize;"><%=category.getCategory()%></td>
											<td><%=category.getCat_desc()%></td>
											<td><button class="btn btn-danger btn-sm">Delete</button>
												<button class="btn btn-warning btn-sm">Update</button></td>

										</tr>

										<%
											}
										}
										%>
									</tbody>
								</table>

							</div>

						</div>
					</div>
				</div>

				<!-- END VIEW CATEGORIES MODEL -->
			</div>
			<!-- col 3 -->
			<div class="col-md-4 text-center">
				<!-- card 1 -->
				<div class="card" data-toggle="modal"
					data-target="#viewProductsModal">

					<div class="card-body">
						<img alt="users" style="max-width: 150px"
							src="images/products.png">
						
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>

			</div>
		</div>
		<!-- row 2 -->
		<div class="row mt-1 text-center">
			<!-- col 1 -->
			<div class="col-md-4">
				<!-- card 1 -->
				<div class="card" data-toggle="modal"
					data-target="#addCategoriesModal">

					<div class="card-body">
						<img alt="users" style="max-width: 150px"
							src="images/add_categories.jpg">
						<h1 class="text-uppercase text-muted">Add Categories</h1>
					</div>
				</div>

			</div>
			<!-- col 2 -->
			<div class="col-md-4 text-center">
				<!-- card 2 -->
				<div class="card" data-toggle="modal"
					data-target="#addProductsModal">

					<div class="card-body">
						<img alt="users" style="max-width: 150px" src="images/buy.png">

						<h1 class="text-uppercase text-muted my-4">Add Product</h1>

					</div>
				</div>

			</div>
			<div class="col-md-4 text-center">
				<!-- card 2 -->
				<div class="card" data-toggle="modal" data-target="#QuotationModal">

					<div class="card-body">
						<img alt="users" style="max-width: 150px" src="images/request.png">
						<h1 class="text-uppercase text-muted">Quotation Request</h1>
					</div>
				</div>

			</div>

		</div>


		<!-- row 3 -->
		<div class="row mt-1">
			<!-- col 1 -->
			<div class="col-md-4 text-center">
				<!-- card 1 -->
				<div class="card" data-toggle="modal"
					data-target="#sentQuotationModal">

					<div class="card-body">
						<img alt="users" style="max-width: 150px" src="images/send.png">
						
						<h1 class="text-uppercase text-muted">Sent Quotation</h1>
					</div>
				</div>

			</div>

			<!-- start sent quotation model -->
<%
		QuotationDao quotationDao = new QuotationDao();
	ArrayList<QuotationSend> quotationSends = (ArrayList<QuotationSend>) quotationDao
			.getSendQuotationsByVendorID(vendor.getId());
	%>
			<!-- Modal -->
			<div class="modal fade" id="sentQuotationModal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header bg-secondary text-white">
							<h5 class="modal-title " id="exampleModalLabel">Sent Quotations</h5>
							<button type="button" class="btn-close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true"></span>
							</button>
						</div>
						<div class="modal-body">
					<%
						if ( quotationSends!= null) {
					%>
					<%
						for (QuotationSend quotationSend : quotationSends) {
					%>

					<%
						BuyerDao bd1 = new BuyerDao();

					String buyer_name = bd1.getBuyerNameByBuyerId(quotationSend.getBuyer_id());
					%>


					<div class="border-bottom ">
						<table>
							<tr>
								<td style="text-transform: capitalize; font-weight: bold;"><%=buyer_name%></td>
								<td class="text-secondary">
									for</td>

								<td class="" style="font-weight: bold;"><%=quotationSend.getQuantity()%></td>
								<td class="text-secondary">unit items</td>
							</tr>
						</table>

						<div class="mt-2 mb-2">


							<a class="btn btn-primary btn-sm "
								href="viewSendQuotation.jsp?id=<%=quotationSend.getQuotation_id()%>">View
								quotation</a>
							
						</div>
					</div>
					<%
						}
					}
					%>
					</td>
				</div>
						<div class="modal-footer" >
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							
						</div>
					</div>
				</div>
			</div>


			<!-- end sent quotation model -->


			<!-- col 2 -->
			<div class="col-md-4 text-center">
				<!-- card 2 -->
				<div class="card" data-toggle="modal" data-target="#contractRequestModal">

					<div class="card-body">
						<img alt="users" style="max-width: 150px"
							src="images/contract1.jpg">
						
						<h1 class="text-uppercase text-muted">Contract Requests</h1>
					</div>
				</div>
				
				
				




			</div>
			<!-- col 3 -->
			<div class="col-md-4 text-center">
				<!-- card 1 -->
				<div class="card" data-toggle="modal" data-target="#contractAcceptedModal">

					<div class="card-body">
						<img alt="users" style="max-width: 150px"
							src="images/agreement.png">
						
						<h1 class="text-uppercase text-muted">Accepted Contracts</h1>
					</div>
				</div>

			</div>
		</div>



	</div>

<!-- 
	contract request modal -->
<!-- Modal -->


<%
		ContractDao contractDao=new ContractDao();
	ArrayList<Contract> contractRequests = (ArrayList<Contract>) contractDao.getContractRequestsByVendorID(vendor.getId());
	%>
	
	
	
<div class="modal fade" id="contractRequestModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-secondary text-white">
        <h5 class="modal-title" id="exampleModalLabel">Contact Requests</h5>
        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
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
						BuyerDao bd1 = new BuyerDao();

					String buyer_name = bd1.getBuyerNameByBuyerId(contractRequest.getBuyer_id());
					%>


					<div class="border-bottom ">
						<table>
							<tr>
								<td style="text-transform: capitalize; font-weight: bold;"><%=buyer_name%></td>
								<td class="text-secondary">has sent you a contract request
									</td>

								<td class="" style="font-weight: bold;"></td>
								<td class="text-secondary"></td>
							</tr>
						</table>

						<div class="mt-2 mb-2">


							<a class="btn btn-primary btn-sm "
								href="viewContract.jsp?id=<%=contractRequest.getContract_id()%>">View
								Contract</a>
							<button class="btn btn-danger btn-sm  ">delete</button>
						</div>
					</div>
					<%
						}
					}
					%>
					</td>
				</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       
      </div>
    </div>
  </div>
</div>

	<!-- contract request modal end -->
	
	
	<!-- 
	Accepted contract  modal start -->
<!-- Modal -->

<%
		//ContractDao contractDao=new ContractDao();
	ArrayList<Contract> acceptedContracts = (ArrayList<Contract>) contractDao.getAcceptedContractsByVendorID( vendor.getId());
	%>
<div class="modal fade" id="contractAcceptedModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-secondary text-white">
        <h5 class="modal-title" id="exampleModalLabel">Accepted Contacts</h5>
        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
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
						BuyerDao bd1 = new BuyerDao();

					String buyer_name = bd1.getBuyerNameByBuyerId(acceptedContract.getBuyer_id());
					%>


					<div class="border-bottom ">
						<table>
							<tr>
							<td class="text-secondary">
									</td>
								<td style="text-transform: capitalize; font-weight: bold;"><%=buyer_name%></td>
								

								<td class="" style="font-weight: bold;"></td>
								<td class="text-secondary"></td>
							</tr>
						</table>

						<div class="mt-2 mb-2">


							<a class="btn btn-primary btn-sm "
								href="viewSendContract.jsp?id=<%=acceptedContract.getContract_id()%>">View
								Contract</a>
							<button class="btn btn-danger btn-sm  ">delete</button>
						</div>
					</div>
					<%
						}
					}
					%>
					</td>
				</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       
      </div>
    </div>
  </div>
</div>

	<!-- accepted contract modal end -->
	

	<!-- start add category modal -->

	<div class="modal fade " id="addCategoriesModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-secondary text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Categories</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
					<form action="Add_categories_servlet" method="post">

						<input hidden="" name="vendor_id" value="<%=vendor.getId()%>">

						<%-- <input type="hidden" name="vendor_id" value=" <%=vendor.getId()%> "> --%>
						<div class="form-group">


							<input class="form-control" name="category" type="text"
								placeholder="Enter Category Title"> <label
								class="mt-1 border-0 form-control text-primary">Enter
								Description about category in below text box:</label>
							<textarea rows="5" cols="" class="form-control mt-2"
								name="cat_desc"> </textarea>
						</div>
						<div class="text-center">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Add
								Category</button>
							<button type="reset" class="btn btn-danger">Reset</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>
	<!-- end of add category modal -->



	<!-- start quotation request model -->

	<%
		//QuotationDao quotationDao = new QuotationDao();
	ArrayList<QuotationRequest> quotationRequests = (ArrayList<QuotationRequest>) quotationDao
			.getQuotationRequestsByVendorID(vendor.getId());
	%>



	<div class="modal fade" id="QuotationModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg " role="document">
			<div class="modal-content">
				<div class="modal-header bg-secondary text-white">
					<h5 class="modal-title " id="exampleModalLabel">Quotation
						Request</h5>
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
						BuyerDao bd1 = new BuyerDao();

					String buyer_name = bd1.getBuyerNameByBuyerId(quotationRequest.getBuyer_id());
					%>


					<div class="border-bottom ">
						<table>
							<tr>
								<td style="text-transform: capitalize; font-weight: bold;"><%=buyer_name%></td>
								<td class="text-secondary">has sent you a quotation request
									for</td>

								<td class="" style="font-weight: bold;"><%=quotationRequest.getQuantity()%></td>
								<td class="text-secondary">unit items</td>
							</tr>
						</table>

						<div class="mt-2 mb-2">


							<a class="btn btn-primary btn-sm "
								href="makeQuotation.jsp?id=<%=quotationRequest.getQuotation_id()%>">Make
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
	
	<!-- end quotation request modal -->


	<!-- start add product modal -->
	<div class="modal fade" id="addProductsModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-secondary text-white">
					<h5 class="modal-title " id="exampleModalLabel">Add Your
						Product</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
					<form action="AddProductServlet" method="post"
						enctype="multipart/form-data">


						<div class="form-group">
							<input class="form-control" name="product_name" type="text"
								placeholder="Enter Product Name">
						</div>
						<div class="form-group">
							<textarea rows="5" cols="" class="form-control mt-1"
								name="product_desc" placeholder="Enter Product Description"></textarea>
						</div>
						<div class="form-group">
							<input class="form-control mt-1" name="product_price"
								placeholder="Enter Product Price" type="number">
						</div>
						<div class="form-group">
							<select class="form-control mt-1" name="product_cat">
								<option selected="selected" disabled="disabled">----
									Select product----</option>
								<%
									for (Category category : categories)

								{
								%>
								<option value=" <%=category.getCategory()%> ">
									<%=category.getCategory()%>
								</option>

								<%
									}
								%>




							</select>
						</div>


						<input hidden="" class="mt-1" name="vendor_id"
							value="<%=vendor.getId()%>">

						<div class="form-group">
							<label class="mt-1">Select Product Photo :</label> <input
								class="form-control" name="product_picture" " type="file">
						</div>
						<div class="text-center">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary"  >Add
								Product</button>
							<button type="reset" class="btn btn-danger">Reset</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>






	<!-- end of view product modal -->



	<!-- start add product modal -->
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


						<%
							ProductDao pd = new ProductDao();
						ArrayList<Product> products = (ArrayList<Product>) pd.getProductsByID(vendor.getId());
						if (products != null) {
						%>


						<table class="table">
							<thead>
								<tr>
									<th scope="col">Id</th>
									<th scople="col">Image</th>

									<th scope="col">Name</th>
									<th scope="col">Price</th>

								</tr>
							</thead>
							<tbody>


								<%
									for (Product product : products)

								{
								%>
								<tr>

									<th scope="row"><%=product.getProduct_id()%></th>
									<th><img style="max-width: 40px"
										src="product_images/<%=product.getProduct_picture()%>">
									</th>


									<td><%=product.getProduct_name()%></td>
									<td><%=product.getProduct_price()%></td>


								</tr>

								<%
									}
								}
								%>
							</tbody>
						</table>

					</div>


					<div class="card-footer text-left">
						<a href="vendor_product_details.jsp?id=<%=vendor.getId()%> "
							class="btn btn-success"> View All products in details </a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end of view product modal -->

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



</body>



</html>