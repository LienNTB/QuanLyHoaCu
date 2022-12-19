<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Art Store</title>
        <link rel="stylesheet" href="/QUANLYHOACU/static/allUser/css/login.css" />
     <script type="text/javascript">
	     function validateSignUpForm()
	     {

	       var username=document.forms["ChangePasswordForm"]["Username"].value;
	       var oldpassword=document.forms["ChangePasswordForm"]["oldPassword"].value;
	       var newPassword=document.forms["ChangePasswordForm"]["newPassword"].value;
	       var reNewPassword=document.forms["ChangePasswordForm"]["reNewRepassword"].value;
	       if (username=="" || oldPassword=="" || newPassword=="" || reNewPassword=="")
	       {
	         alert("Vui lòng nhập đầy đủ thông tin")
	         return false;
	       }
	       if (newPassword!=reNewPassword)
	       {
	         alert("Mật khẩu và xác nhận mật khẩu không giống nhau!")
	         return false;
	       }
	       return true;
	     
	     }
     </script>
</head>
<body>
	<c:if test="${not empty notification}">
	    <script type="text/javascript">
		         alert("${notification}");
	    </script>
	</c:if>
	    <div class="container" id="container">
			<div class="form-container sign-in-container" >
	        <form action="DoiMatKhau"  method="post" name="ChangePasswordForm" onsubmit="validateSignUpForm()">
	          <h1>Đổi mật khẩu</h1>
	          <c:if test="${user==null}">
	          	<input type="text" placeholder="Tên đăng nhập" name="Username" />
	          </c:if>
	         <c:if test="${not (user==null)}">
	          	<input type="text" value="${user.tenDangNhap}" name="Username" />
	          </c:if>
	          <input type="password" placeholder="Mật khẩu cũ" name="oldPassword" />
	          <input type="password" placeholder="Mật khẩu mới" name="newPassword" />
	          <input type="password" placeholder="Nhập lại mật khẩu mới" name="reNewPassword" />
	          <a href="Login">Login</a>
	          <button>Đổi mật khẩu</button>
	        </form>
	      </div>
	      <div class="overlay-container">
	        <div class="overlay">
	          <div class="overlay-panel overlay-left">
	            <h1>Welcome Back!</h1>
	            <p>
	              To keep connected with us please login with your personal info
	            </p>
	            <button class="ghost" id="signIn">Sign In</button>
	          </div>
	          <div class="overlay-panel overlay-right">
	            <h1>Hello, Friend!</h1>
	          </div>
	        </div>
	      </div>
      </div>
  
     	<footer>
		<p>
			<span class="copyright"> Bản quyền &copy; thuộc về nhóm lập
						trình web | Được tạo bởi Hương, Phát, Liên </span>
		</p>
	</footer>
</body>
</html>