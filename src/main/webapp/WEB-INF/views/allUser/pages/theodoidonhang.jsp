<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Theo dõi đơn hàng</title>

</head>
<body>
	<!-- HEADER -->
	<%@ include file="__header.jsp"%>
	<!-- /HEADER -->

	<!-- NAVIGATION -->

	<!-- container -->
	<div class="container">
		<!-- responsive-nav -->
		<div id="responsive-nav">
			<!-- NAV -->

			<!-- /NAV -->
		</div>
		<!-- /responsive-nav -->
	</div>
	<!-- /container -->
	</nav>
	<!-- /NAVIGATION -->

	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">Theo dõi đơn hàng</h3>
					<ul class="breadcrumb-tree">
						<li><a href="defaultHomePage">Trang chủ</a></li>
						<li class="active">Theo dõi đơn hàng</li>
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
			<div class="hashascart-container">
				<div class="table-responsive">
					<ul class="hoadon-status">
						<a href="TheoDoiDonHang?mode=tatca" class="hoadon-status-item">Tất
							cả</a>
						<a href="TheoDoiDonHang?mode=daduyet" class="hoadon-status-item">Đã
							duyệt</a>
						<a href="TheoDoiDonHang?mode=choxuli" class="hoadon-status-item">Chờ
							xử lí</a>
						<a href="TheoDoiDonHang?mode=dathanhtoan"
							class="hoadon-status-item">Đã thanh toán</a>
						<a href="TheoDoiDonHang?mode=chothanhtoan"
							class="hoadon-status-item">Chờ thanh toán</a>
						<a href="TheoDoiDonHang?mode=dagiaohang"
							class="hoadon-status-item">Đã giao hàng</a>
						<a href="TheoDoiDonHang?mode=chogiaohang"
							class="hoadon-status-item">Chờ giao hàng</a>
					</ul>

					<table class="table table-bordered verticle-middle">
						<thead>
							<tr>

								<th scope="col"></th>
								<th scope="col">Mã Hóa Đơn</th>
								<th scope="col">Mã khách hàng</th>
								<th scope="col">Tổng thanh toán</th>
								<th scope="col">Địa chỉ giao hàng</th>
								<th scope="col">Thời gian giao hàng</th>
								<th scope="col">Trạng thái đơn hàng</th>
								<th scope="col">Trạng thái giao hàng</th>
								<th scope="col">Trạng thái thanh toán</th>
								<th scope="col">Ghi chú</th>


							</tr>
						</thead>
						<tbody>


							<c:forEach items="${hoadonList}" var="hd">
								<c:if
									test="${mode=='tatca' || (mode=='daduyet' && hd.trangThaiDonHang==true) || (mode=='choxuli' && hd.trangThaiDonHang==false) || (mode=='dathanhtoan' && hd.trangThaiThanhToan==true) || (mode=='chothanhtoan' && hd.trangThaiThanhToan==false)  || (mode=='dagiaohang' && hd.trangThaiGiaoHang==true) || (mode=='chogiaohang' && hd.trangThaiGiaoHang==false)   }">
									<tr>
										<td><a
											href="/QUANLYHOACU/ChiTietDonHang?id=${hd.maHoaDon}">Chi
												tiết</a></td>
										<td>${hd.maHoaDon}</td>
										<td>${hd.maKhachHang}</td>
										<td>${hd.tongThanhToan}</td>
										<td>${hd.diaChiGiaoHang}</td>
										<td>${hd.thoiGianGiaoHang}</td>
										<td>${hd.meanTrangThaiDonHang()}</td>
										<td>${hd.meanTrangThaiGiaoHang()}</td>
										<td>${hd.meanTrangThaiThanhToan()}</td>
										<td>${hd.ghiChu}</td>

									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
			<!-- /container -->
		</div>
		<!-- FOOTER -->
		<%@ include file="__footer.jsp"%>
		<!-- /FOOTER -->
</body>
</html>
