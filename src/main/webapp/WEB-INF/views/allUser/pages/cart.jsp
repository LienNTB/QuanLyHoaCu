<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>Cart</title>

</head>

<body>
	<!-- HEADER -->
	<jsp:include page="__header.jsp"></jsp:include>
	<!-- HEADER -->

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
	      <c:if test="${not empty chitiethoadonList }">
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
	                       <c:forEach items="${chitiethoadonList}" var="chitiethoadon">
	                        <tr >
	                          <td><img src="${chitiethoadon.hinh}"
	                            style="width:100px" alt=""></td>
	                          <td>${chitiethoadon.tenSP}</td>
	                 
	                          <td>${chitiethoadon.soLuong}</td>  
	                          <td>${chitiethoadon.tongPhu}</td>    
	                          <td >  
	                          
	                          <span>
	                              <a
	                                href="DeleteFromCart?id=${chitiethoadon.maSP}"
	                                data-toggle="tooltip"
	                                data-placement="top"
	                                title="Delete"
	                                >Delete <t/><i class="fa fa-close color-danger"></i></a
	                            ></span>
	                          </td>
	                        </tr>
	                       </c:forEach>
	                      </tbody>
	                    </table>
	                  </div>
	                  <a href="ThanhToan"><div class="checkout-btn">Thanh toán</div></a>
	      	</div>
	      </c:if>
	      <c:if test="${empty chitiethoadonList }">
		      <div class="nocart-container">
		          <img src="/QUANLYHOACU/static/allUser/./image/empty_cart.png" />
		          <br />
		          <div>Không có sản phẩm nào trong giỏ hàng của bạn.</div>
		          <div class="shopping-btn"><a href="HomePage">Tiếp tục mua hàng</a></div>
	       	  </div>
	      </c:if>
      </div>
      <!-- /container -->
    </div>
    <!-- FOOTER -->
	<%@include file="__footer.jsp" %>
    <!-- /FOOTER -->

</html>
