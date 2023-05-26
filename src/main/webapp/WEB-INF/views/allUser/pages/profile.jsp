<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>Tài khoản của bạn</title>
<script type="text/javascript">
	function validate() {
		var hoTen = document.forms["profile"]["hoTen"].value;
		var ngaySinh = document.forms["profile"]["ngaySinh"].value;
		var diaChi = document.forms["profile"]["diaChi"].value;
		if (diaChi == "" || hoTen == "" || ngaySinh == "") {
			alert("Vui lòng nhập đầy đủ thông tin!")
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<c:if test="${not empty notification}">
		<script type="text/javascript">
		         alert("${notification}");
	    </script>
	</c:if>
	<!-- HEADER -->
	<%@ include file="__header.jsp"%>
	<!-- /HEADER -->

	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">User Profile</h3>
					<ul class="breadcrumb-tree">
						<li><a href="defaultHomePage">Trang chủ</a></li>
						<li class="active">User Profile</li>
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

		<div class="container user-info">
			<form name="profile" action="capNhatThongTin" method="post"
			onsubmit="return vvalue="${user.hoTen}"alidate();">
				<div>
					<label class="desc" id="title3" for="Field3">Tên đăng nhập:
						<a style="color: red;">${user.tenDangNhap}</a>
					</label>

				</div>
				<div>
					<label class="desc" id="title3" for="Field3">Họ tên:</label>
					<div>
						<input name="hoTen" type="text" spellcheck="false"
							 value="${user.hoTen}"maxlength="255" tabindex="3" />
					</div>
				</div>
				<div>
					<label class="desc" id="title3" for="Field3">Ngày sinh:</label>
					<div>
						<input name="ngaySinh" type="date" spellcheck="false"
							value="${user.ngaySinh}" maxlength="255" tabindex="3" />
					</div>
				</div>
				<div>
					<label class="desc" id="title3" for="Field3">Địa chỉ: </label>
					<div>
						<input name="diaChi" type="text" spellcheck="false"
							value="${user.diaChi}" maxlength="255" tabindex="3" />
					</div>
				</div>
				<br></br>
				<div>
					<button type="submit" class="primary-btn">
						<a>Cập nhật</a>
					</button>
					<button class="primary-btn">
						<a href="DoiMatKhau">Đổi mật khẩu</a>
					</button>
				</div>
			</form>
		</div>
		<!-- /container -->
	</div>
	<!-- FOOTER -->
	<%@ include file="__footer.jsp"%>
	<!-- /FOOTER -->

</body>
</html>
