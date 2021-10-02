<%@page import="entities.Product"%>
<%@page import="vendordao.ProductDao"%>
<%@page import="entities.Buyer"%>
<%@page import="vendordao.BuyerDao"%>
<%@page import="vendordao.VendorDao"%>
<%@page import="entities.Vendor"%>
<%@page import="vendordao.QuotationDao"%>
<%@page import="entities.QuotationSend"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	int quotatioon_id = Integer.parseInt(request.getParameter("id"));
%>


<!-- //fatching  quotation request -->
<%
	QuotationDao quotationDao = new QuotationDao();
QuotationSend quotationSend = (QuotationSend) quotationDao.getSendQuotationByQuotationID(quotatioon_id);
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
<title>Quotation</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">

</head>
<body>

	<%@include file="buyer_navbar.jsp"%>

	<div class="">
		<div class="row border">

			<div class="col-md-10 border">


				<div class="border mt-3 mb-3 container">

					<div class="row border-bottom text-center">
						<h4 class="text-secondary">Sales Quotation</h4>
					</div>
					
					<h6>Quotation ID :<%=quotatioon_id %></h6>
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
										<td><%=quotationSend.getIssue_date()%></td>
									</tr>
									<tr>
										<td>Buyer Name :</td>
										<td style="text-transform: capitalize;"><%=buyer.getName()%></td>
									</tr>

									<tr>
										<td style="text-transform: capitalize;">Quotation valid
											until :</td>
										<td><%=quotationSend.getValid_date()%></td>
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


									<td class="border"><h6><%=quotationSend.getQuantity()%>
										</h6></td>
									<td class="border">
										<h6>
											&#x20b9;<%=(quotationSend.getWholesale_price())%></h6>

									</td>
									<td class="border"><h6>
											&#x20b9;<%=(quotationSend.getQuantity()) * (quotationSend.getWholesale_price())%></h6></td>
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
									<td class="border"><h6>
											&#x20b9;<%=(quotationSend.getQuantity()) * (quotationSend.getWholesale_price())%></h6></td>



								</tr>
								<tr>
									<th scope="row"></th>
									<td></td>
									<td></td>
									<td></td>
									<td class="border">
										<h6>SGST @ 9%</h6>
									</td>
									<td class="border">
										<h6>
											&#x20b9;<%=((quotationSend.getQuantity()) * (quotationSend.getWholesale_price()) * 9) / 100%></h6>
									</td>

								</tr>

								<tr>
									<th scope="row"></th>
									<td></td>
									<td></td>
									<td></td>
									<td class="border"><h6>CGST @ 9%</h6></td>
									<td class="border"><h6>
											&#x20b9;<%=((quotationSend.getQuantity()) * (quotationSend.getWholesale_price()) * 9) / 100%></h6>
									</td>
								</tr>
								<tr>
									<th scope="row"></th>
									<td></td>
									<td></td>
									<td></td>
									<td class="border"><h6
											style="font-weight: bold; text-transform: uppercase;">Grand
											Total</h6></td>
									<td class="border">


										<h6>
											&#x20b9;<%=((((quotationSend.getQuantity()) * (quotationSend.getWholesale_price()) * 9) / 100) * 2)
		+ (quotationSend.getQuantity()) * (quotationSend.getWholesale_price())%></h6>







									</td>
								</tr>


							</tbody>
						</table>
						<!-- input for get quantity total -->
						<input hidden="" placeholder="enter xyz" id="quantity"
							value="<%=quotationSend.getQuantity()%>">


					</div>

					<div style="text-align: right;"></div>
				</div>
			</div>

			<div class="col-md-2 ">

				<div class="form-group">


					<h6 class="text-secondary form-control mt-1 text-center" style="font-weight: bolder;">Do you want to approve this
						quotation</h6>

					

						<a href="makecontract.jsp?id=<%=quotatioon_id %>" class=" form-control btn btn-primary  btn-sm "
							type="submit">Approve and make contract</a>

					


					<form action="RejectQuotationSevlet">

						<button class="btn btn-danger form-control btn-sm mt-1 "
							type="submit">Reject</button>

					</form>
					<table>

						<tr>
							<td></td>
							<td></td>
						</tr>
					</table>











				</div>


			</div>
		</div>

	</div>

</body>
</html>