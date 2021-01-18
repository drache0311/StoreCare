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
	var url = "updateBoard.do";	// Controller로 보내고자 하는 URL
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");
	
	for(var i=0;i<list.length;i++){
		if(list[i].checked){
			valueArr.push(list[i].value);
		}
	}
	if(valueArr.length == 0 ){
		alert("선택된 문의가 없습니다.");
	}else{
		var chk = confirm("처리하시겠습니까?");
		if(chk == true){ // 확인
			$.ajax({
				url : url,	// 위의 전송 URL
				type : 'POST',
				traditional : true,
				data : {
					valueArr : valueArr	// 보내고자하는 data 변수 설정
				},
				success : function(jdata){
					if(jdata = 1){
						alert("처리 완료");
						location.replace("getBoardList.do");	// admin 페이지로 새로고침
					}else{
						alert("처리 실패");
					}
				}
			});
		}else{
			return;
		}
	}
}