<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<script type="text/javascript" src="js/header.js" charset="utf-8"></script>
<body>

	<nav class="navbar navbar-expand-lg bg-dark-subtle px-5">

		<div class="container-fluid">

			<!-- 로고, 게시판 메뉴 -->
			<a class="navbar-brand fs-4 fw-bold" href="/index">Notice Board</a> <a
				class="nav-link ps-2 pt-1 me-auto" aria-current="page"
				href="/list?l=1">게시판</a>

			<!-- 반응형으로 좁혀졌을 때 표시될 토글 버튼 -->
			<button class="navbar-toggler mb-2" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- 반응형으로 넓어졌을 때 표시되는 내용 -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<ul class="navbar-nav d-flex flex-row w-100" style="height: 100px">

					<li class="nav-item me-auto"></li>

					<!-- 검색어 입력 폼 -->
					<li class="nav-item align-self-center pe-2">
						<!-- form을 submit 하면 검색필드와 검색어로 필터된 목록만 출력된다. -->
						<form id="frm2" role="search">
							<div class="input-group input-group-sm">
								<!-- 쿼리스트링의 f(검색필드)의 값에 따라 두 옵션 값 중 하나가 화면에 표시됨 -->
								<select name="f" style="width: 30%;" class="form-select"
									aria-label="Default select">

									<!-- f가 title일 경우 "제목" -->
									<option ${(param.f == "title")?"selected":""} value="title">제목</option>

									<!-- f가 writer_id일 경우 "작성자" -->
									<option ${(param.f == "writer_id")?"selected":""}
										value="writer_id">작성자</option>

								</select> <input type="hidden" name="l" value="${param.l}" />

								<!-- 검색시 검색어로 표시될 쿼리스트링 q -->
								<input style="width: 50%;" name="q" value="${param.q}"
									class="form-control" type="search" placeholder="Search"
									aria-label="Search">

								<button style="width: 20%;" class="btn btn-outline-primary"
									id="header-button" type="submit">search</button>
							</div>
						</form>
					</li>

					<!-- 로그인, 로그아웃, 회원가입, 마이페이지 토글  -->
					<li class="nav-item dropdown align-self-center pt-1"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <svg
								xmlns="http://www.w3.org/2000/svg" width="35" height="35"
								fill="currentColor" class="bi bi-person-circle pb-1"
								viewBox="0 0 16 16">
  								<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
  								<path fill-rule="evenodd"
									d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226
									 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" /></svg></a>

						<ul class="dropdown-menu">

							<!-- 접속중인 세션이 로그인 중이 아니라면 로그인 버튼  -->
							<c:if test="${sessionScope.userMember == null}">
								<li><a class="dropdown-item" aria-current="page"
									href="/login">로그인</a></li>
							</c:if>

							<!-- 접속중인 세션이 로그인 중이라면 로그아웃 버튼  -->
							<c:if test="${sessionScope.userMember != null}">
								<li><a class="dropdown-item" aria-current="page"
									href="/logout">로그아웃</a></li>
							</c:if>

							<!-- 회원가입 버튼 -->
							<li><a class="dropdown-item" aria-current="page"
								href="/agree">회원가입</a></li>

							<!-- 접속중인 세션이 로그인 중이라면 마이페이지 버튼  -->
							<c:if test="${sessionScope.userMember != null}">
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" aria-current="page"
									href="/list?l=2">마이페이지</a></li>
							</c:if>

						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>