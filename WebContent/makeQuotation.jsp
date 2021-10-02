<%@page import="helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="entities.Buyer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	int quotatioon_id = Integer.parseInt(request.getParameter("id"));
%>






<!-- //fatching  quotation request -->
<%
	QuotationDao quotationDao = new QuotationDao();
QuotationRequest quotationRequest = (QuotationRequest) quotationDao.getQuotationRequestsByQuotationID(quotatioon_id);
%>

<!-- fatching vendor object -->
<%
	VendorDao vendorDao = new VendorDao();
Vendor vendor = (Vendor) vendorDao.getVendorByID(quotationRequest.getVendor_id());
%>

<%
	BuyerDao buyerDao = new BuyerDao();
Buyer buyer = buyerDao.getBuyerByID(quotationRequest.getBuyer_id());
%>

<%
	ProductDao productDao = new ProductDao();
Product product = productDao.getProductsByProductID(quotationRequest.getProduct_id());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quotation</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">

</head>
<body>
	<%@include file="vendor_navbar.jsp"%>



	<div class="">
		<div class="row border">

			<div class="col-md-10 border">


				<div class="border mt-3 mb-3 container">

					<div class="row border-bottom text-center">
						<h4 class="text-secondary">Sales Quotation</h4>
					</div>
					<!-- header of quotation -->
					<div class="row border-bottom mb-2">

						<div class="col-md-8 text-danger mt-3">
							<h2
								style="text-transform: capitalize; font-weight: bold; font-family: monospace;">
								<%=vendor.getCompany()%>
							</h2>

						</div>
						<div class="col-md-4 " style="font-style: italic;">

							<table>
								<tr>

									<td><h6>Email -</h6></td>
									<td><h6>
											<%=vendor.getEmail()%>
										</h6></td>
								</tr>





								<tr>
									<td><h6>City -</h6></td>
									<td><h6>
											<%=vendor.getCity()%>
										</h6></td>
								</tr>

								<tr>
									<td><h6>Contact -</h6></td>
									<td><h6>
											<%=vendor.getMobile()%>
										</h6></td>
								</tr>


							</table>

						</div>
					</div>


					<div class="row mb-1 border-bottom">

						<div class="col-md-6">

							<h4 style="">To :</h4>
							<table>


								<tr>

									<td><h6
											style="text-transform: capitalize; font-style: italic;">
											<%=buyer.getCompany()%>
											,
										</h6></td>
								</tr>
								<tr>

									<td><h6
											style="text-transform: capitalize; font-style: italic;">
											<%=buyer.getCity()%>
											,
											<%=buyer.getState()%>
										</h6></td>

								</tr>

								<tr>

									<td><h6
											style="text-transform: capitalize; font-style: italic;">
											<%=buyer.getMobile()%>
										</h6></td>

								</tr>

							</table>
						</div>

						<div class="col-md-6 border mt-1 mb-2 ">

							<div>
								<table>
									<tr>
										<td style="text-transform: capitalize;">Issued date:</td>
										<td id="today"></td>
									</tr>
									<tr>
										<td>Buyer Name :</td>
										<td style="text-transform: capitalize;"><%=buyer.getName()%></td>
									</tr>

									<tr>
										<td style="text-transform: capitalize;">Quotation valid
											until :</td>
										<td id="after3days"></td>
										<td style="font-weight: bold; font-style: italic;">before
											10:00 PM</td>
									</tr>
									<tr>
										<td>Prepared By :</td>
										<td style="text-transform: capitalize;"><%=vendor.getName()%></td>
									</tr>
								</table>
							</div>







						</div>
					</div>


					<!-- table -->
					<div class="row text-center">
						<table class="table border">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Serial</th>
									<th scope="col">Description</th>
									<th scope="col">Unit Price</th>
									<th scope="col">Quantity</th>
									
									<th scope="col">Wholesale Unit Price</th>
									<th scope="col">Amount</th>
								</tr>
							</thead>


							<tbody>
								<tr class="border">
									<th scope="row">1</th>
									<td class="border"><h6><%=product.getProduct_name()%></h6></td>


									
									<td class="border"><h6>
											&#x20b9;<%=(product.getProduct_price())%></h6></td>
									
									<td class="border"><h6><%=quotationRequest.getQuantity()%>
										</h6></td>
									<td class="border">

										<table>

											<tr>
												<td>&#x20b9;</td>
												<td><input class="form-control input-sm" type="number"
													name="wholesale_price" required="required"
													placeholder="Wholesale price of product" id="myInput"></td>
											</tr>

										</table>
									</td>
									<td class="border"><h6 id="totalAmount"></h6></td>
								</tr>



								<tr>
									<th scope="row">2</th>
									<td class="border"></td>
									<td class="border"></td>
									<td class="border"></td>
									<td class="border"></td>
									<td class="border"></td>
								</tr>

								<tr>
									<th scope="row">3</th>
									<td class="border"></td>
									<td class="border"></td>
									<td class="border"></td>
									<td class="border"></td>
									<td class="border"></td>
								</tr>

								<tr>
									<th scope="row">4</th>
									<td class="border"></td>
									<td class="border"></td>
									<td class="border"></td>
									<td class="border"></td>
									<td class="border"></td>
								</tr>

								<tr>
									<th scope="row">5</th>
									<td class="border"></td>
									<td class="border"></td>
									<td class="border"></td>
									<td class="border"></td>
									<td class="border"></td>
								</tr>
								<tr>
									<th scope="row"></th>
									<td></td>
									<td></td>
									<td></td>
									<td class="border"><h6
											style="font-weight: bold; text-transform: uppercase;">Total
											Amount</h6></td>
									<td class="border"><h6 id="final_totalAmount"></h6></td>



								</tr>
								<tr>
									<th scope="row"></th>
									<td></td>
									<td></td>
									<td></td>
									<td class="border">
										<h6>SGST @ 9%</h6>
									</td>
									<td class="border" id="sgst"></td>

								</tr>

								<tr>
									<th scope="row"></th>
									<td></td>
									<td></td>
									<td></td>
									<td class="border"><h6>CGST @ 9%</h6></td>
									<td class="border"><h6 id="cgst"></h6></td>
								</tr>
								<tr>
									<th scope="row"></th>
									<td></td>
									<td></td>
									<td></td>
									<td class="border"><h6
											style="font-weight: bold; text-transform: uppercase;">Grand
											Total</h6></td>
									<td class="border"><h6 id="grant_total"></h6></td>
								</tr>


							</tbody>
						</table>
						<!-- input for get quantity total -->
						<input hidden="" placeholder="enter xyz" id="quantity"
							value="<%=quotationRequest.getQuantity()%>">


					</div>

					<div style="text-align: right;">

						<button class="btn btn-success btn-sm mb-1" type="button"
							onclick="calculatePrice()">Total Calculate</button>

						<button type="submit" class="btn btn-primary mb-1 btn-sm"
							onclick="UWP()" data-toggle="modal"
							data-target="#ConfirmSendQuotation">Send quotation</button>
					</div>
				</div>
			</div>

			<div class="col-md-2 border text-center">

				<button class="btn btn-primary  btn-sm mt-1 " data-toggle="modal"
					data-target="#readMessage">Read Message</button>
				<button class="btn btn-danger  btn-sm mt-1 ">Delete Request</button>


			</div>
		</div>

	</div>
	<!-- start modal for read message -->
	<!-- Modal -->
	<div class="modal fade" id="readMessage" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-success text-white">
					<h5>Message</h5>

					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
					<div class=" mb-2 text-secondary">
						<h6 style="text-transform: capitalize;">
							<%=buyer.getName()%>
							:
						</h6>
					</div>

					<div>

						<h5 class="text-primary"><%=quotationRequest.getMessage()%></h5>
					</div>
				</div>
				<div class="modal-footer text-center">
					<button type="button" class="btn btn-secondary btn-sm"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	<!-- end modal for read message -->

	<!-- end modal for confirm send quotation -->


	<div class="modal fade " id="ConfirmSendQuotation" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">

				<div class="modal-body">
					<form action="QuotationSendServlet" method="post">

						<div class="text-center">
							<input hidden="" name="quotation_id"
								value="<%=quotationRequest.getQuotation_id()%>"> <input
								hidden="" id="UWPofProduct" name="wholesale_price">

							<h6 class="text-secondary">Are you sure you want to send this quotation to buyer ?</h6>

							<button type="submit" class="btn btn-success btn-sm mt-1">Confirm</button>
							<button type="button" class="btn btn-secondary btn-sm mt-1"
								data-dismiss="modal">Cancel</button>
						</div>
					</form>



				</div>

			</div>
		</div>
	</div>

	<!-- end modal for confirm quotation -->

	<script type="text/javascript">
		function calculatePrice() {

			var total_wholesale_price = (document.getElementById("quantity").value)
					* (document.getElementById("myInput").value);

			var sgst = ((total_wholesale_price * 9) / 100)

			var cgst = ((total_wholesale_price * 9) / 100);
			var grant_total = sgst + cgst + total_wholesale_price;

			document.getElementById("totalAmount").innerHTML = total_wholesale_price
					+ "/-";

			document.getElementById("final_totalAmount").innerHTML = total_wholesale_price
					+ "/-";

			document.getElementById("sgst").innerHTML = sgst + "/-";

			document.getElementById("cgst").innerHTML = cgst + "/-";

			document.getElementById("grant_total").innerHTML = grant_total
					+ "/-";
		}
	</script>
	<script>
		var today = new Date();

		var date = today.getDate() + '-' + (today.getMonth() + 1) + '-'
				+ today.getFullYear();
		var after3DaysDate = new Date();

		after3DaysDate.setDate(after3DaysDate.getDate() + 3);

		var date1 = after3DaysDate.getDate() + '-'
				+ (after3DaysDate.getMonth() + 1) + '-'
				+ after3DaysDate.getFullYear();
		document.getElementById("today").innerHTML = date
		document.getElementById("after3days").innerHTML = date1
	</script>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"
		integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
		crossorigin="anonymous"></script>
	<script>
		function UWP() {
			wholesale_unit_price = (document.getElementById("myInput").value);

			$('#UWPofProduct').val(wholesale_unit_price);

		}
	</script>
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