<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Check Out</title>


<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="/QUANLYHOACU/static/allUser/./css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="/QUANLYHOACU/static/allUser/./css/cart.css" />


<!-- Slick -->
<link type="text/css" rel="stylesheet"
	href="/QUANLYHOACU/static/allUser/./css/slick.css" />
<link type="text/css" rel="stylesheet"
	href="/QUANLYHOACU/static/allUser/./css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet"
	href="/QUANLYHOACU/static/allUser/./css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
	href="/QUANLYHOACU/static/allUser/./css/style.css" />

</head>

<body>
	<!-- HEADER -->
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
					<li><a href="#"><i class="fa fa-envelope-o"></i>
							email@email.com</a></li>
					<li><a href="#"><i class="fa fa-map-marker"></i> 1734
							Stonecoal Road</a></li>
				</ul>
				<ul class="header-links pull-right">
					<li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
					<li><a href="#"><i class="fa fa-user-o"></i> My Account</a></li>
				</ul>
			</div>
		</div>
		<!-- /TOP HEADER -->

		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<div class="col-md-3">
						<div class="header-logo">
							<a href="HomePage" class="logo"> <img
								src="/QUANLYHOACU/static/allUser/./image/logo4.png" alt=""
								width="153" height="70" border="0">
							</a>
						</div>
					</div>
					<!-- /LOGO -->

					<!-- SEARCH BAR -->
					<div class="col-md-6">
						<div class="header-search">
							<form>
								<select class="input-select">
									<option value="0">All Categories</option>
									<option value="1">Category 01</option>
									<option value="1">Category 02</option>
								</select> <input class="input" placeholder="Search here">
								<button class="search-btn">Search</button>
							</form>
						</div>
					</div>
					<!-- /SEARCH BAR -->

					<!-- ACCOUNT -->
					<div class="col-md-3 clearfix">
						<div class="header-ctn">
							<!-- Wishlist -->
							<div>
								<a href="#"> <i class="fa fa-heart-o"></i> <span>Your
										Wishlist</span>
									<div class="qty">2</div>
								</a>
							</div>
							<!-- /Wishlist -->

							<!-- Cart -->
							<div class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown"
									aria-expanded="true"> <i class="fa fa-shopping-cart"></i> <span>Your
										Cart</span>
									<div class="qty">3</div>
								</a>
								<div class="cart-dropdown">
									<div class="cart-list">
										<div class="product-widget">
											<div class="product-img">
												<img src="/QUANLYHOACU/static/allUser/./image/product01.png"
													alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name">
													<a href="#">product name goes here</a>
												</h3>
												<h4 class="product-price">
													<span class="qty">1x</span>$980.00
												</h4>
											</div>
											<button class="delete">
												<i class="fa fa-close"></i>
											</button>
										</div>

										<div class="product-widget">
											<div class="product-img">
												<img src="/QUANLYHOACU/static/allUser/./image/product02.png"
													alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name">
													<a href="#">product name goes here</a>
												</h3>
												<h4 class="product-price">
													<span class="qty">3x</span>$980.00
												</h4>
											</div>
											<button class="delete">
												<i class="fa fa-close"></i>
											</button>
										</div>
									</div>
									<div class="cart-summary">
										<small>3 Item(s) selected</small>
										<h5>SUBTOTAL: $2940.00</h5>
									</div>
									<div class="cart-btns">
										<a href="#">View Cart</a> <a href="#">Checkout <i
											class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
							</div>
							<!-- /Cart -->

							<!-- Menu Toogle -->
							<div class="menu-toggle">
								<a href="#"> <i class="fa fa-bars"></i> <span>Menu</span>
								</a>
							</div>
							<!-- /Menu Toogle -->
						</div>
					</div>
					<!-- /ACCOUNT -->
				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- /MAIN HEADER -->
	</header>
	<!-- /HEADER -->

	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">Cart</h3>
					<ul class="breadcrumb-tree">
						<li><a href="#">Home</a></li>
						<li class="active">Cart</li>
					</ul>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /BREADCRUMB -->

	<!-- SECTION -->
	<div class="page-content">
		<div class="holder mt-0">
			<div class="container">
				<h1 class="text-center">Shopping Cart</h1>
				<div class="row">
					<div class="col-md-8">
						<div class="cart-table">
							<div class="cart-table-prd">
								<div class="cart-table-prd-image">
									<a href="#"><img
										src="https://dummyimage.com/100x130/529bfa/ffffff.png"
										class="img-fluid" alt=""></a>
								</div>
								<div class="cart-table-prd-name">
									<h5>
										<a href="#">canverse</a>
									</h5>
									<h2>
										<a href="#">Checkered shirt</a>
									</h2>
								</div>
								<div class="cart-table-prd-qty">
									<span>qty:</span> <b>1</b>
								</div>
								<div class="cart-table-prd-price">
									<span>price:</span> <b>$ 75.00</b>
								</div>
								<div class="cart-table-prd-action">
									<a href="#" class="fa fa-trash" aria-hidden="true"></a> <a
										href="#" class="fa fa-pencil" aria-hidden="true"></a>
								</div>
							</div>
							<div class="cart-table-prd">
								<div class="cart-table-prd-image">
									<a href="#"><img
										src="https://dummyimage.com/100x130/529bfa/ffffff.png"
										class="img-fluid" alt=""></a>
								</div>
								<div class="cart-table-prd-name">
									<h5>
										<a href="#">canverse</a>
									</h5>
									<h2>
										<a href="#">Long top with print</a>
									</h2>
								</div>
								<div class="cart-table-prd-qty">
									<span>qty:</span> <b>1</b>
								</div>
								<div class="cart-table-prd-price">
									<span>price:</span> <b>$ 20.00</b>
								</div>
								<div class="cart-table-prd-action">
									<a href="#" class="fa fa-trash" aria-hidden="true"></a> <a
										href="#" class="fa fa-pencil" aria-hidden="true"></a>
								</div>
							</div>
							<div class="cart-table-prd">
								<div class="cart-table-prd-image">
									<a href="#"><img
										src="https://dummyimage.com/100x130/529bfa/ffffff.png"
										class="img-fluid" alt=""></a>
								</div>
								<div class="cart-table-prd-name">
									<h5>
										<a href="#">saucany</a>
									</h5>
									<h2>
										<a href="#">Knitted sweater</a>
									</h2>
								</div>
								<div class="cart-table-prd-qty">
									<span>qty:</span> <b>1</b>
								</div>
								<div class="cart-table-prd-price">
									<span>price:</span> <b>$ 199.00</b>
								</div>
								<div class="cart-table-prd-action">
									<a href="#" class="fa fa-trash" aria-hidden="true"></a> <a
										href="#" class="fa fa-pencil" aria-hidden="true"></a>
								</div>
							</div>
							<div class="cart-table-total">
								<div class="row">
									<div class="col-sm">
										<a href="#" class="btn btn--alt"><i class="icon-cross"></i><span>clear
												shopping cart</span></a> <a href="#" class="btn btn--grey"><i
											class="icon-repeat"></i><span>update cart</span></a>
									</div>
									<div class="col-sm-auto">
										<a href="#" class="btn"><i class="icon-angle-left"></i><span>continue
												shopping</span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="sidebar-block">
							<div class="card-total text-uppercase">
								Subtotal <span class="card-total-price">$ 294.00</span>
							</div>
							<button class="btn btn--full btn--lg">proceed to
								checkout</button>
						</div>
						<div class="sidebar-block open">
							<div class="sidebar-block_title">
								<span>APPLY PROMOCODE</span>
								<div class="toggle-arrow"></div>
							</div>
							<div class="sidebar-block_content">
								<label class="text-uppercase">promo/student code:</label>
								<div class="form-flex">
									<div class="form-group">
										<input type="text" class="form-control">
									</div>
									<button type="submit" class="newsletter-btn">
									Apply</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /SECTION -->

	<!-- NEWSLETTER -->
	<div id="newsletter" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="newsletter">
						<p>
							Sign Up for the <strong>NEWSLETTER</strong>
						</p>
						<form>
							<input class="input" type="email" placeholder="Enter Your Email">
							<button class="newsletter-btn">
								<i class="fa fa-envelope"></i> Subscribe
							</button>
						</form>
						<ul class="newsletter-follow">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /NEWSLETTER -->

	<!-- FOOTER -->
	<footer id="footer">
		<!-- top footer -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">About Us</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut.</p>
							<ul class="footer-links">
								<li><a href="#"><i class="fa fa-map-marker"></i>1 Vo
										Van Ngan, Thu Duc</a></li>
								<li><a href="#"><i class="fa fa-phone"></i>1234567890</a></li>
								<li><a href="#"><i class="fa fa-envelope-o"></i>artstore@gmail.com</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Categories</h3>
							<ul class="footer-links">
								<li><a href="#">MÀU VẼ</a></li>
								<li><a href="#">GIẤY VẼ</a></li>
								<li><a href="#">BÚT VẼ</a></li>
								<li><a href="#">PHÁC THẢO</a></li>
								<li><a href="#">DỤNG CỤ BỔ TRỢ</a></li>
								<li><a href="#">VĂN PHÒNG PHẨM</a></li>
							</ul>
						</div>
					</div>

					<div class="clearfix visible-xs"></div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Information</h3>
							<ul class="footer-links">
								<li><a href="#">About Us</a></li>
								<li><a href="#">Contact Us</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Orders and Returns</a></li>
								<li><a href="#">Terms & Conditions</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Service</h3>
							<ul class="footer-links">
								<li><a href="#">My Account</a></li>
								<li><a href="#">View Cart</a></li>
								<li><a href="#">Wishlist</a></li>
								<li><a href="#">Track My Order</a></li>
								<li><a href="#">Help</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /top footer -->

		<!-- bottom footer -->
		<div id="bottom-footer" class="section">
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12 text-center">
						<ul class="footer-payments">
							<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
							<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
						</ul>
						<span class="copyright"> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy; <script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</span>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bottom footer -->
	</footer>
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>

</body>

</html>