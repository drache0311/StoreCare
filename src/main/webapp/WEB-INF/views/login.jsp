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
  <form action="login.do" method="post">
    <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">StoreCare</h1>
    <label for="inputId" class="visually-hidden">Phone Number</label>
    <input type="text" id="inputId" name="id" class="form-control" placeholder="010-0000-0000" required autofocus>
    <button class="w-100 btn btn-lg btn-primary" type="submit" value="로그인" >Sign In</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017-2020</p>
  </form>
</main>


    
  </body>
</html>
