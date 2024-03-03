document.addEventListener("DOMContentLoaded", function() {
	
	document.getElementById('btn').onclick = function(event) {
		
		var frm = document.getElementById('frm')
		
		// (id, pwd == "") / 체크
		if (frm.username.value === "") {
			event.preventDefault();
			alert("아이디를 입력해주세요");
			return;
		}
		if (frm.password.value === "") {
			event.preventDefault();
			alert("비밀번호를 입력해주세요");
			return;
		}
		
		frm.submit();
	}
});