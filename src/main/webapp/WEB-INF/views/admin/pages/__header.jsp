<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <!-- Favicon icon -->
    <link
      rel="icon"
      type="image/png"
      sizes="10x10"
      href="/QUANLYHOACU/static/admin/images/logo-icon.png"
    />
    
    <link
      href="/QUANLYHOACU/static/admin/./plugins/pg-calendar/css/pignose.calendar.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="/QUANLYHOACU/static/admin/./plugins/chartist/css/chartist.min.css" />
    <link rel="stylesheet" href="/QUANLYHOACU/static/admin/./css/adminpage.css" />
    <link
      rel="stylesheet"
      href="/QUANLYHOACU/static/admin/./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css"
    />
    <link href="/QUANLYHOACU/static/admin/css/style.css" rel="stylesheet" />
    <!-- Custom Stylesheet -->
    <link href="/QUANLYHOACU/static/admin/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="/QUANLYHOACU/static/admin/css/adminpage.css" />
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
            <img src="/QUANLYHOACU/static/admin/images/logo.png" alt="" />
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
              <li class="icons dropdown">Admin</li>
              <li class="icons dropdown">
                <div
                  class="user-img c-pointer position-relative"
                  data-toggle="dropdown"
                >
                  <span class="activity active"></span>
                  <img src="/QUANLYHOACU/static/admin/images/admin.png" height="40" width="40" alt="" />
                </div>
                <div
                  class="drop-down dropdown-profile animated fadeIn dropdown-menu"
                >
                  <div class="dropdown-content-body">
                    <ul>
                      <li>
                        <a href="/QUANLYHOACU/DoiMatKhau"
                          ><i class="icon-user"></i> <span>Đổi mật khẩu</span></a
                        >
                      </li>
                 
                      <li>
                        <a href="/QUANLYHOACU/DangXuat"
                          ><i class="icon-key"></i> <span>Đăng xuất</span></a
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
      <c:if test="${not empty notification}">
	    <script type="text/javascript">
		         alert("${notification}");
	    </script>
	</c:if>
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
