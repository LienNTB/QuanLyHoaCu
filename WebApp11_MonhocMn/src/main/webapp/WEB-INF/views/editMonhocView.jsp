<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Edit Môn học</title>
  </head>
  <body>
    <h3>Edit Môn học</h3>

    <p style="color: red">${errorString}</p>

    <c:if test="${not empty monhoc}">
      <form
        method="POST"
        action="${pageContext.request.contextPath}/editMonhoc"
      >
        <input type="hidden" name="maso_monhoc" value="${monhoc.maso_monhoc}" />
        <table border="0">
          <tr>
            <td>Mã môn học</td>
            <td style="color: red">${monhoc.maso_monhoc}</td>
          </tr>
          <tr>
            <td>Tên môn học</td>
            <td>
              <input type="text" name="ten_monhoc" value="${monhoc.ten_monhoc}" />
            </td>
          </tr>
          <tr>
            <td>Số tín chỉ</td>
            <td>
              <input type="text" name="sotinchi" value="${monhoc.sotinchi}" />
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <input type="submit" value="Submit" />
              <a href="${pageContext.request.contextPath}/editMonhoc">Cancel</a>
            </td>
          </tr>
        </table>
      </form>
    </c:if>

    <jsp:include page="_footer.jsp"></jsp:include>
  </body>
</html>
