
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
	function validate() {
		var hoTen = document.forms["order"]["hoTen"].value;
		var soDienThoai = document.forms["order"]["soDienThoai"].value;
		var diaChi = document.forms["order"]["diaChi"].value;
		if (soDienThoai == "" || hoTen == "" || diaChi == "") {
			alert("Vui lòng nhập đầy đủ thông tin!")
			return false;
		}
		return true;
	}
</script>


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
			<form name="order" action="ThanhToan" method="post"
				onsubmit="return validate();">
				<div class="row">

					<div class="col-md-5">
						<!-- Billing Details -->
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Địa chỉ thanh toán</h3>
							</div>
							<div class="form-group">
								<label>Họ và tên</label> <input class="input"
									value="${user.hoTen}" type="text" name="hoTen"
									placeholder="Họ và tên">
							</div>

							<div class="form-group">
								<label>Điện thoại</label> <input class="input" type="tel"
									name="soDienThoai" placeholder="Điện thoại">
							</div>
							<div class="form-group">
								<label>Địa chỉ</label> <input class="input" type="text"
									value="${user.diaChi}"name="diaChi" placeholder="Địa chỉ">
							</div>
							<div class="order-notes">
								<label>Ghi chú</label>
								<textarea name="ghiChu" class="input"
									placeholder="Ghi chú cho nhà bán hàng"></textarea>
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
							<table>
							<div class="order-products">
								<div class="order-col">
									<div><strong>SẢN PHẨM</strong></div>
									<div style="text-align: right"><strong>SỐ LƯỢNG</strong></div>
									<div><strong>TỔNG TIỀN</strong></div>
								</div>
								</div>
								<div>
									<c:forEach var="cthd" items="${chiTietHoaDon}">
										<div class="order-products">
											<div class="order-col">
												<div>${cthd.tenSP}</div>
												<div>${cthd.soLuong}</div>
												<div>${cthd.tongPhu }</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</table>
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
						<input type=submit value="Đặt hàng"
							class="primary-btn order-submit" />
					</div>
					<!-- /Order Details -->
				</div>
			</form>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->


	<!-- FOOTER -->
	<%@include file="__footer.jsp"%>
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