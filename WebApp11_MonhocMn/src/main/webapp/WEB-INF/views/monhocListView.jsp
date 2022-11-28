<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>Danh sách môn học</title>
    <script type="text/javascript">
      function testConfirmDialog(id) {
        var result = confirm("Bạn chắc chắn muốn xóa môn học này?");

        if (result) {
          window.location.href = "deleteMonhoc?id=" + id;
        } else {
          return false;
        }
      }
    </script>
  </head>
  <body>
    <h3>Danh sách môn học</h3>
    <p style="color: red">${errorString}</p>
    <table border="1" cellpadding="5" cellspacing="1">
      <tr>
        <th>Mã môn học</th>
        <th>Tên môn học</th>
        <th>Số tín chỉ</th>
      </tr>
      <c:forEach items="${monhocList}" var="monhoc">
        <tr>
          <td>${monhoc.maso_monhoc}</td>
          <td>${monhoc.ten_monhoc}</td>
          <td>${monhoc.sotinchi}</td>
          <td>
            <a href="editMonhoc?id=${monhoc.maso_monhoc}">Edit</a>
          </td>
          <td>
            <a href="#" onclick="testConfirmDialog(${monhoc.maso_monhoc});"
              >Delete</a
            >
          </td>
        </tr>
      </c:forEach>
    </table>
    <a href="createMonhoc">Thêm môn học</a>
    <jsp:include page="_footer.jsp"></jsp:include>
  </body>
</html>
