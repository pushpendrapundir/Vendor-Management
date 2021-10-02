<%@page import="entities.Vendor"%>
<%@page import="entities.Buyer"%>
<%@page import="entities.Product"%>
<%@page import="vendordao.ProductDao"%>
<%@page import="vendordao.BuyerDao"%>
<%@page import="vendordao.VendorDao"%>
<%@page import="entities.QuotationSend"%>
<%@page import="vendordao.QuotationDao"%>
<%@page import="entities.Contract"%>
<%@page import="vendordao.ContractDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	int contract_id = Integer.parseInt(request.getParameter("id"));
%>


<%

ContractDao contractDao=new ContractDao();
Contract contract=(Contract)	contractDao.getSingleContractByContractID(contract_id);
%>


<!-- //fatching  quotation request -->
<%
	QuotationDao quotationDao = new QuotationDao();
QuotationSend quotationSend = (QuotationSend) quotationDao.getSendQuotationByQuotationID(contract.getQuotation_id());
%>

<!-- fatching vendor object -->
<%
	VendorDao vendorDao = new VendorDao();
Vendor vendor = (Vendor) vendorDao.getVendorByID(quotationSend.getVendor_id());
%>

<%
	BuyerDao buyerDao = new BuyerDao();
Buyer buyer = buyerDao.getBuyerByID(quotationSend.getBuyer_id());
%>

<%
	ProductDao productDao = new ProductDao();
Product product = productDao.getProductsByProductID(quotationSend.getProduct_id());
%>






<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contract</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
</head>
<body>
	<%@include file="vendor_navbar.jsp"%>


	<div class="container ">

		<div class="row border ">

			<form action="ContractAcceptServlet" method="post">
				<div class="col p-3">
					<div class="row text-center mt-1 border-bottom">
						<h4 class="text-secondary">SALES AGREEMENT</h4>
					</div>

					<div class="row">

						<div class="mt-3">
							<table>
<tr > 
							
							<h6>Contract id :<%= contract_id %></h6>
							</tr>
								<tr>

									<td>THIS SALES AGREEMENT(the "Agreement") dated this</td>

									<td style="font-weight: bold;">   <%=contract.getIssue_date() %></td>
								</tr>




								</tr>
							</table>
						</div>

						<div class="mt-2  ">

							<h6 style="font-weight: bold;">Seller(s):</h6>
							<%=vendor.getName().toUpperCase()%>
							located at
							<%=vendor.getCity().toUpperCase()%>
							<%=vendor.getState().toUpperCase()%>
							,and
						</div>

						<div class="mt-4  ">

							<h6 style="font-weight: bold;">Buyer(s):</h6>
							<%=buyer.getName().toUpperCase()%>
							located at
							<%=buyer.getCity().toUpperCase()%>
							<%=buyer.getState().toUpperCase()%>
						</div>


						<div class="form-group mt-2">
							<h6 style="font-weight: bold; text-decoration: underline;">Sale
								of Goods</h6>
							The seller will sell,transfer and deliver to the buyer the
							following goods <br>
							<h6 class="mt-2 text-secondary">From this date : </h6>
							<h6><%=contract.getStart_date() %></h6>
							<h6 class="mt-2 text-secondary">To this date : </h6>
							<h6><%=contract.getEnd_date() %></h6>



						</div>

						<div>

							<div class="row text-center">
								<table class="table border">
									<thead class="thead-dark">
										<tr>

											<th scope="col" class="border">Description</th>

											<th scope="col" class="border">Quantity</th>

											<th scope="col" class="border">Wholesale Unit Price</th>
											<th scope="col" class="border">SGST @ 9% + CGST @ 9%</th>

											<th scope="col" class="border">Amount</th>
										</tr>
									</thead>


									<tbody>
										<tr class="border">
											<td class="border"><h6><%=product.getProduct_name()%></h6></td>
											<td class="border"><h6><%=quotationSend.getQuantity()%>
												</h6></td>
											<td class="border">
												<h6>
													&#x20b9;<%=(quotationSend.getWholesale_price())%></h6>
											</td>

											<td><h6>
													&#x20b9;<%=((((quotationSend.getQuantity()) * (quotationSend.getWholesale_price()) * 9) / 100) * 2)%></h6>
											</td>


											<td class="border"><h6>
													&#x20b9;<%=((((quotationSend.getQuantity()) * (quotationSend.getWholesale_price()) * 9) / 100) * 2)
		+ (quotationSend.getQuantity()) * (quotationSend.getWholesale_price())%></h6></td>
										</tr>
										<tr>
											<td class="border"></td>
											<td class="border"></td>
											<td class="border"></td>
											<td class="border"></td>
											<td class="border"></td>

										</tr>

										<tr>

											<td class="border"></td>
											<td class="border"></td>
											<td class="border"></td>
											<td class="border"></td>
											<td class="border"></td>

										</tr>

										<tr>

											<td class="border"></td>
											<td class="border"></td>
											<td class="border"></td>
											<td class="border"></td>
											<td class="border"></td>

										</tr>

										<tr>

											<td class="border"></td>
											<td class="border"></td>
											<td class="border"></td>
											<td class="border" style="font-weight: bold;">Total
												Amount</td>
											<td class="border" style="font-weight: bold;">&#x20b9;<%=((((quotationSend.getQuantity()) * (quotationSend.getWholesale_price()) * 9) / 100) * 2)
		+ (quotationSend.getQuantity()) * (quotationSend.getWholesale_price())%></td>

										</tr>



									</tbody>
								</table>



							</div>


							<div class=" form-group">
								<h6 style="font-weight: bold; text-decoration: underline;">Sales
									Agreement Clause:</h6>

								<h6><%=contract.getClause() %></h6>
					</textarea>
							</div>

							<div class="text-center">

								<input hidden="" value="<%=contract.getContract_id()%>"
									name="contract_id">

								<button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#ConfirmAcceptContract">Accept
									Contract Request</button>
								<button class="btn btn-danger btn-sm mt-1 "
							type="submit">Reject</button>



								<!-- end modal for confirm send contract request -->


								<div class="modal fade " id="ConfirmAcceptContract"
									tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog modal-sm" role="document">
										<div class="modal-content">

											<div class="modal-body">
												<form >

													<div class="text-center">


														<h6 class="text-secondary">Are you sure you want to
															Accept this agreement ?</h6>

														<button type="submit" class="btn btn-success btn-sm mt-1">Confirm</button>
														<button type="button"
															class="btn btn-secondary btn-sm mt-1"
															data-dismiss="modal">Cancel</button>
													</div>
												</form>



											</div>

										</div>
									</div>
								</div>

								<!-- end modal for confirm Send contract request -->





							</div>
						</div>

					</div>

				</div>


			</form>



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
</body>
</html>