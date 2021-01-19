<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>Store Care</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/signin.css" rel="stylesheet">
  </head>
<body class="text-center">
    
<main class="form-signin">
  <form action="login.do" method="post" autocomplete="off">
    <img class="mb-4" src="<%=request.getContextPath()%>/resources/icon/icu-logo.png" alt="" width="150" height="130">
    <h1 class="h3 mb-3 fw-normal">I Care U</h1>
    <label for="inputId" class="visually-hidden">Phone Number</label>
    <input type="text"  maxlength="11" onKeyUp="isNumber(this)" id="inputId" name="id" class="form-control" placeholder="01012345678" required autofocus>
    <button id="searchId" class="w-100 btn btn-lg btn-secondary" type="submit" value="로그인" >Sign In</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2021</p>
  </form>
</main>






<!-- SCRIPT ---------------------------------------------------------- -->
<!-- Custom JavaScript for this theme -->
<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/id-check.js"></script>
<!-- SCRIPT END---------------------------------------------------------- -->
  </body>
</html>
