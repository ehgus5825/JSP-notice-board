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
<body class="container">

	<!-- 헤더 -->
	<jsp:include page="../header.jsp" flush="false"></jsp:include>

	<!-- 브래드크럼브 -->
	<div class="pt-4 pb-4 px-5 d-flex justify-content-end">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">home</li>
			<li class="breadcrumb-item">회원 메뉴</li>
			<li class="breadcrumb-item">가입 동의</li>
			<li class="breadcrumb-item">회원 정보 입력</li>
			<li class="breadcrumb-item text-primary active">가입 완료</li>
		</ol>
	</div>

	<hr>

	<!-- 회원 가입 완료 내용 -->
	<div class="my-4 py-5 px-5 mx-3">
		<div class="d-flex justify-content-center">
			<p class="fs-2">회원가입이 완료 되었습니다.</p>
		</div>
		<div class="d-flex justify-content-center">
			<!-- login 으로 이동 -->
			<a class="btn btn-outline-primary" href="/login">가입된 아이디로 로그인</a>
		</div>
	</div>

	<hr>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>