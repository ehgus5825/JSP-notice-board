<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	<jsp:include page="header.jsp" flush="false"></jsp:include>

	<!-- 제목 -->
	<div class="py-4 my-4 d-flex justify-content-center">
		<h2>홈</h2>
	</div>

	<!-- 게시글 미리보기 -->
	<div class="d-flex justify-content-center">
		<div class="row" style="width: 80%">

			<div class="col me-2">

				<h5 class="ps-4 pb-2">신규 게시글 목록</h5>
				<ol class="list-group list-group-numbered list-group-flush">

					<!-- list : 미리보기 목록 조회 (최신순) / 반복문 출력 -->
					<c:forEach var="n" items="${list}">

						<!-- 제목과 등록일자 -->
						<li
							class="list-group-item d-flex justify-content-between align-items-start">
							<div class="ms-3 me-auto bold">
								<!-- detail로 이동 ? id(식별자) & l(1:게시판) -->
								<a href="/detail?id=${n.nid}&l=1">${n.title}</a>
							</div> <span class="badge bg-primary rounded-pill">${n.regDateTimeView}</span>
						</li>
					</c:forEach>
				</ol>
			</div>

			<div class="col ms-2">

				<h5 class="ps-4 pb-2">인기 게시글 목록</h5>
				<ol class="list-group list-group-numbered list-group-flush">

					<!-- list2 : 미리보기 목록 조회 (조회순) / 반복문 출력 -->
					<c:forEach var="n" items="${list2}">

						<!-- 제목과 조회수 -->
						<li
							class="list-group-item d-flex justify-content-between align-items-start">
							<div class="ms-3 me-auto bold">
								<!-- detail로 이동 ? id(식별자) & l(1:게시판) -->
								<a href="/detail?id=${n.nid}&l=1">${n.title}</a>
							</div> <span class="badge bg-primary rounded-pill"> <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
								   <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
  								   <path
										d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 
  								   8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z" /></svg>
								${n.hit}
						</span>
						</li>
					</c:forEach>
				</ol>
			</div>

		</div>
	</div>

	<!-- 전체 게시물 보기 버튼 -->
	<div class="pt-4 my-4 d-flex justify-content-center">
		<!-- list로 이동 ? l(1:게시판) -->
		<a class="btn btn-primary" style="width: 180px; font-size: 15px;"
			href="/list?l=1">전체 게시물 목록</a>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>