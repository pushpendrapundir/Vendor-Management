<%@page import="entities.Vendor"%>
<%@page import="vendordao.VendorDao"%>
<%@page import="helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%int id = Integer.parseInt(request.getParameter("id")); %>


<%ConnectionProvider cp=new ConnectionProvider();
VendorDao vd=new VendorDao();
Vendor vendor=null;
vendor=(Vendor)vd.getVendorByID(id);
%>
	
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
	<div class="container">
		<div class="text-center bg-warning">
			<h3>Edit your profile carefully!!!</h3>
		</div>
		
	

		<div>

			<form action="Update_vendor" method="post">
			<div class="container px-4">
				<div class="row">
					<div class="col">
						<div class="p-3 border bg-gray">
							<table class="table">
								<thead>

								</thead>
								<tbody>
									<tr>
										<th scope="row">Id</th>
										<td><%=vendor.getId() %></td>

									</tr>

									<tr>
										<th scope="row">Name</th>
										<td><input name="vendor_name" value="<%=vendor.getName() %>"></td>

									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><input name="vendor_email" value="<%=vendor.getEmail() %>"></td>

									</tr>
									
									<tr>
										<th scope="row">Pincode</th>
										<td><input name="vendor_pincode" value="<%=vendor.getPincode()%>"></td>

									</tr>
										<tr>
											<th scope="row">City</th>
											<td><input name="vendor_city" value="<%=vendor.getCity() %>"></td>
										</tr>
									</tbody>
							</table>
						</div>
					</div>
					<div class="col">
						<div class="p-3 border bg-gray"><table class="table">
								<thead>

								</thead>
								<tbody>
									<tr>
										<th scope="row">State</th>
										<td><input name="vendor_state" value="<%=vendor.getState()  %>"></td>

									</tr>

									<tr>
										<th scope="row">Company</th>
										<td><input name="vendor_company" value="<%= vendor.getCompany() %>"></td>

									</tr>
									<tr>
										<th scope="row">Mobile</th>
										<td><input type="number" name="vendor_mobile" value="<%= vendor.getMobile() %>"></td>

									</tr>
									<tr>
										<th scope="row">GST Number</th>
										<td><input name="vendor_gstnumber" value="<%= vendor.getGstnumber() %>"></td>

									</tr>


								</tbody>
							</table></div>
					</div>
				</div>
			</div>
			
			<div class="text-center">
			<button class="btn btn-success" type="submit">Update</button>
			<button class="btn btn-warning" type="reset">Reset</button>
			<a class="btn btn-secondary" type="reset" href="vendor_home.jsp" >Cancel</a>
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