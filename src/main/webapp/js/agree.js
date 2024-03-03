document.addEventListener("DOMContentLoaded", function() {
	
	document.getElementById('submit-button').onclick = function(event) {
		
		var frm = document.getElementById('frm')

		// 약관에 동의 여부 체크 
		if (frm.agree.checked === false) {
			event.preventDefault();
			alert("약관에 동의 후 가입할 수 있습니다.");
			return;
		}
		// 다음으로 이동 
		else {
			frm.submit();
		}
	};
});