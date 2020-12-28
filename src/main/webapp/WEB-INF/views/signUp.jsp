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
</head>
<body>
	
<div class="container">



<div class="card bg-light">
	<article class="card-body mx-auto" style="max-width: 400px;">
	<h4 class="card-title mt-3 text-center">STORE CARE</h4>
	<p class="divider-text">
        <span class="bg-light">롯데백화점</span>
    </p>
	<form  method="post" action="insertUser.do">
	<!-- 아이디 -->
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="id" id="user_id" class="form-control" placeholder="Input ID" type="text" required autofocus>
    </div> <!-- form-group// -->
    <!-- 아이디 알림 -->   
    <div class="check_font" id="id_check"></div>
    <!-- 비밀번호 -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="password" id="pwd1"class="form-control" placeholder="Create password" type="password" required>
    </div> <!-- form-group// -->
    <!-- 비밀번호 체크 -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input id="pwd2" class="form-control" placeholder="Repeat password" type="password" required>
    </div> <!-- form-group// -->
    <!-- 비밀번호 일치 알림 -->   
	<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
	<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>                                   
    <div class="form-group">
        <button type="submit" id="submit" class="btn btn-primary btn-block"> Create Account  </button>
    </div> <!-- form-group// -->      
    <p class="text-center">Have an account? <a href="/login">Log In</a> </p>                                                                 
	</form>
	</article>
</div> <!-- card.// -->
</div> 

	<!-- SCRIPT ---------------------------------------------------------- -->
	

	
	<script>   <!-- passwordCheck -->

/*  
 *			아이디 비번 둘다 안틀릴 때만 버튼 활성화 추후에 수정해야함
 *
 */
	

	</script>
	 
	<script> <!-- idCheck -->


	</script>
	 
	 
	<!-- SCRIPT END---------------------------------------------------------- -->




<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- JQuery JavaScript -->
<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery-3.5.1.min.js"></script>

<!-- Custom JavaScript for this theme -->
<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/password-check.js"></script>
<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/id-check.js"></script>
<!-- SCRIPT ---------------------------------------------------------- -->
</body>
</html>

