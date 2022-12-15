	<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Check Out</title>

		<script type="text/javascript">
			function validate()
			{
				var hoTen=document.forms["order"]["hoTen"].value;
				var soDienThoai=document.forms["order"]["soDienThoai"].value;
				var diaChi=document.forms["order"]["diaChi"].value;
				if (soDienThoai==""||hoTen==""||diaChi=="")
				{
					alert("Vui lòng nhập đầy đủ thông tin!")
					return false;
				}
				return true;
			}
		</script>
		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="/QUANLYHOACU/static/allUser/./css/bootstrap.min.css" />


		<!-- Slick -->
		<link type="text/css" rel="stylesheet" href="/QUANLYHOACU/static/allUser/./css/slick.css" />
		<link type="text/css" rel="stylesheet" href="/QUANLYHOACU/static/allUser/./css/slick-theme.css" />

		<!-- nouislider -->
		<link type="text/css" rel="stylesheet" href="/QUANLYHOACU/static/allUser/./css/nouislider.min.css" />

		<!-- Font Awesome Icon -->
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="/QUANLYHOACU/static/allUser/./css/style.css" />

	</head>

	<body>
		<!-- HEADER -->
		<%@include file="__header.jsp"%>
		<!-- /HEADER -->


		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">Checkout</h3>
						<ul class="breadcrumb-tree">
							<li><a href="HomePage">Home</a></li>
							<li class="active">Checkout</li>
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
				<!-- row -->
				<input type="hidden" name="tongTien" value="${tongTien}">
				<form name="order" action="ThanhToan" method="post" onsubmit="return validate();">
					<div class="row">
	
						<div class="col-md-5">
							<!-- Billing Details -->
							<div class="billing-details">
								<div class="section-title">
									<h3 class="title">Địa chỉ thanh toán</h3>
								</div>
								<div class="form-group" >
								<label>Họ và tên</label>
									<input class="input" value="${commons.mainUser.hoTen}"type="text" name="hoTen" placeholder="Họ và tên">
								</div>
				
								<div class="form-group">
								<label>Điện thoại</label>
									<input class="input" type="tel" name="soDienThoai" placeholder="Điện thoại">
								</div>
								<div class="form-group">
								<label>Địa chỉ</label>
									<input class="input" type="text" name="diaChi" placeholder="Địa chỉ">
								</div>
								<div class="order-notes">
								<label>Ghi chú</label>
								<textarea name="ghiChu" class="input" placeholder="Ghi chú cho nhà bán hàng"></textarea>
								</div>
							</div>
							<!-- /Billing Details -->
	
						</div>
	
						<!-- Order Details -->
						<div class="col-md-7 order-details">
							<div class="section-title text-center">
								<h3 class="title">Đơn hàng của bạn</h3>
							</div>
							<div class="order-summary">
								<div class="order-col">
									<div>
										<strong>SẢN PHẨM</strong>
									</div>
									<div>
										<strong>SỐ LƯỢNG</strong>
									</div>
									<div>
										<strong>TỔNG TIỀN</strong>
									</div>
								</div>
								<c:forEach var ="cthd" items="${ chiTietHoaDon}">
									<div class="order-products">
										<div class="order-col">
											<div>${cthd.tenSP}</div>
											<div>${cthd.soLuong}</div>
											<div>${cthd.tongPhu }</div>
											
										</div>
									</div>
								</c:forEach>
								<div class="order-col">
									<div>Shiping</div>
									<div>
										<strong>FREE</strong>
									</div>
								</div>
								<div class="order-col">
									<div>
										<strong>TOTAL</strong>
									</div>
									<div>
										<strong class="order-total">${tongTien}</strong>
									</div>
								</div>
							</div>
							
							<!-- <script type="text/javascript">
	
							var returnedSuggestion = ''
							let editor, doc, cursor, line, pos
							document.addEventListener("keydown", (event) => {
							setTimeout(()=>{
								editor = event.target.closest('.CodeMirror');
								if (editor){
									doc = editor.CodeMirror.getDoc()
									cursor = doc.getCursor()
									line = doc.getLine(cursor.line)
									pos = {line: cursor.line, ch: line.length}
									if (event.key == "Enter"){
										var query = doc.getRange({ line: Math.max(0,cursor.line-10), ch: 0 }, { line: cursor.line, ch: 0 })
										window.postMessage({source: 'getSuggestion', payload: { data: query } } )
										//displayGrey(query)
									}
									else if (event.key == "ArrowRight"){
										acceptTab(returnedSuggestion)
									}
								}
							}, 0)
							})
	
							function acceptTab(text){
							if (suggestionDisplayed){
								doc.replaceRange(text, pos)
								suggestionDisplayed = false
							}
							}
							function displayGrey(text){
							var element = document.createElement('span')
							element.innerText = text
							element.style = 'color:grey'
							var lineIndex = pos.line;
							editor.getElementsByClassName('CodeMirror-line')[lineIndex].appendChild(element)
							suggestionDisplayed = true
							}
							window.addEventListener('message', (event)=>{
							if (event.source !== window ) return
							if (event.data.source == 'return'){
								returnedSuggestion = event.data.payload.data
								displayGrey(event.data.payload.data)
							}
							})
						
							</script>
							
							
							
							<div class="payment-method">
								<div class="input-radio">
									<input type="radio" name="payment" id="payment-1"> <label for="payment-1"> <span></span>
										Chuyển khoản trực tiếp
									</label>
									<div class="caption">
										<p>Chuyển khoản trực tiếp.</p>
									</div>
								</div>
								<div class="input-radio">
									<input type="radio" name="payment" id="payment-2"> <label for="payment-2"> <span></span>
										Thanh toán séc
									</label>
									<div class="caption">
										<p>Thanh toán séc.</p>
									</div>
								</div>
								<div class="input-radio">
									<input type="radio" name="payment" id="payment-3"> <label for="payment-3"> <span></span>
										Paypal
									</label>
									<div class="caption">
										<p>Paypal.</p>
									</div>
								</div>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="terms"> <label for="terms">
									<span></span> Tôi đã đọc và đồng ý với <a href="#">các chính sách và điều kiện</a>
								</label>
							</div> -->
							<input type=submit value="Đặt hàng" class="primary-btn order-submit"/>
						</div>
						<!-- /Order Details -->
					</div>
				</form>
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
							<span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>document.write(new Date().getFullYear());</script>
								All rights reserved | This template is made with <i class="fa fa-heart-o"
									aria-hidden="true"></i> by <a href="https://colorlib.com"
									target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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
		<script src="/QUANLYHOACU/static/allUser/js/jquery.min.js"></script>
		<script src="/QUANLYHOACU/static/allUser/js/bootstrap.min.js"></script>
		<script src="/QUANLYHOACU/static/allUser/js/slick.min.js"></script>
		<script src="/QUANLYHOACU/static/allUser/js/nouislider.min.js"></script>
		<script src="/QUANLYHOACU/static/allUser/js/jquery.zoom.min.js"></script>
		<script src="/QUANLYHOACU/static/allUser/js/main.js"></script>

	</body>

	</html>