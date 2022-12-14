<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Cart</title>

</head>

<body>
	<!-- HEADER -->
	<jsp:include page="__header.jsp"></jsp:include>
	<!-- HEADER -->

	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">Giỏ hàng</h3>
					<ul class="breadcrumb-tree">
						<li><a href="#">Trang chủ</a></li>
						<li class="active">Giỏ hàng</li>
					</ul>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /BREADCRUMB -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<div class="nocart-container">
				<img src="./img/empty_cart.png" /> <br />
				<div>Không có sản phẩm nào trong giỏ hàng của bạn.</div>
				<div class="shopping-btn">Tiếp tục mua hàng</div>
			</div>
		</div>
		<!-- /container -->
	</div>

	<!-- FOOTER -->
	<jsp:include page="__footer.jsp"></jsp:include>
	<!-- /FOOTER -->


</body>
</html>
