<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>
    
    </title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/QUANLYHOACU/static/admin/images/favicon.png" />
    <!-- Custom Stylesheet -->
    <link href="/QUANLYHOACU/static/admin/css/style.css" rel="stylesheet" />
    <link
      rel="icon"
      type="image/png"
      sizes="10x10"
      href="/QUANLYHOACU/static/admin/images/logo-icon.png"
    />
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
          <div class="header-left">
         
          </div>
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
                <a href="javascript:void(0)">Quản lí sản phẩm</a>
              </li>
            </ol>
          </div>
        </div>
        <!-- row -->

        <div class="container-fluid">
          <div class="row">
            <div class="product-mng col-lg-6">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">QUẢN LÍ SẢN PHẨM</h4>
                  <a href="ThemSanPham">
                    <button type="button" class="btn mb-1 btn-primary">Thêm sản phẩm mới</button>
                  </a>
                  <br/>
                  <br/>
                  <div class="table-responsive">    
                    <table class="table table-bordered verticle-middle">
                      <thead>
                        <tr>
                          <th scope="col">Product ID</th>
                          <th scope="col">Product Name</th>
                          <th scope="col">Price</th>
                          <th scope="col">Detail</th>
                          <th scope="col">Image</th>
                          <th scope="col">Product Type</th>
                          <th scope="col">Actions</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="sp" items="${sanPhamList }" >
                        <tr>
                          <td>${sp.maSP }</td>
                          <td>${sp.tenSP }</td>
                          <td>${sp.gia }</td>
                          <td>${sp.chiTiet }</td>
                          <td>${sp.hinh }</td>
                          <td>${sp.maLoaiSP }</td>
                          <td >
                           
                              <a class="action-item"
                                href="EditSanPham?id=${sp.maSP }"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Edit"
                                ><i
                                  class="fa fa-pencil color-muted m-r-5"
                                ></i> </a
                              >
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
  </body>
</html>
