$(function(){
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		for(var i=0;i<chk_listArr.length;i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='RowCheck']").click(function(){
		if($("input[name='RowCheck']:checked").length == rowCnt){
			$("input[name='allCheck']")[0].checked = true;
		}else{
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});
function deleteValue(){
	var url = "deleteProblem.do";	// Controller로 보내고자 하는 URL
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");
	var depth = $("input[name='depth']");

	
	
	for(var i=0;i<list.length;i++){
		if(list[i].checked){
			valueArr.push(list[i].value);
		}
	}
	if(valueArr.length == 0 ){
		alert("선택된 문의사항이 없습니다.");
	}else{
		var chk = confirm("삭제하시겠습니까?");
		$.ajax({
			url : url,	// 위의 전송 URL
			type : 'GET',
			traditional : true,
			data : {
				valueArr : valueArr,	// 보내고자하는 data 변수 설정
				depth	:	depth[0].value
			},
			success : function(jdata){
				if(jdata = 1){
					alert("처리 완료");
					location.replace("updateProblem.do?depth=1")	// 다시 수정페이지로 새로고침
				}else{
					alert("처리 실패");
				}
			}
		});
	}
}