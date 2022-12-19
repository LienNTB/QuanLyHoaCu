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
  </head>
  <body>
    <!-- HEADER -->
    <%@ include file="__header.jsp" %>
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
              <li><a href="#">Trang chủ</a></li>
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
                      <a href="/tatca"class="hoadon-status-item">Tất cả</a>
                      <a href="/daduyet" class="hoadon-status-item">Đã duyệt</a>
                      <a href="/choxuli" class="hoadon-status-item">Chờ xử lí</a>
                      <a href="/dathanhtoan" class="hoadon-status-item">Đã thanh toán</a>
                      <a href="/chothanhtoan" class="hoadon-status-item">Chờ thanh toán</a>
                      <a href="/dagiaohang" class="hoadon-status-item">Đã giao hàng</a>
                      <a href="/chogiaohang" class="hoadon-status-item">Chờ giao hàng</a>
                    </ul> 
                    <table class="table table-bordered verticle-middle">
                      <thead>
                        <tr>
                 
                          <th scope="col">Mã Hóa Đơn</th>
                          <th scope="col">Mã khách hàng</th>
                          <th scope="col">Ghi chú</th>
                          <th scope="col">Tổng thanh toán</th>
                          <th scope="col">Địa chỉ giao hàng</th>                        
                          <th scope="col">Thời gian giao hàng</th>
                          <th scope="col">Trạng thái đơn hàng</th>
                          <th scope="col">Trạng thái giao hàng</th>
                          <th scope="col">Trạng thái thanh toán</th>
                          <th scope="col"></th>
                         
                  
                        </tr>
                      </thead>
                      <tbody>

                         
                       <c:forEach items="${hoadonList}" var="hd">
                        <tr >
                          <td>${hd.maHoaDon}</td>
                          <td>${hd.maKhachHang}</td>                        
                          <td>${hd.ghiChu}</td>
                          <td>${hd.tongThanhToan}</td>   
                          <td>${hd.diaChiGiaoHang}</td>   
                          <td>${hd.thoiGianGiaoHang}</td>   
                          <td>${hd.trangThaiDonHang}</td>   
                          <td>${hd.trangThaiGiaoHang}</td>   
                          <td>${hd.trangThaiThanhToan}</td>   
                          <td><a href="/QUANLYHOACU/ChiTietDonHang?id=${hd.maHoaDon}">Chi tiết</a></td>   
                         
                        </tr>
                       </c:forEach>
                      </tbody>
                    </table>
                  </div>
          
      </div>
      <!-- /container -->
    </div>
    <!-- FOOTER -->
    <%@ include file="__footer.jsp" %>
    <!-- /FOOTER -->
  </body>
</html>
