<nav style="" class="navbar navbar-expand-lg navbar-light bg-success">
	<div class="container-fluid bg-success">
		<a class="navbar-brand text-white mx-2" href="buyer_home.jsp">Vendor
			Management System</a>
		<button class="navbar-toggler " type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item "><a
					class="nav-link  text-white btn btn-success btn-sm mx-2"
					aria-current="page" href="buyer_home.jsp"> HOME</a></li>
				<li class="nav-item">
					<button class="btn btn-success btn-sm mt-1 mb-1 mx-2"
						data-toggle="modal" data-target="#searchProductsModal">SEARCH</button>
				</li>

				<li class="nav-item">
					<button class="btn btn-success btn-sm mt-1 mb-1 mx-2"
						data-toggle="modal" data-target="#favProductsModal">FAVOURITES</button>
				</li>
				<li class="nav-item">
					<button class="btn btn-success btn-sm mt-1 mb-1 mx-2"
						data-toggle="modal" data-target="#ordersModal">ORDERS</button>
				</li>
				<li class="nav-item">
					<button class="btn btn-success btn-sm mt-1 mb-1 mx-2"
						data-toggle="modal" data-target="#requestsModal">QUOTATION
						REQUESTS</button>
				</li>
				<li class="nav-item">
					<button class="btn btn-success btn-sm mt-1 mb-1 mx-2"
						data-toggle="modal" data-target="#quotationsModal">RECEIVED
						QUOTATIONS</button>
				</li>
				<li class="nav-item">
					<button class="btn btn-success btn-sm mt-1 mb-1 mx-2"
						data-toggle="modal" data-target="#offersModal">SPECIAL
						OFFERS</button>
				</li>




			</ul>
			<ul class="navbar-nav mr-right ">
				<li>
					<button type="button" class="btn btn-success mx-2 btn-sm my-1"
						data-bs-toggle="modal" data-bs-target="#exampleModal">
						PROFILE</button>
				</li>


				<li class=""><a
					class="nav-item mx-2 btn btn-success btn-sm nav-link bg-warning"
					href="Buyer_logout_servlet">logout</a></li>
			</ul>

		</div>
	</div>
</nav>

<nav style="" class="navbar navbar-expand-lg bg-white ">
	<div class="container-fluid bg-white">

		<div  >
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 text-center">
				
				<li class="nav-item">
					<button class="btn btn-success btn-sm mt-1 mb-1 mx-2"
						data-toggle="modal" data-target="#contractRequestModal">CONTRACT
						REQUESTS</button>
				</li>
				<li class="nav-item">
					<button class="btn btn-success btn-sm mt-1 mb-1 mx-2"
						data-toggle="modal" data-target="#acceptContractModal">ACCEPTED
						CONTRACTS</button>
				</li>
				




			</ul>
			<!-- <ul class="navbar-nav mr-right ">

			</ul> -->

		</div>


	</div>

</nav>

