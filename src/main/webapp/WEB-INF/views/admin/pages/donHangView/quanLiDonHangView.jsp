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
  </head>

  <body>
      <jsp:include page="/WEB-INF/views/admin/pages/__header.jsp"/>

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
                <a href="javascript:void(0)">Quản lí đơn hàng</a>
              </li>
            </ol>
          </div>
        </div>
        <!-- row -->

        <div class="container-fluid">
          <div class="row">
            <div class="product-mng col-lg-13">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">QUẢN LÍ ĐƠN HÀNG</h4>
                  <a href="ThemDonHang">
                    <button type="button" class="btn mb-1 btn-primary">Thêm đơn hàng mới</button>
                  </a>
                  <br/>
                  <br/>
                  <div class="table-responsive">    
                    <table class="table table-bordered verticle-middle">
                      <thead>
                        <tr>
                          <th scope="col">Actions</th>
                          <th scope="col">Số thứ tự</th>
                          <th scope="col">Mã đơn hàng</th>
                          <th scope="col">Mã khách hàng</th>
                          <th scope="col">Số điện thoại</th>
                          <th scope="col">Tổng thanh toán</th>
                          <th scope="col">Thời gian giao hàng</th>
                          <th scope="col">Trạng thái đơn hàng</th>
                          <th scope="col">Trạng thái giao hàng</th>
                          <th scope="col">Trạng thái thanh toán</th>
                          <th scope="col">Ghi chú</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="dh" items="${hoaDonList}" varStatus="loop">
                        <tr>
                           <td >
                           
                              <a class="action-item"
                                href="EditDonHang?id=${dh.maHoaDon}"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Edit"
                                ><i
                                  class="fa fa-pencil color-muted m-r-5"
                                ></i> </a
                              >
                              
                            </td>
                          <td>${loop.index+1}</td>
                          <td>${dh.maHoaDon}</td>
                          <td>${dh.maKhachHang}</td>
                          <td>${dh.soDienThoai}</td>
                          <td>${dh.tongThanhToan}</td>
                          <td>${dh.thoiGianGiaoHang}</td>
                          <td>${dh.meanTrangThaiDonHang()}</td>
                          <td>${dh.meanTrangThaiGiaoHang()}</td>
                          <td>${dh.meanTrangThaiThanhToan()}</td>
                          <td>${dh.ghiChu}</td>
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
