<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- NEWSLETTER -->
<div id="newsletter" class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<div class="col-md-12">
				<div class="newsletter">
					<p>
						Đăng ký để nhận <strong>THƯ MỚI</strong>
					</p>
					<form>
						<input class="input" type="email" placeholder="Nhập thư của bạn">
						<button class="newsletter-btn">
							<i class="fa fa-envelope"></i> Đăng ký
						</button>
					</form>
					<ul class="newsletter-follow">
						<li><a href="https://www.facebook.com/profile.php?id=100086994803693"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-instagram"></i></a></li>
						<li><a href="#"><i class="fa fa-github"></i></a></li>
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
				<div class="col-md-4 col-xs-6">
					<div class="footer">
						<h3 class="footer-title">NHÓM LẬP TRÌNH WEB</h3>
						<p>Bộ môn: Lập trình web</p>
						<p>Giảng viên hướng dẫn: Ths. Trương Thị Khánh Dịp</p>
						<p>Nhóm sinh viên thực hiện: Phạm Quỳnh Hương, Nguyễn Thị Bích
							Liên, Nguyễn Ngọc Phát</p>

						<ul class="footer-links">
							<li><a href="#"><i class="fa fa-map-marker"></i>1 Vo Van
									Ngan</a></li>
							<li><a href="#"><i class="fa fa-phone"></i>+454-54-54-54</a></li>
							<li><a href="#"><i class="fa fa-envelope-o"></i>quanlihoacu@email.com</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-xs-6">
					<div class="footer">
						<h3 class="footer-title">Danh mục sản phẩm</h3>
						<ul class="footer-links">
						<c:forEach var="lsp" items="${loaiSanPham}">
							<li><a href="FindProduct?loaiSanPhamFind=${lsp.maLoaiSP }">${lsp.tenLoaiSanPham}</a></li>
						</c:forEach>
						</ul>
					</div>
				</div>

				<div class="clearfix visible-xs"></div>

				<div class="col-md-2 col-xs-6">
					<div class="footer">
						<h3 class="footer-title">THÔNG TIN</h3>
						<ul class="footer-links">
							<li><a href="#">Giới thiệu</a></li>
							<li><a href="#">Liên hệ</a></li>
							<li><a href="#">Chính sách bảo mật</a></li>
							<li><a href="#">Đặt hàng và trả lại</a></li>
							<li><a href="#">Điều khoản</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-2 col-xs-6">
					<div class="footer">
						<h3 class="footer-title">DỊCH VỤ</h3>
						<ul class="footer-links">
							<li><a href="Profile">Tài khoản của bạn</a></li>
							<li><a href="Cart">Xem giỏ hàng</a></li>
							<li><a href="#">Danh sách yêu thích</a></li>
							<li><a href="TheoDoiDonHang">Theo dõi đơn hàng</a></li>
							<li><a href="#">Trợ giúp</a></li>
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
					<span class="copyright"> Bản quyền &copy; thuộc về nhóm lập
						trình web | Được tạo bởi Hương, Phát, Liên </span>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /bottom footer -->
</footer>