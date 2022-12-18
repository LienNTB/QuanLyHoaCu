<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Art Store</title>
        <link rel="stylesheet" href="/QUANLYHOACU/static/allUser/css/login.css" />
	<script type="text/javascript">
      function validateSignUpForm()
      {
        var username=document.forms["SignUpForm"]["Username"].value;
        var password=document.forms["SignUpForm"]["Password"].value;
        var Repassword=document.forms["SignUpForm"]["Repassword"].value;
        if (username=="" || password=="")
        {
          alert("Vui lòng nhập tên đăng nhập và mật khẩu");
          return false;
        }
        if (password.length()<=4)
        {
          alert("Mật khẩu quá ngắn!");
                    return false;
        }
        if (password!=Repassword)
        {
          alert("Mật khẩu và xác nhận mật khẩu không giống nhau!");
          return false;
        }
        return true;
      
      }
      function validateSignInForm()
      {
        var username=document.forms["SignInForm"]["Username"].value;
        var password=document.forms["SignInForm"]["Password"].value;
  
        if (username=="" || password=="")
        {
          alert("Vui lòng nhập tên đăng nhập và mật khẩu");
          return false;
        }
        return true;
      
      }
    </script>
  </head>
  <body>
  	<c:if test="${not empty loginError}">
	    <script type="text/javascript">
		         alert("${loginError}");
	    </script>
	</c:if>
    <div class="container" id="container">
      <div class="form-container sign-up-container">
        <form action="SignUp"  method="post" name="SignUpForm" onsubmit="validateSignUpForm()">
          <h1>Create Account</h1>
          <input type="text" placeholder="Username" name="Username"  />
          <input type="password" placeholder="Password" name="Password" />
          <input type="password" placeholder="Retype Password" name="Repassword" />
          <input type="text" placeholder="Name"  name="Name"/>
          <input type="date" placeholder="Date Birth" name="Birthday" value="2022-01-01" />
          <input type="text" placeholder="Address" name="Address" />
          <button>Sign Up</button>
        </form>
      </div>
      <div class="form-container sign-in-container" >
        <form action=${pageContext.request.contextPath}/Login method="post" name="SignInForm" onsubmit="validateSignInForm()">
          <h1>Sign in</h1>
          <input type="text" placeholder="Username" name="Username" />
          <input type="password" placeholder="Password" name="Password" />
          <a href="#">Forgot your password?</a>
          <button>Sign In</button>
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
            <p>Enter your personal details and start journey with us</p>
            <button class="ghost" id="signUp">Sign Up</button>
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
	    <script src="/QUANLYHOACU/static/allUser/./js/login.js"></script>
	
</body>
</html>
