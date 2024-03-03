<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>notice board</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

</head>
<body class="container">

	<!-- 검색 기능 트리거 -->
	<input type="hidden" id="trigger" value="ok" />

	<!-- 헤더 -->
	<jsp:include page="../header.jsp" flush="false"></jsp:include>

	<!-- 브래드크럼브 -->
	<div class="pt-3 px-5 d-flex justify-content-end">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">home</li>
			<li class="breadcrumb-item text-primary active">마이페이지</li>
		</ol>
	</div>

	<!-- 제목 -->
	<div class="pt-4 pb-3 px-5 mx-5 row">
		<div class="col d-flex justify-content-center">
			<h2 class="ms-4">
				<!-- 현재 세션의 member 정보의 속성들을 이용한 welcome 표시 -->
				<span class="text-primary">"${sessionScope.userMember.name}"</span>님
				환영합니다.
			</h2>
		</div>
		<div class="col"></div>
	</div>

	<!-- 개인 정보란 -->
	<div class="mt-4 mb-3 d-flex justify-content-center">
		<div class="row" style="width: 80%">

			<div class="col d-flex justify-content-center pb-2">
				<svg xmlns="http://www.w3.org/2000/svg" width="150" height="150"
					fill="currentColor" class="bi bi-person-circle align-self-center"
					viewBox="0 0 16 16">
  								<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
  								<path fill-rule="evenodd"
						d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226
									 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" /></svg>
			</div>

			<div class="col">
				<fieldset>
					<!-- 해당 테이블은 접속된 사용자의 마이페이지에서 사용자에 정보를 표시하기 위한 테이블임 -->
					<table class="table table-hover">
						<!-- 로그인이 되어있는 경우에 마이페이지를 들어올 수 있음 => 세션에 접속중인 사용자가 마이페이지의 회원임 -->
						<!-- 현재 세션의 member 정보의 속성들을 이용해서 회원정보 테이블을 채움 -->
						<tbody>
							<tr>
								<th width="40%"><label class="ps-2">아이디</label></th>
								<!-- 현재 접속중인 회원의 ID -->
								<td width="60%">${sessionScope.userMember.mid}</td>
							</tr>
							<tr>
								<th width="40%"><label class="ps-2">비밀번호</label></th>
								<!-- 현재 접속중인 회원의 PWD -->
								<td width="60%">${sessionScope.userMember.pwd}</td>
							</tr>
							<tr>
								<th width="40%"><label class="ps-2">이름</label></th>
								<!-- 현재 접속중인 회원의 이름 -->
								<td width="60%">${sessionScope.userMember.name}</td>
							</tr>
							<tr>
								<th width="40%"><label class="ps-2">성별</label></th>
								<!-- 현재 접속중인 회원의 성별 -->
								<td width="60%">${sessionScope.userMember.gender}</td>
							</tr>
							<tr>
								<th width="40%"><label class="ps-2">생년월일</label></th>
								<!-- 현재 접속중인 회원의 생년월일 -->
								<td width="60%">${sessionScope.userMember.birthday}</td>
							</tr>
							<tr>
								<th width="40%"><label class="ps-2">핸드폰번호</label></th>
								<!-- 현재 접속중인 회원의 휴대전화 -->
								<td width="60%">${sessionScope.userMember.phone}</td>
							</tr>
							<tr>
								<th width="40%"><label class="ps-2">이메일</label></th>
								<!-- 현재 접속중인 회원의 이메일 -->
								<td width="60%">${sessionScope.userMember.email}</td>
							</tr>
						</tbody>
					</table>
				</fieldset>
			</div>
		</div>
	</div>

	<!-- 리스트 -->
	<jsp:include page="../list.jsp" flush="false"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>