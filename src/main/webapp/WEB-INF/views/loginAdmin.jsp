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
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
  </head>
<body class="text-center" style="font-family:Spoqa Han Sans Neo, sans-serif">
    
<main class="form-signin">
  <form action="loginAdmin.do" method="post" autocomplete="off">
    <img class="mb-4" src="<%=request.getContextPath()%>/resources/icon/icu-logo.png" alt="" width="150" height="130">
    <h1 class="h3 mb-3 fw-normal">I Care U</h1>
    <label for="inputId" class="visually-hidden">ID</label>
    <input type="text" id="inputId" name="id" class="form-control" placeholder="Your ID" required autofocus>
    <label for="inputPassword" class="visually-hidden">Password</label>
    <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
    <button class="w-100 btn btn-lg btn-secondary" type="submit" value="로그인" >Sign In</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2021</p>
  </form>
</main>


    
  </body>
</html>
