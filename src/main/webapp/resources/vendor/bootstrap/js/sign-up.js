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


var idJ = /^[a-z0-9]{4,12}$/;
var idCheck = 0;
 // 아이디 유효성 검사(1 = 중복 / 0 != 중복)
$("#user_id").blur(function() {
	// id = "id_reg" / name = "userId"
	var user_id = $('#user_id').val();
	$.ajax({
		url : '/idCheck.do?id='+ user_id,
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