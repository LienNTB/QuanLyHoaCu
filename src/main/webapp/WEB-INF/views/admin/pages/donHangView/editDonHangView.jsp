<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Art Store - Admin</title>
    <script type="text/javascript">
      function validateForm()
      {
        var soDienThoai=document.forms["editHoaDon"]["soDienThoai"].value;
        var diaChiGiaoHang=document.forms["editHoaDon"]["diaChiGiaoHang"].value;
        if(soDienThoai=="" ||diaChiGiaoHang=="" )
        {
          alert("Vui lòng nhập đầy đủ thông tin!");
          return false;
        }
        return true;
      
      }
    </script>
    <!-- Favicon icon -->
   <link
      rel="icon"
      type="image/png"
      sizes="10x10"
      href="/QUANLYHOACU/static/admin/images/logo-icon.png"
    />
    <!-- Custom Stylesheet -->
    <link href="/QUANLYHOACU/static/admin/css/style.css" rel="stylesheet" />
  </head>

  <body>
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
      <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
          <circle
            class="path"
            cx="50"
            cy="50"
            r="20"
            fill="none"
            stroke-width="3"
            stroke-miterlimit="10"
          />
        </svg>
      </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">
      <!--**********************************
            Nav header start
        ***********************************-->
      <div class="nav-header">
        <div class="brand-logo">
          <a href="homepage.html">
            <img src="./images/logo.png" alt="" />
          </a>
        </div>
      </div>
      <!--**********************************
            Nav header end
        ***********************************-->

      <!--**********************************
            Header start
        ***********************************-->
      <div class="header">
        <div class="header-content clearfix">
          <div class="nav-control">
            <div class="hamburger">
              <span class="toggle-icon"><i class="icon-menu"></i></span>
            </div>
          </div>
          <div class="header-left"></div>
          <div class="header-right">
            <ul class="clearfix">
              <li class="icons dropdown">{Username}</li>
              <li class="icons dropdown">
                <div
                  class="user-img c-pointer position-relative"
                  data-toggle="dropdown"
                >
                  <span class="activity active"></span>
                  <img src="images/user/1.png" height="40" width="40" alt="" />
                </div>
                <div
                  class="drop-down dropdown-profile animated fadeIn dropdown-menu"
                >
                  <div class="dropdown-content-body">
                    <ul>
                      <li>
                        <a href="app-profile.html"
                          ><i class="icon-user"></i> <span>Profile</span></a
                        >
                      </li>
                      <li>
                        <a href="javascript:void()">
                          <i class="icon-envelope-open"></i> <span>Inbox</span>
                          <div class="badge gradient-3 badge-pill gradient-1">
                            3
                          </div>
                        </a>
                      </li>

                      <hr class="my-2" />
                      <li>
                        <a href="page-lock.html"
                          ><i class="icon-lock"></i> <span>Lock Screen</span></a
                        >
                      </li>
                      <li>
                        <a href="page-login.html"
                          ><i class="icon-key"></i> <span>Logout</span></a
                        >
                      </li>
                    </ul>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

      <!--**********************************
            Sidebar start
        ***********************************-->
      <div class="nk-sidebar">
        <div class="nk-nav-scroll">
          <ul class="metismenu" id="menu">
            <li>
              <a href="Admin_HomePage" aria-expanded="false">
                <!-- <i class="fa-solid fa-house"></i> -->
                <!-- <i class="fas fa-home"></i> -->
                <i class="fa fa-home" aria-hidden="true"></i>
                <span class="nav-text">Trang chủ</span>
              </a>
            </li>
            <li>
              <a href="QuanLiSanPham" aria-expanded="false">
                <i class="fa fa-square" aria-hidden="true"></i
                ><span class="nav-text">Quản lí sản phẩm</span>
              </a>
            </li>
            <li>
              <a href="QuanLiLoaiSanPham" aria-expanded="false">
                <i class="fa fa-circle" aria-hidden="true"></i
                ><span class="nav-text">Quản lí loại sản phẩm</span>
              </a>
            </li>
            <li>
              <a href="QuanLiKhachHang" aria-expanded="false">
                <i class="fa fa-users" aria-hidden="true"></i
                ><span class="nav-text">Quản lí khách hàng</span>
              </a>
            </li>
            <li>
              <a href="QuanLiDonHang" aria-expanded="false">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i
                ><span class="nav-text">Quản lí đơn hàng</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
      <!--*****
      <!--**********************************
            Sidebar end
        ***********************************-->

      <!--**********************************
            Content body start
        ***********************************-->
      <div class="content-body">
        <div class="row page-titles mx-0">
          <div class="col p-md-0">
            <ol class="breadcrumb">
              <li class="breadcrumb-item">
                <a href="javascript:void(0)">Trang chủ</a>
              </li>
              <li class="breadcrumb-item active">
                <a href="javascript:void(0)">Edit đơn hàng</a>
              </li>
            </ol>
          </div>
        </div>
        <!-- row -->

        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-lg-12">
              <div class="card">
                <div class="card-body">
                  <div class="form-validation">
                    <p style="color:red;">${errorString}</p>
                    <form class="form-valide" action="#" method="post">
                    <input type="hidden" name="maHoaDon" value="${hoaDon.maHoaDon}" name ="editHoaDon" onsubmit=" return validateForm();">
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-orderId"
                          >Mã đơn hàng <span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
 							<label class="col-lg-4 col-form-label" for="val-orderId"
                          	>${hoaDon.maHoaDon } </label>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Mã khách hàng <span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
      								<select name="maKhachHang" id="maKhachHang" >
                        			<c:forEach var="u" items="${listUser}">
								    	<option value="${u.maNguoiDung}" <c:if test="${hoaDon.maKhachHang == u.maNguoiDung }">selected</c:if>>${u.maNguoiDung}</option>
							  		</c:forEach>
							  	</select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Số điện thoại khách hàng<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <input
                            type="text"
                            class="form-control"
                            id="soDienThoai"
                            name="soDienThoai"
                            value="${hoaDon.soDienThoai}"
                          />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Tổng thanh toán<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <input
                            type="text"
                            class="form-control"
                            id="tongThanhToan"
                            name="tongThanhToan"
                            value="${hoaDon.tongThanhToan}"
                          />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Thời gian giao hàng<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <input
                            type="date"
                            class="form-control"
                            id="thoiGianGiaoHang"
                            name="thoiGianGiaoHang"
                            value="${hoaDon.thoiGianGiaoHang}"
                          />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Địa chỉ giao hàng<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <input
                            type="text"
                            class="form-control"
                            id="diaChiGiaoHang"
                            name="diaChiGiaoHang"
                            value="${hoaDon.diaChiGiaoHang}"
                          />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Trạng thái đơn hàng<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <select  name="trangThaiDonHang" id="trangThaiDonHang" >
                            <option value="false" <c:if test="${!hoaDon.trangThaiDonHang}">selected</c:if>>Chờ xử lí</option>
                            <option value="true" <c:if test="${hoaDon.trangThaiDonHang}">selected</c:if>>Đã đã duyệt</option>
                           </select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Trạng thái giao hàng<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <select  name="trangThaiGiaoHang" id="trangThaiGiaoHang" >
                            <option value="false" <c:if test="${!hoaDon.trangThaiGiaoHang}">selected</c:if>>Chờ giao hàng</option>
                            <option value="true" <c:if test="${hoaDon.trangThaiGiaoHang}">selected</c:if>>Đã giao hàng</option>
                           </select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Trạng thái thanh toán<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <select  name="trangThaiThanhToan" id="trangThaiThanhToan" >
                                <option value="false" <c:if test="${!hoaDon.trangThaiThanhToan}">selected</c:if>>Chờ thanh toán</option>
                                <option value="true" <c:if test="${hoaDon.trangThaiThanhToan}">selected</c:if>>Đã thanh toán</option>
                        </select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Ghi chú<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                         <input
                            type="text"
                            class="form-control"
                            id="ghiChu"
                            name="ghiChu"
                            value="${hoaDon.ghiChu}"
                          />
          
                        </div>
                      </div>
                      
                      
                      <div class="form-group row">
                        <div class="col-lg-8 ml-auto">
                          <button type="submit" class="btn btn-primary">
                            Update
                          </button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- #/ container -->
       
      </div>
      <!--**********************************
            Content body end
        ***********************************-->

      <!--**********************************
            Footer start
        ***********************************-->
      <div class="footer">
        <div class="copyright">
          <p>
            Copyright &copy; Designed & Developed by
            <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018
          </p>
        </div>
      </div>
      <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="/QUANLYHOACU/static/admin/plugins/common/common.min.js"></script>
    <script src="/QUANLYHOACU/static/admin/js/custom.min.js"></script>
    <script src="/QUANLYHOACU/static/admin/js/settings.js"></script>
    <script src="/QUANLYHOACU/static/admin/js/gleek.js"></script>
    <script src="/QUANLYHOACU/static/admin/js/styleSwitcher.js"></script>

    <script src="/QUANLYHOACU/static/admin/plugins/validation/jquery.validate.min.js"></script>
    <script src="/QUANLYHOACU/static/admin/plugins/validation/jquery.validate-init.js"></script>
  </body>
</html>
