document.addEventListener("DOMContentLoaded", function() {
	
	document.getElementById('submit-Button').onclick = function(event) {

		var frm = document.getElementById('frm')
		
		// (id, pwd, 이름, 성별, 생년월일, 휴대전화, 이메일) == "" / 체크
		if (frm.id_.value === "") {
			event.preventDefault();
			alert("아이디를 입력해주세요");
			return
		}
		if (frm.pwd.value === "") {
			event.preventDefault();
			alert("비밀번호를 입력해주세요");
			return
		}
		if (frm.pwd2.value === "") {
			event.preventDefault();
			alert("비밀번호를 한번 더 입력해주세요");
			return
		}
		if (frm.name.value === "") {
			event.preventDefault();
			alert("이름을 입력해주세요");
			return
		}
		if (frm.gender.value === "") {
			event.preventDefault();
			alert("성별을 선택해주세요");
			return
		}
		if (frm.birthday.value === "") {
			event.preventDefault();
			alert("생년월일을 입력해주세요");
			return
		}
		if (frm.phone.value === "") {
			event.preventDefault();
			alert("휴대전화 번호를 입력해주세요");
			return
		}
		if (frm.email.value === "") {
			event.preventDefault();
			alert("이메일를 입력해주세요");
			return
		}
		
		// (비밀번호 == 비밀번호 확인) / 체크
		if (frm.pwd.value !== frm.pwd2.value) {
			event.preventDefault();
			alert("비밀번호가 동일하지 않습니다.");
			return
		}
		// (아이디 != 비밀번호) / 체크
		if (frm.pwd.value === frm.id_.value) {
			event.preventDefault();
			alert("아이디와 비밀번호는 달라야 합니다.");
			return
		}

		// (id, pwd, 휴대전화, 이메일) => 정규 표현식 체크
		const idpw_reg = new RegExp("^[a-z]+[a-z0-9]{5,19}$");
		const phone_reg = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
		const email_reg = new RegExp("^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");

		if (!idpw_reg.test(frm.id_.value)) {
			event.preventDefault();
			alert("아이디의 형식이 올바르지 않습니다.");
			return
		}
		if (!idpw_reg.test(frm.pwd.value)) {
			event.preventDefault();
			alert("비밀번호의 형식이 올바르지 않습니다.");
			return
		}
		if (!phone_reg.test(frm.phone.value)) {
			event.preventDefault();
			alert("휴대전화의 형식이 올바르지 않습니다.");
			return
		}
		if (!email_reg.test(frm.email.value)) {
			event.preventDefault();
			alert("이메일의 형식이 올바르지 않습니다.");
			return
		}
		// (생년월일 < 1년전 오늘) / 체크
		let before = new Date();
		let birthday = new Date(frm.birthday.value);

		before.setFullYear(new Date().getFullYear() - 1);

		if (before.getTime() < birthday.getTime()) {
			event.preventDefault();
			alert("올바른 날짜를 입력해주세요");
			return;
		}

		// 아이디 중복체크 값 확인 (only 3)		    	
		if (frm.dupl.value !== "3") {
			event.preventDefault();
			alert("아이디 중복체크를 확인해 주세요.");
			return
		}

		frm.submit();
		return;
	};

	var btn = document.getElementById('id-check-button');
	btn.addEventListener('click', function() {
		
		var id = document.getElementById('id-text');
		
		// dupl ? id(식별자)
		location.href = "/dupl?id=" + id.value;
	})
});



