<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  	<%@include file="__header.jsp" %>
    <!-- /HEADER -->

   

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
        <div class="hashascart-container">
           <div class="table-responsive">    
                    <table class="table table-bordered verticle-middle">
                      <thead>
                        <tr>
                          <th scope="col">Mã Hóa Đơn</th>
                          <th scope="col">Mã SP</th>
                        
                          <th scope="col">Số lượng</th>
                          <th scope="col">Giá tiền</th>
                        </tr>
                      </thead>
                      <tbody>
                       <c:forEach items="${chitiethoadonList}" var="chitiethoadon">
                        <tr>
                          <td>${chitiethoadon.maHoaDon}</td>
                          <td>${chitiethoadon.maSP}</td>
                         
                          <td>${chitiethoadon.soLuong}</td>
                          <td>${chitiethoadon.tongPhu}</td>   
                          <td >  
                          <span>
                              <a
                                href="#"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Delete"
                                ><i class="fa fa-close color-danger"></i></a
                            ></span>
                          </td>
                        </tr>
                       </c:forEach>
                      </tbody>
                    </table>
                  </div>
                  <a href="/ThanhToan"><div class="checkout-btn">Thanh toán</div></a>
      </div>
      <!-- /container -->
    </div>
    <!-- FOOTER -->
	<%@include file="__footer.jsp" %>
    <!-- /FOOTER -->

    <!-- jQuery Plugins -->
    <script src="/QUANLYHOACU/static/allUser/js/jquery.min.js"></script>
    <script src="/QUANLYHOACU/static/allUser/js/bootstrap.min.js"></script>
    <script src="/QUANLYHOACU/static/allUser/js/slick.min.js"></script>
    <script src="/QUANLYHOACU/static/allUser/js/nouislider.min.js"></script>
    <script src="/QUANLYHOACU/static/allUser/js/jquery.zoom.min.js"></script>
    <script src="/QUANLYHOACU/static/allUser/js/main.js"></script>
    <script src="/QUANLYHOACU/static/allUser/js/admin_productManage.js"></script>
  </body>
</html>
