<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="/QUANLYHOACU/static/allUser/./css/bootstrap.min.css" />


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


<header>
	<!-- TOP HEADER -->
	<div id="top-header">
		<div class="container">
			<ul class="header-links pull-left">
				<li><a href="#"><i class="fa fa-phone"></i> +454-54-54-54</a></li>
				<li><a href="#"><i class="fa fa-envelope-o"></i>quanlihoacu@email.com</a></li>
				<li><a href="#"><i class="fa fa-map-marker"></i>1 Vo Van Ngan</a></li>
			</ul>
			<ul class="header-links pull-right">
				<li><a href="#"><i class="fa fa-dollar"></i>VND</a></li>
				<li><a href="#"><i class="fa fa-user-o"></i>Tài khoản của tôi</a></li>
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
						<a href="#" class="logo"> <img
							src="/QUANLYHOACU/static/allUser/./image/logo4.png" width="153"
							height="70" border="0" alt="">
						</a>
					</div>
				</div>
				<!-- /LOGO -->

				<!-- SEARCH BAR -->
				<div class="col-md-6">
					<div class="header-search">
						<form>
							<select class="input-select" name="loaiSanPhamFind">
								<option value="0">Tất cả các loại</option>
								<c:forEach var="lsp" items="${loaiSanPham}">
									<option value="${lsp.maLoaiSP}">${lsp.tenLoaiSanPham}</option>
								</c:forEach>
							</select> <input class="input" placeholder="Nhập sản phẩm cần tìm">
							<button class="search-btn">Tìm kiếm</button>

						</form>
					</div>
				</div>
				<!-- /SEARCH BAR -->

				<!-- ACCOUNT -->
				<div class="col-md-3 clearfix">
					<div class="header-ctn">
						<!-- Wishlist -->
						<div>
							<a href="#"> <i class="fa fa-heart-o"></i> <span>Yêu thích</span>
								<div class="qty">2</div>
							</a>
						</div>
						<!-- /Wishlist -->

						<!-- Cart -->
						<div class="dropdown">
							<a href="Cart_HasProduct"> 
								<i class="fa fa-shopping-cart"></i> <span>Giỏ hàng</span>
								<div class="qty">3</div>
							</a>
						</div>
						<!-- /Cart -->
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
<!-- NAVIGATION -->
<nav id="navigation">
	<!-- container -->
	<div class="container">
		<!-- responsive-nav -->
		<div id="responsive-nav">
			<!-- NAV -->
			<ul class="main-nav nav navbar-nav">
				<li class="active"><a href="HomePage">TRANG CHỦ</a></li>
				<li><a href="#">Hot Deals</a></li>
				<c:forEach var="lsp" items="${loaiSanPham}">
					<li><a href="#">${lsp.tenLoaiSanPham }</a></li>
				</c:forEach>
			</ul>
			<!-- /NAV -->
		</div>
		<!-- /responsive-nav -->
	</div>
	<!-- /container -->
</nav>
<!-- /NAVIGATION -->