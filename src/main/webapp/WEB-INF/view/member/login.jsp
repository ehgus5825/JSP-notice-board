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
<script type="text/javascript" src="js/login.js" charset="utf-8"></script>
<body class="container">

	<!-- 헤더 -->
	<jsp:include page="../header.jsp" flush="false"></jsp:include>

	<!-- 브래드크럼브 -->
	<div class="pt-4 px-5 d-flex justify-content-end">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">home</li>
			<li class="breadcrumb-item">회원 메뉴</li>
			<li class="breadcrumb-item text-primary active">로그인</li>
		</ol>
	</div>

	<!-- 제목 -->
	<div class="py-4 my-4 d-flex justify-content-center">
		<h2>로그인</h2>
	</div>

	<!-- 로그인 창 -->
	<div class="d-flex justify-content-center mb-5">

		<form id="frm" method="post" style="width: 30%">

			<!-- 아이디 -->
			<div class="mb-3">
				<label for="exampleInputEmail1" class="ps-2 form-label fw-bold">아이디</label>
				<input type="text" class="form-control" placeholder="아이디를 입력해주세요."
					name="username" id="exampleInputEmail1"
					aria-describedby="emailHelp">
			</div>

			<!-- 패스워드 -->
			<div class="mb-4">
				<label for="exampleInputPassword1" class="ps-2 form-label fw-bold">비밀번호</label>
				<input type="password" class="form-control" name="password"
					placeholder="비밀번호를 입력해주세요" id="exampleInputPassword1">
			</div>

			<!-- 로그인 버튼 -->
			<div class="mb-4 pe-1 d-flex justify-content-center">
				<button id="btn" type="submit" class="btn btn-primary"
					style="width: 100%">로그인</button>
			</div>

			<div class="d-flex justify-content-center btn-group btn-group-sm"
				role="group" style="width: 100%">
				<!-- 아이디 찾기(미구현), 회원가입 -->
				<a class="btn btn-outline-primary" onclick="alert('준비중..');">ID/PWD
					찾기</a> <a class="btn btn-outline-primary" href="/agree">회원가입</a>
			</div>

		</form>

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>