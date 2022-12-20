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
 <script type="text/javascript">
 
 function handleSearch() {
     var text = document.getElementById("search").value;
     window.location.href = "QuanLiKhachHang?text=" + text;
   }
    </script>
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
                <a href="javascript:void(0)">Quản lí khách hàng</a>
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
                  <h4 class="card-title">QUẢN LÍ KHÁCH HÀNG</h4>
                  <a href="ThemKhachHang">
                    <button type="button" class="btn mb-1 btn-primary">Thêm khách hàng mới</button>
                  </a>
                  <div class="input-area">
                     <input type="text" class="form-control input-default" id="search" placeholder="Input Default">
                     <button type="button" class="btn mb-1 btn-primary" onclick="handleSearch()">Tìm kiếm</button>
                   </div>
                  <br/>
                  <br/>
                  <div class="table-responsive">    
                    <table class="table table-bordered verticle-middle">
                      <thead>
                        <tr>
                          <th scope="col">Mã người dùng</th>
                          <th scope="col">Tên đăng nhập</th>
                          <th scope="col">Họ tên</th>
                          <th scope="col">Ngày sinh</th>
                          <th scope="col">Địa chỉ</th>
                          <th scope="col">Actions</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="user" items="${users}">
                        <tr>
                          	<td>${user.maNguoiDung}</td>
                          	<td>${user.tenDangNhap}</td>
                        	<td>${user.hoTen}</td>
                          	<td>${user.ngaySinh}</td>
                          	<td>${user.diaChi}</td>
                          	<td >
                           
                              <a class="action-item"
                                href="EditKhachHang?id=${user.maNguoiDung}"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="EditKhachHang"
                                ><i
                                  class="fa fa-pencil color-muted m-r-5"
                                ></i> </a
                              >
     
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
