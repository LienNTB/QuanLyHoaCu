<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="utf-8" />
			<meta http-equiv="X-UA-Compatible" content="IE=edge" />
			<meta name="viewport" content="width=device-width, initial-scale=1" />

			<script type="text/javascript">
				function ConfirmDialog(id) {
					var message = confirm("Thêm sản phẩm " + id + " vào giỏ hàng?");
					if (message) {
						window.location.href = "ThemChiTietHoaDon?id=" + id
					}
					else
						return false;

				}
			</script>

			<title>Home</title>
		</head>

		<link type="text/css" rel="stylesheet" href="/QUANLYHOACU/static/allUser/./css/style.css" />
		</head>

		<body>
			<!-- HEADER -->
			<%@ include file="__header.jsp" %>
				<!-- /HEADER -->
				<!-- SECTION -->
				<div class="section">
					<!-- container -->
					<div class="container">
						<!-- row -->
						<div class="row">
							<!-- ASIDE -->
							<div id="aside" class="col-md-3">
								<!-- aside Widget -->
								<div class="aside">
									<h3 class="aside-title">Categories</h3>
									<div class="checkbox-filter">
										<c:forEach var="lsp" items="${loaiSanPham}">
											<div class="input-checkbox">
												<input type="checkbox" id="category-1" />
												<label for="category-1">
													<span></span>
													${lsp.tenLoaiSanPham}
													<small>(${lsp.SLTrongKho})</small>
												</label>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- /aside Widget -->


								<!-- aside Widget -->
								<div class="aside">
									<h3 class="aside-title">Top selling</h3>
									<c:forEach var="bsr" items="${bestSeller}">
										<div class="product-widget">
											<div class="product-img">
												<img src="${bsr.hinh }" alt="" />
											</div>
											<div class="product-body">
												<p class="product-category">${bsr.tenLoaiSanPham}</p>
												<h3 class="product-name">
													<a href="#">${bsr.tenSP }</a>
												</h3>
												<h4 class="product-price">
													${bsr.gia } <del class="product-old-price">${bsr.gia }</del>
												</h4>
											</div>
										</div>
									</c:forEach>
								</div>
								<!-- /aside Widget -->
							</div>
							<!-- /ASIDE -->

							<!-- STORE -->
							<div id="store" class="col-md-9">
								<!-- store top filter -->
								<div class="store-filter clearfix">
									<div class="store-sort">
										<label>
											Sort By:
											<select class="input-select">
												<option value="0">Popular</option>
												<option value="1">Position</option>
											</select>
										</label>

										<label>
											Show:
											<select class="input-select">
												<option value="0">20</option>
												<option value="1">50</option>
											</select>
										</label>
									</div>
									<ul class="store-grid">
										<li class="active"><i class="fa fa-th"></i></li>
										<li>
											<a href="#"><i class="fa fa-th-list"></i></a>
										</li>
									</ul>
								</div>
								<!-- /store top filter -->

								<!-- store products -->

								<div class="row">
									<c:forEach var="sp" items="${sanPhamList}">

										<div class="col-md-4 col-xs-6">
											<div class="product">
												<div class="product-img">
													<img src="${sp.hinh }" alt="" />
												</div>
												<div class="product-body">
													<p class="product-category">${sp.tenLoaiSanPham}</p>
													<h3 class="product-name">
														<a href="SanPham?id=${sp.maSP}">${sp.tenSP}</a>
													</h3>
													<h4 class="product-price">
														${sp.gia } <del class="product-old-price">${sp.gia }</del>
													</h4>
													<div class="product-rating"></div>
													<!-- <div class="product-btns">
                        <button class="add-to-wishlist">
                          <i class="fa fa-heart-o"></i
                          ><span class="tooltipp">add to wishlist</span>
                        </button>
                        <button class="add-to-compare">
                          <i class="fa fa-exchange"></i
                          ><span class="tooltipp">add to compare</span>
                        </button>
                        <button class="quick-view">
                          <i class="fa fa-eye"></i
                          ><span class="tooltipp">quick view</span>
                        </button>
                      </div> -->
												</div>
												<!-- <div class="add-to-cart">
                      <button class="add-to-cart-btn fa fa-shopping-cart" onclick="{return ConfirmDialog(${sp.maSP});}">
                      
                        Add to cart
                    
                      </button>
                    </div> -->
											</div>
										</div>

									</c:forEach>
								</div>
								<!-- /store products -->

								<!-- store bottom filter -->
								<div class="store-filter clearfix">
									<span class="store-qty">Showing 20-100 products</span>
									<ul class="store-pagination">
										<c:forEach var="i" begin="1" end="${maxPage }">
											<li <c:if test="${i==index }"> class="active"</c:if>><a
													href="HomePage?index=${i }">${i }</a></li>
										</c:forEach>

									</ul>
								</div>
								<!-- /store bottom filter -->
							</div>
							<!-- /STORE -->
						</div>
						<!-- /row -->
					</div>
					<!-- /container -->
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
									<p>Sign Up for the <strong>NEWSLETTER</strong></p>
									<form>
										<input class="input" type="email" placeholder="Enter Your Email" />
										<button class="newsletter-btn">
											<i class="fa fa-envelope"></i> Subscribe
										</button>
									</form>
									<ul class="newsletter-follow">
										<li>
											<a href="#"><i class="fa fa-facebook"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-twitter"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-instagram"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-pinterest"></i></a>
										</li>
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
				<jsp:include page="__footer.jsp"></jsp:include>
				<!-- /FOOTER -->

				<!-- jQuery Plugins -->
				<script src="/QUANLYHOACU/static/allUser/js/jquery.min.js"></script>
				<script src="/QUANLYHOACU/static/allUser/js/bootstrap.min.js"></script>
				<script src="/QUANLYHOACU/static/allUser/js/slick.min.js"></script>
				<script src="/QUANLYHOACU/static/allUser/js/nouislider.min.js"></script>
				<script src="/QUANLYHOACU/static/allUser/js/jquery.zoom.min.js"></script>
				<script src="/QUANLYHOACU/static/allUser/js/main.js"></script>
		</body>

		</html>