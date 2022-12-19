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

  </head>

  <body>
     <jsp:include page="__header.jsp"/>

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
    