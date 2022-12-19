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
    <!-- Favicon icon -->

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
                <a href="javascript:void(0)">Quản lí loại sản phẩm</a>
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
                  <h4 class="card-title">QUẢN LÍ LOẠI SẢN PHẨM</h4>
                  <a href="ThemLoaiSanPham">
                    <button type="button" class="btn mb-1 btn-primary">Thêm loại sản phẩm mới</button>
                  </a>
                  <br/>
                  <br />
                  <div class="table-responsive">
                    <table class="table table-bordered verticle-middle">
                      <thead>
                        <tr>
                          <th scope="col">Product Type ID</th>
                          <th scope="col">Product Type Name</th>
                          <th scope="col">Actions</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="lsp" items="${loaiSanPhamlist}">
                        <tr>
                          <td>${lsp.maLoaiSP}</td>
                          <td>${lsp.tenLoaiSanPham}</td>
                          <td >
                           
                              <a class="action-item"
                                href="EditLoaiSanPham?id=${lsp.maLoaiSP }"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Edit"
                                ><i
                                  class="fa fa-pencil color-muted m-r-5"
                                ></i> </a
                              >
                              <a
                                href="DeleteLoaiSanPham?id=${lsp.maLoaiSP }"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Delete"
                             ><i class="fa fa-close color-danger"></i></a
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
</html>