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
    
    <!-- /NAVIGATION -->

    <!-- BREADCRUMB -->
    <div id="breadcrumb" class="section">
      <!-- container -->
      <div class="container">
        <!-- row -->
        <div class="row">
          <div class="col-md-12">
            <h3 class="breadcrumb-header">Chi tiết hoá đơn</h3>
            <ul class="breadcrumb-tree">
              <li><a href="defaultHomePage">Trang chủ</a></li>
              <li class="active">Chi tiết hóa đơn</li>
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
        <div class="hoadon-info">
          <label for="">Địa chỉ nhận hàng</label>
          <div class="hoadon-info-item">
            Người nhận: ${hoaDonMain.hoten}
          </div>
          <div class="hoadon-info-item">
            Địa chỉ: ${hoaDonMain.diaChiGiaoHang}
          </div>
           <div class="hoadon-info-item">
            Số điện thoại: ${hoaDonMain.soDienThoai}
          </div>
        </div>
        <br/>
        <div class="hashascart-container">
           <div class="table-responsive">     
                   
                    <table class="table table-bordered verticle-middle">
                      <thead>
                        <tr>
                          <th scope="col"></th>
	                          <th scope="col">Tên Sản Phẩm</th>                      
	                          <th scope="col">Số lượng</th>
	                          <th scope="col">Giá tiền</th>
                        </tr>
                      </thead>
                      <tbody>
                       <c:forEach items="${chitiethoadonListMain}" var="chitiethoadon">
	                        <tr >
	                          <td><img src="${chitiethoadon.hinh}"
	                            style="width:100px" alt=""></td>
	                          <td>${chitiethoadon.tenSP}</td>
	                          <td>${chitiethoadon.soLuong}</td>  
	                          <td>${chitiethoadon.tongPhu}</td>    
	                        </tr>
	                       </c:forEach>
                      </tbody>
                    </table>
                    <label>Thành tiền: ${hoaDonMain.tongThanhToan} đ</label>
                    <br/><br/>
                  </div>
                
      </div>
      <!-- /container -->
    </div>
    <!-- FOOTER -->
    <%@ include file="__footer.jsp" %>
    <!-- /FOOTER -->

 
  </body>
</html>
