<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Electro - HTML Ecommerce Template</title>

    <!-- Google font -->
    <link
      href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
      rel="stylesheet"
    />

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="/QUANLYHOACU/static/allUser/css/bootstrap.min.css" />

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="/QUANLYHOACU/static/allUser/css/slick.css" />
    <link type="text/css" rel="stylesheet" href="/QUANLYHOACU/static/allUser/css/slick-theme.css" />

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="/QUANLYHOACU/static/allUser/css/nouislider.min.css" />

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="/QUANLYHOACU/static/allUser/css/font-awesome.min.css" />

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="/QUANLYHOACU/static/allUser/css/style.css" />
    <link
      type="text/css"
      rel="stylesheet"
      href="/QUANLYHOACU/static/allUser/css/admin_productManage.css"
    />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <c:if test="${not empty notification}">
	    <script type="text/javascript">
		         alert("${notification}");
	    </script>
	</c:if>
    <!-- HEADER -->
   <%@ include file="__header.jsp" %>
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
      <form action="capNhatThongTin" method="post">
        <div>
          <label class="desc" id="title3" for="Field3">Tên đăng nhập: <a  style="color:red;">${user.tenDangNhap }</a> </label>
         
        </div>
        <div>
          <label class="desc" id="title3" for="Field3">Họ tên:</label>
          <div>
            <input
              name="hoTen"
              type="text"
              spellcheck="false"
              value="${user.hoTen}"
              maxlength="255"
              tabindex="3"
            />
          </div>
        </div>
        <div>
          <label class="desc" id="title3" for="Field3">Ngày sinh:</label>
          <div>
            <input
  
              name="ngaySinh"
              type="date"
              spellcheck="false"
              value="${user.ngaySinh}"
              maxlength="255"
              tabindex="3"
            />
          </div>
        </div>
        <div>
          <label class="desc" id="title3" for="Field3">Địa chỉ: </label>
          <div>
            <input
    
              name="diaChi"
              type="text"
              spellcheck="false"
              value="${user.diaChi}"
              maxlength="255"
              tabindex="3"
            />
          </div>
        </div>
        <br></br>
        <div>	
			<button><a>Cập nhật</a></button>
        </div>
      </form>
		<button><a href="DoiMatKhau">Đổi mật khẩu</a></button>
      </div>
      <!-- /container -->
    </div>
    <!-- FOOTER -->
    <%@ include file="__footer.jsp" %>
    <!-- /FOOTER -->

  </body>
</html>
