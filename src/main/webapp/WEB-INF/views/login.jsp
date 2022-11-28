<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    
    <style type="text/css">
		<%@ include file="css/login.css" %>
		<%@ include file="js/login.js" %>
	</style>
  </head>
  <body>
    <div class="container" id="container">
      <div class="form-container sign-up-container">
        <form action="HomePage">
          <h1>Create Account</h1>
          <input type="text" placeholder="Username" />
          <input type="password" placeholder="Password" />
          <input type="password" placeholder="Retype Password" />
          <input type="text" placeholder="Name" />
          <input type="date" placeholder="Date Birth" />
          <input type="text" placeholder="Address" />
          <button>Sign Up</button>
        </form>
      </div>
      <div class="form-container sign-in-container">
        <form action="HomePage">
          <h1>Sign in</h1>
          <input type="email" placeholder="Email" />
          <input type="password" placeholder="Password" />
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
        Created with <i class="fa fa-heart"></i> by
        <a target="_blank" href="https://florin-pop.com">Florin Pop</a>
        - Read how I created this and how you can join the challenge
        <a
          target="_blank"
          href="https://www.florin-pop.com/blog/2019/03/double-slider-sign-in-up-form/"
          >here</a
        >.
      </p>
    </footer>
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
  </body>
</html>