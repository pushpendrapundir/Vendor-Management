<%@page import="helper.ConnectionProvider"%>
<nav class="navbar navbar-expand-lg navbar-light bg-success">
	<div class="container-fluid bg-success">
		<a class="navbar-brand text-white " href="vendor_home.jsp">Vendor
			Management System</a>
		<button class="navbar-toggler " type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link  text-white btn btn-success btn-sm mx-2"
					aria-current="page" href="vendor_home.jsp">HOME</a></li>


			</ul>


			<ul class="navbar-nav mr-right ">
				<li>
					<button type="button" class="nav-link  text-white btn btn-success btn-sm mx-2"
						data-bs-toggle="modal" data-bs-target="#exampleModal">
						PROFILE</button>
				</li>


				<li class="nav-item "><a class="nav-link  btn btn-warning text-dark btn-sm mx-2 "
					href="Vendor_logout_servlet">logout</a></li>
			</ul>

		</div>
	</div>
</nav>