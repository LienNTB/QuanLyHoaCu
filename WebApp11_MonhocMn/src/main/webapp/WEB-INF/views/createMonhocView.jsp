<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Thêm mới môn học</title>
    <!-- <style type="text/css"> 
		label { 
		 color: red; 
		}		
		</style> 
	<style><%@include file="/WEB-INF/css/main.css"%></style>-->
    <script type="text/javascript">
      function validateForm() {
        var x = document.forms["createMhForm"]["maso_monhoc"].value;
        var y = document.forms["createMhForm"]["ten_monhoc"].value;
        var z = document.forms["createMhForm"]["sotinchi"].value;
        if (x == "") {
          alert("Vui lòng mã môn học!");
          return false;
        }
        if (y == "") {
          alert("Vui lòng nhập tên môn học!");
          return false;
        }
        if (z == "") {
          alert("Vui lòng nhập số tín chỉ!");
          return false;
        } else return true;
      }
    </script>
  </head>
  <body>
    <h3>Thêm mới môn học</h3>
    <p style="color: red">${errorString}</p>

    <form
      method="POST"
      action="${pageContext.request.contextPath}/createMonhoc"
      name="createMhForm"
      onsubmit="return validateForm()"
    >
      <table border="0">
        <tr>
          <td>Mã môn học</td>
          <td><input type="text" name="maso_monhoc" /></td>
        </tr>
        <tr>
          <td>Tên môn học</td>
          <td><input type="text" name="ten_monhoc"/></td>
          <td><label>*</label></td>
        </tr>
        <tr>
          <td>Số tín chỉ</td>
          <td><input type="text" name="sotinchi" /></td>
        </tr>
        <tr>
          <td colspan="2">
            <input type="submit" value="Submit" />
            <a href="${pageContext.request.contextPath}/monhocList">Cancel</a>
          </td>
        </tr>
      </table>
    </form>
    <jsp:include page="_footer.jsp"></jsp:include>
  </body>
</html>
