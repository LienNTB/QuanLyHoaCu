<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Art Store - Admin</title>

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
          <a href="Admin_HomePage">
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
        <div class="container-fluid mt-3">
          <div class="row">
            <div class="col-lg-3 col-sm-6">
              <div class="card gradient-1">
                <div class="card-body">
                  <h3 class="card-title text-white">Tổng số hóa đơn</h3>
                  <div class="d-inline-block">
                    <h2 class="text-white">4565</h2>
                    <p class="text-white mb-0">Tháng 9 - Tháng 12 2022</p>
                  </div>
                  <span class="float-right display-5 opacity-5"
                    ><i class="fa fa-shopping-cart"></i
                  ></span>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-sm-6">
              <div class="card gradient-2">
                <div class="card-body">
                  <h3 class="card-title text-white">Tổng doanh thu</h3>
                  <div class="d-inline-block">
                    <h2 class="text-white">$ 8541</h2>
                    <p class="text-white mb-0">Tháng 9 - Tháng 12 2022</p>
                  </div>
                  <span class="float-right display-5 opacity-5"
                    ><i class="fa fa-money"></i
                  ></span>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-sm-6">
              <div class="card gradient-3">
                <div class="card-body">
                  <h3 class="card-title text-white">Số lượng sản phẩm</h3>
                  <div class="d-inline-block">
                    <h2 class="text-white">4565</h2>
                    <p class="text-white mb-0">Tháng 9 - Tháng 12 2022</p>
                  </div>
                  <span class="float-right display-5 opacity-5"
                    ><i class="fa fa-users"></i
                  ></span>
                </div>
              </div>
            </div>
            <div class="revenue">
              <div class="revenue-item col-lg-4 col-sm-6">
                <div class="card gradient-4">
                  <div class="card-body">
                    <h3 class="card-title text-white">
                      Tổng doanh thu theo ngày
                    </h3>
                    <div class="d-inline-block">
                      <h2 class="text-white">99%</h2>
                      <p class="text-white mb-0">${dateTimeNow}
					</p>
                    </div>
                    <span class="float-right display-5 opacity-5"
                      ><i class="fa fa-heart"></i
                    ></span>
                  </div>
                </div>
              </div>
              <div class="revenue-item col-lg-4 col-sm-6">
                <div class="card gradient-4">
                  <div class="card-body">
                    <h3 class="card-title text-white">
                      Tổng doanh thu theo tháng
                    </h3>
                    <div class="d-inline-block">
                      <h2 class="text-white">99%</h2>
                      <p class="text-white mb-0">Tháng 12 - 2022</p>
                    </div>
                    <span class="float-right display-5 opacity-5"
                      ><i class="fa fa-heart"></i
                    ></span>
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

    <!-- Chartjs -->
    <script src="/QUANLYHOACU/static/admin/./plugins/chart.js/Chart.bundle.min.js"></script>
    <!-- Circle progress -->
    <script src="/QUANLYHOACU/static/admin/./plugins/circle-progress/circle-progress.min.js"></script>
    <!-- Datamap -->
    <script src="/QUANLYHOACU/static/admin/./plugins/d3v3/index.js"></script>
    <script src="/QUANLYHOACU/static/admin/./plugins/topojson/topojson.min.js"></script>
    <script src="/QUANLYHOACU/static/admin/./plugins/datamaps/datamaps.world.min.js"></script>
    <!-- Morrisjs -->
    <script src="/QUANLYHOACU/static/admin/./plugins/raphael/raphael.min.js"></script>
    <script src="/QUANLYHOACU/static/admin/./plugins/morris/morris.min.js"></script>
    <!-- Pignose Calender -->
    <script src="/QUANLYHOACU/static/admin/./plugins/moment/moment.min.js"></script>
    <script src="/QUANLYHOACU/static/admin/./plugins/pg-calendar/js/pignose.calendar.min.js"></script>
    <!-- ChartistJS -->
    <script src="/QUANLYHOACU/static/admin/./plugins/chartist/js/chartist.min.js"></script>
    <script src="/QUANLYHOACU/static/admin/./plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>

    <script src="/QUANLYHOACU/static/admin/./js/dashboard/dashboard-1.js"></script>
  </body>
</html>
    