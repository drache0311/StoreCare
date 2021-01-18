function isNumber(e){
	var btn = document.getElementById('searchId');

	if(isNaN(e.value)){
		alert('숫자만 입력가능합니다.');
		e.value='';
	}
	if(e.value.length < e.maxLength){
		btn.disabled = 'disabled';
	}else{
		btn.disabled = false;
	}
}