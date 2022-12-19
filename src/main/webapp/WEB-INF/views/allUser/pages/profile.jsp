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
    <!-- HEADER -->
   <%@ include file="__header.jsp" %>
    <!-- /HEADER -->

    <!-- NAVIGATION -->
    <nav id="navigation">
      <!-- container -->
      <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
          <!-- NAV -->
          <ul class="main-nav nav navbar-nav">
            <li class="active"><a href="#">Trang chủ</a></li>
            <li><a href="#">Quản lí sản phẩm</a></li>
            <li><a href="#">Quản lí hóa đơn</a></li>
          </ul>
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
            <h3 class="breadcrumb-header">User Profile</h3>
            <ul class="breadcrumb-tree">
              <li><a href="#">Trang chủ</a></li>
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
        <div>
          <label class="desc" id="title1" for="Field1">User ID:</label>
          <div>
            <input
              id="Field1"
              name="Field1"
              type="text"
              class="field text fn"
              value="${user.maNguoiDung}"
              size="8"
              tabindex="1"
            />
          </div>
        </div>
        <div>
          <label class="desc" id="title3" for="Field3">Username: </label>
          <div>
            <input
              id="Field3"
              name="Field3"
              type="text"
              spellcheck="false"
              value="${user.tenDangNhap}"
              maxlength="255"
              tabindex="3"
            />
          </div>
        </div>
        <div>
          <label class="desc" id="title3" for="Field3"> Password: </label>
          <div>
            <input
              id="Field4"
              name="Field3"
              type="password"
              spellcheck="false"
              value="${user.matKhau}"
              maxlength="255"
              tabindex="3"
            />
          </div>
        </div>
        <div>
          <label class="desc" id="title3" for="Field3">Date of Birth:</label>
          <div>
            <input
              id="Field4"
              name="Field3"
              type="date"
              spellcheck="false"
              value="${user.ngaySinh}"
              maxlength="255"
              tabindex="3"
            />
          </div>
        </div>
        <div>
          <label class="desc" id="title3" for="Field3">User Address: </label>
          <div>
            <input
              id="Field4"
              name="Field3"
              type="email"
              spellcheck="false"
              value="${user.diaChi}"
              maxlength="255"
              tabindex="3"
            />
          </div>
        </div>
      </div>
      <!-- /container -->
    </div>
    <!-- FOOTER -->
    <%@ include file="__footer.jsp" %>
    <!-- /FOOTER -->

  </body>
</html>
