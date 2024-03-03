document.addEventListener("DOMContentLoaded", function() {

	document.getElementById('btn').onclick = function(event) {

		// 글 수정 여부 체크
		if (confirm('글을 정말 수정하시겠습니까?')) {

			var frm = document.getElementById('frm')

			// title, content == "" / 체크
			if (frm.title_.value === "") {
				event.preventDefault();
				alert("제목이 비었습니다.");
				return
			}
			if (frm.content.value === "") {
				event.preventDefault();
				alert("내용이 비었습니다.");
				return
			}

			frm.submit();
			return;
		}
		// 수정 취소
		else {
			return;
		}
	};
});