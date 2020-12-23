<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>Sign UP</title>

	<!-- Bootstrap core CSS -->
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

	
	<!-- Custom styles for this template -->
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/signup.css" rel="stylesheet">
	 
	<script src="/resources/vendor/jquery/jquery-3.5.1.min.js"></script>
	 
	<!-- SCRIPT ---------------------------------------------------------- -->
	
	<script>
		$(document).ready(function(){
			$("btn").click(function(){
				$(this).hide();
				});
			});
	</script>
	 
	 
	<!-- SCRIPT END---------------------------------------------------------- -->
	 

</head>
<body>
	
<div class="container">
<br>  <p class="text-center">StoreCare</p>
<hr>

<div class="card bg-light">
<article class="card-body mx-auto" style="max-width: 400px;">
	<h4 class="card-title mt-3 text-center">Create Account</h4>
	<p class="text-center">Get started with your free account</p>
	<p>
		<a href="" class="btn btn-block btn-twitter"> <i class="fab fa-twitter"></i>   Login via Twitter</a>
		<a href="" class="btn btn-block btn-facebook"> <i class="fab fa-facebook-f"></i>   Login via facebook</a>
	</p>
	<p class="divider-text">
        <span class="bg-light">OR</span>
    </p>
	<form  method="post" action="login">
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="id" class="form-control" placeholder="Input ID" type="text" required autofocus>
    </div> <!-- form-group// -->

    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="password" id="pwd1"class="form-control" placeholder="Create password" type="password" required>


    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input id="pwd2" class="form-control" placeholder="Repeat password" type="password" required>
        <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
        <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
    </div> <!-- form-group// -->                                      
    <div class="form-group">
        <button type="submit" id="submit" class="btn btn-primary btn-block"> Create Account  </button>
    </div> <!-- form-group// -->      
    <p class="text-center">Have an account? <a href="/login">Log In</a> </p>                                                                 
</form>
</article>
</div> <!-- card.// -->
</div> 







<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.slim.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- SCRIPT ---------------------------------------------------------- -->
</body>
</html>

