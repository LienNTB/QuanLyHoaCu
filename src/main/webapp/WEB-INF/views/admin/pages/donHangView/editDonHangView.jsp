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
        var soDienThoai=document.forms["editHoaDon"]["soDienThoai"].value;
        var diaChiGiaoHang=document.forms["editHoaDon"]["diaChiGiaoHang"].value;
        if(soDienThoai=="" ||diaChiGiaoHang=="" )
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
                <a href="javascript:void(0)">Edit đơn hàng</a>
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
                    <form name ="editHoaDon"  class="form-valide" action="#" method="post" onsubmit=" return validateForm();">
                    <input type="hidden" name="maHoaDon" value="${hoaDon.maHoaDon}" >
                    <input type="hidden" name="tongThanhToan" value="${hoaDon.tongThanhToan}" >
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-orderId"
                          >Mã đơn hàng <span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
 							<label class="col-lg-4 col-form-label" for="val-orderId"
                          	>${hoaDon.maHoaDon } </label>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Mã khách hàng <span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
      								<select name="maKhachHang" id="maKhachHang" >
                        			<c:forEach var="u" items="${listUser}">
								    	<option value="${u.maNguoiDung}" <c:if test="${hoaDon.maKhachHang == u.maNguoiDung }">selected</c:if>>${u.maNguoiDung}</option>
							  		</c:forEach>
							  	</select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Số điện thoại khách hàng<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <input
                            type="text"
                            class="form-control"
                            id="soDienThoai"
                            name="soDienThoai"
                            value="${hoaDon.soDienThoai}"
                          />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Tổng thanh toán<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <label  class="col-lg-4 col-form-label" for="val-orderId"
                          	>${hoaDon.tongThanhToan } </label>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Thời gian giao hàng<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <input
                            type="date"
                            class="form-control"
                            id="thoiGianGiaoHang"
                            name="thoiGianGiaoHang"
                            value="${hoaDon.thoiGianGiaoHang}"
                          />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Địa chỉ giao hàng<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <input
                            type="text"
                            class="form-control"
                            id="diaChiGiaoHang"
                            name="diaChiGiaoHang"
                            value="${hoaDon.diaChiGiaoHang}"
                          />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Trạng thái đơn hàng<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <select  name="trangThaiDonHang" id="trangThaiDonHang" >
                            <option value="false" <c:if test="${!hoaDon.trangThaiDonHang}">selected</c:if>>Chờ xử lí</option>
                            <option value="true" <c:if test="${hoaDon.trangThaiDonHang}">selected</c:if>>Đã đã duyệt</option>
                           </select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Trạng thái giao hàng<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <select  name="trangThaiGiaoHang" id="trangThaiGiaoHang" >
                            <option value="false" <c:if test="${!hoaDon.trangThaiGiaoHang}">selected</c:if>>Chờ giao hàng</option>
                            <option value="true" <c:if test="${hoaDon.trangThaiGiaoHang}">selected</c:if>>Đã giao hàng</option>
                           </select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Trạng thái thanh toán<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                          <select  name="trangThaiThanhToan" id="trangThaiThanhToan" >
                                <option value="false" <c:if test="${!hoaDon.trangThaiThanhToan}">selected</c:if>>Chờ thanh toán</option>
                                <option value="true" <c:if test="${hoaDon.trangThaiThanhToan}">selected</c:if>>Đã thanh toán</option>
                        </select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="val-email"
                          >Ghi chú<span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-6">
                         <input
                            type="text"
                            class="form-control"
                            id="ghiChu"
                            name="ghiChu"
                            value="${hoaDon.ghiChu}"
                          />
          
                        </div>
                      </div>
                      
                      
                      <div class="form-group row">
                        <div class="col-lg-8 ml-auto">
                          <button type="submit" class="btn btn-primary">
                            Update
                          </button>
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
