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

	<!-- JQuery JavaScript -->
	<script src="/resources/vendor/jquery/jquery-3.5.1.min.js"></script>
	
	<!-- Custom styles for this template -->
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/signup.css" rel="stylesheet">
	 
	
	 

	 

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
	
	$(function(){
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function(){
			var pwd1=$("#pwd1").val();
			var pwd2=$("#pwd2").val();
			if(pwd1 != "" && pwd2 != ""){
				if(pwd1 == pwd2){
					$("#alert-success").show();
			        $("#alert-danger").hide();
			        $("#submit").removeAttr("disabled");
				}else{ $("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
	</script>
	 
	<script> <!-- idCheck -->

	var idJ = /^[a-z0-9]{4,12}$/;
	var idCheck = 0;
  	 // 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#user_id").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#user_id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/idCheck.do?id='+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다");
						$("#id_check").css("color", "red");
						//$("#submit").attr("disabled", true);
					} else {
						
						if(idJ.test(user_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							idCheck=1;
						//	$("#submit").attr("disabled", false);
				
						} else if(user_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요');
							$('#id_check').css('color', 'red');
						//	$("#submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다");
							$('#id_check').css('color', 'red');
						//	$("#submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	</script>
	 
	 
	<!-- SCRIPT END---------------------------------------------------------- -->





<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- SCRIPT ---------------------------------------------------------- -->
</body>
</html>

