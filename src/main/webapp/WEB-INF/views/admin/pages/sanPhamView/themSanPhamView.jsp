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
        var maSP=document.forms["createSanPhamForm"]["maSP"].value;
        var tenSP=document.forms["createSanPhamForm"]["tenSP"].value;
        var gia=document.forms["createSanPhamForm"]["gia"].value;
        var chiTiet=document.forms["createSanPhamForm"]["chiTiet"].value;
        if(maSP=="" || tenSP=="" || gia=="" || chiTiet=="")
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
                <a href="javascript:void(0)">Thêm sản phẩm</a>
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
                    <form method="POST" action="${pageContext.request.contextPath}/ThemSanPham" name="createSanPhamForm" onsubmit=" return validateForm();">  
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-productName"
                          >Mã sản phẩm <span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <input
                            type="text"
                            class="form-control"
                            id="maSP"
                            name="maSP"
                          />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-productName"
                          >Tên sản phẩm <span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <input
                            type="text"
                            class="form-control"
                            id="tenSP"
                            name="tenSP"
                          />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="price"
                          >Giá <span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <input
                            type="text"
                            class="form-control"
                            id="gia"
                            name="gia"
     
                          />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label
                          class="col-lg-4 col-form-label"
                          for="val-confirm-password"
                          >Loại sản phẩm<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          		<select name="maLoaiSanPham" id="maLoaiSanPham" >
                        			<c:forEach var="lsp" items="${loaiSanPham}">
                        			<%String selectedStr="lsp00"; %>
								    	          <option value="${lsp.maLoaiSP}"  <c:if test="${lsp.maLoaiSP==selectedStr }">selected</c:if>>${lsp.tenLoaiSanPham}</option>
							  		          </c:forEach>
							  	</select>
						</div>

                        </div>
                      <div class="form-group row">
                        <label
                          class="col-lg-4 col-form-label"
                          for="val-confirm-password"
                          >Chi Tiết
                        </label>
                        <div class="col-lg-6">
                          <input
                            class="form-control"
                            id="chiTiet"
                            name="chiTiet"
                          />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label
                          class="col-lg-4 col-form-label"
                          for="val-suggestions"
                          >Link hình ảnh</label>	
                        <div class="col-lg-6">
                          <div class="basic-form">
                              <div class="form-group">
                                <input type="text" class="form-control-file" name="hinh"  />
                              </div>
                          </div>
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="col-lg-8 ml-auto">
                          <input type="submit" class="btn btn-primary" value="Thêm" >
                           
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
