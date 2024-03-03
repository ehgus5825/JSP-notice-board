document.addEventListener("DOMContentLoaded", function() {
	
	document.getElementById('del').addEventListener('click', function(event) {
		
		// 글 삭제 여부 체크 
		if (confirm('글을 정말 삭제하시겠습니까?')) {
			var del = document.getElementById('hid').value;
			var listFlag = document.getElementById('lid').value;

			// delete ? id(식별자) & l(게시판 or 마이페이지)
			location.href = "/delete?id=" + del + "&l=" + listFlag;
		}
		// 삭제 취소
		else {
			event.preventDefault();
			return;
		}
	});
});