<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Danh mục sản phẩm </title>
    
    <script type="text/javascript">
      function ConfirmDialog(id)
      {
        var message=confirm("Bạn có chắc muốn xóa sản phẩm không?");
        if (result) {
          window.location.href = "deleteSanPham?id=" + id;
        } else {
          return false;
        }
      }
      function handleSearch() {
          var text = document.getElementById("search").value;
          window.location.href = "QuanLiSanPham?text=" + text;
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
                <a href="javascript:void(0)">Quản lí sản phẩm</a>
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
                  <h4 class="card-title">QUẢN LÍ SẢN PHẨM</h4>
                  <a href="ThemSanPham">
                    <button type="button" class="btn mb-1 btn-primary">Thêm sản phẩm mới</button>
                  </a>  
                  <div class="input-area">
                     <input type="text" class="form-control input-default" id="search" placeholder="Input Default">
                     <button type="button" class="btn mb-1 btn-primary" onclick="handleSearch()">Tìm kiếm</button>
                   </div>
					<br/>
		
                  <div class="table-responsive">    
                    <table class="table table-bordered verticle-middle">
                      <thead>
                        <tr>
                        	<th scope="col">Actions</th>
                        	<th scope="col">Số thứ tự</th>
	                        <th scope="col">Mã sản phẩm</th>
	                        <th scope="col">Tên sản phẩm</th>
	                        <th scope="col">Giá</th>
	                        <th scope="col">Loại sản phẩm</th>
	                        <th scope="col">Chi tiết</th>
	                        <th scope="col">Link hình ảnh</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="sp" items="${sanPhamList }" varStatus ="loop" >
                        <tr>

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
                              <c:if  test="${sp.getDaXoa() }">
                              <a
                                href="ChangDeleteStatus?object=sanpham&&id=${sp.maSP }&&mode=${sp.daXoa}"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="UnDelete"
                                onclick="ConfirmDialog(${sp.maSP});" class="fa fa-close color-danger"></a>
                               </c:if>
                              <c:if  test="${!sp.getDaXoa() }">
                              <a
                                href="ChangDeleteStatus?object=sanpham&&id=${sp.maSP }&&mode=${sp.daXoa}"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Delete"
                                 class="fa fa-close color-danger"></a>
                               </c:if>
                         
                          </td>
                        <td>${loop.index+1 }</td>
                          	<td>${sp.maSP }</td>
                          	<td>${sp.tenSP }</td>
                          	<td>${sp.gia }</td>
                          	<td>${sp.tenLoaiSanPham }</td>
                          	<td>${sp.chiTiet }</td>
                          	<td>${sp.hinh }</td>
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
