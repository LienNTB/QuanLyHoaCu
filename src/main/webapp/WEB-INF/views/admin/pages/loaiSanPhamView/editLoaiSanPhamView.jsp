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
        var maLSP=document.forms["editLoaiSPForm"]["maLoaiSP"].value;
        var tenLSP=document.forms["editLoaiSPForm"]["tenLoaiSanPham"].value;
        if(maLSP=="" || tenLSP=="" )
        {
          alert("Vui lòng nhập đầy đủ thông tin!");
          return false;
        }
        return true;
      
      }
      </script>
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
                <a href="javascript:void(0)">Edit loại sản phẩm</a>
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
                    <form class="form-valide" method="POST" action="${pageContext.request.contextPath}/EditLoaiSanPham" name ="editLoaiSPForm" onsubmit=" return validateForm();">
                      <div class="form-group row">
                        <label
                          class="col-lg-4 col-form-label"
                          for="val-productTypeId"
                          >Mã loại sản phẩm <span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <input
                            type="text"
                            class="form-control"
                            id="maLoaiSP"
                            name="maLoaiSP"
                            value="${loaiSanPham.maLoaiSP}"
                          />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Tên loại sản phẩm <span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <input
                            type="text"
                            class="form-control"
                            id="tenLoaiSanPham"
                            name="tenLoaiSanPham"
                            value="${loaiSanPham.tenLoaiSanPham}"
                          />
                        </div>
                      </div>

                      <div class="form-group row">
                        <div class="col-lg-8 ml-auto">
 							<input type="submit" class="btn btn-primary" value="Cập nhật" >
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
