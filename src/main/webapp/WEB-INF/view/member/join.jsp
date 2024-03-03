<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>notice board</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<script type="text/javascript" src="js/join.js" charset="utf-8"></script>
<body class="container">

	<!-- 헤더 -->
	<jsp:include page="../header.jsp" flush="false"></jsp:include>

	<!-- 제목 -->
	<div class="pt-5 px-5 d-flex justify-content-center">
		<h2 class>회원 정보 입력</h2>
	</div>

	<!-- 브래드크럼브 -->
	<div class="pt-3 pb-5 px-5 d-flex justify-content-end">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">home</li>
			<li class="breadcrumb-item">회원 메뉴</li>
			<li class="breadcrumb-item">가입 동의</li>
			<li class="breadcrumb-item text-primary active">회원 정보 입력</li>
		</ol>
	</div>

	<!-- 회원 정보 입력 -->
	<div class="d-flex justify-content-center mb-5">

		<form id="frm" method="post" action="/confirm" style="width: 70%">

			<div class="mb-4">

				<label for="exampleInputEmail1" class="ps-2 form-label fw-bold">아이디</label>

				<div class="input-group mb-2">
					<!-- dupl 에서 복귀시 value="${id}를 통해 id가 지워지지 않음 -->
					<input type="text" class="form-control" required value="${id}"
						id="id-text" name="id_" placeholder="영문과 숫자 6~20자 이내"
						aria-label="Recipient's username" aria-describedby="button-addon2">

					<!-- 중복확인 | join.js 실행 -->
					<button class="btn btn-outline-primary" type="button"
						id="id-check-button">중복확인</button>
				</div>

				<input type="hidden" name="dupl" value="${dupl}" />
				<!-- 중복 확인 결과인 0, 1, 2, 3에 대한 안내문 -->
				<span class="px-2 text-danger"> ${(dupl== null or dupl == "0")?"아이디를 입력해주세요":((dupl =="1")?"양식이 올바르지 않습니다.":((dupl =="2")?"이미 사용중인 아이디입니다.":"사용 가능한 아이디입니다."))}
				</span>
			</div>

			<div class="mb-4">
				<label for="exampleInputPassword1" class="ps-2 form-label fw-bold">비밀번호</label>
				<input type="password" class="form-control" name="pwd" value=""
					required placeholder="비밀번호 입력 (영문과 숫자 6~20자 이내)"
					id="exampleInputPassword1">
			</div>

			<div class="mb-4">
				<label for="exampleInputPassword1" class="ps-2 form-label fw-bold">비밀번호
					확인</label> <input type="password" class="form-control" name="pwd2"
					placeholder="비밀번호를 다시 한번 입력해주세요" value="" required
					id="exampleInputPassword1">
			</div>

			<div class="mb-4">
				<label for="exampleInputPassword1" class="ps-2 form-label fw-bold">이름</label>
				<input type="text" class="form-control" name="name"
					placeholder="이름을 입력해주세요" value="" required
					id="exampleInputPassword1">
			</div>

			<div class="mb-4">
				<label for="exampleInputPassword1" class="ps-2 form-label fw-bold">성별
				</label> <select class="form-select" aria-label="Default select example"
					name="gender" required>
					<option value="">선택</option>
					<option value="남성">남성</option>
					<option value="여성">여성</option>
				</select>
			</div>

			<div class="mb-4">
				<label for="exampleInputPassword1" class="ps-2 form-label fw-bold">생년월일</label>
				<input type="date" class="form-control" name="birthday"
					placeholder="예) 2000-02-17" value="" required
					id="exampleInputPassword1">
			</div>

			<div class="mb-4">
				<label for="exampleInputPassword1" class="ps-2 form-label fw-bold">휴대전화</label>
				<input type="text" class="form-control" name="phone"
					placeholder="예) 010-1111-2222" value="" required
					id="exampleInputPassword1">
			</div>

			<div class="mb-4">
				<label for="exampleInputPassword1" class="ps-2 form-label fw-bold">이메일</label>
				<input type="email" class="form-control" name="email"
					placeholder="예) user@newlecture.com" value="" required
					id="exampleInputPassword1">
			</div>

			<!-- 회원 정보 전송 | join.js 실행 -->
			<div class="d-flex justify-content-center">
				<button id="submit-Button" type="submit" name="btn"
					style="width: 80px;" class="btn btn-primary">확인</button>
			</div>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>