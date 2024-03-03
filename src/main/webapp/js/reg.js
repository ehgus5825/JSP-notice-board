document.addEventListener("DOMContentLoaded", function() {
	
	document.getElementById('btn').onclick = function(event) {
		
		// 글 등록 여부 체크
		if (confirm('글을 정말 등록하시겠습니까?')) {
			
			var frm = document.getElementById('frm')
			
			// title, content == "" / 체크
			if (frm.title_.value === "") {
				event.preventDefault();
				alert("제목을 입력해주세요");
				return
			}
			if (frm.content.value === "") {
				event.preventDefault();
				alert("내용을 입력해주세요");
				return
			}
			
			frm.submit();
			return;
		}
		// 등록 취소
		else {
			return;
		}
	};
});