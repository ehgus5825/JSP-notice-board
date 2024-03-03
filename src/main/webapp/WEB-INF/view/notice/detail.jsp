<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<script type="text/javascript" src="js/detail.js" charset="utf-8"></script>
<body class="container">

	<!-- 헤더 -->
	<jsp:include page="../header.jsp" flush="false"></jsp:include>

	<!-- 제목 -->
	<div class="pt-5 px-5">
		<h2 class="ps-5">게시글 내용</h2>
	</div>

	<!-- 브래드크럼브 -->
	<div class="pt-3 px-5 d-flex justify-content-end">
		<ol class="breadcrumb">

			<li class="breadcrumb-item">home</li>

			<c:if test="${param.l == '1'}">
				<li class="breadcrumb-item">게시판</li>
			</c:if>

			<c:if test="${param.l == '2'}">
				<li class="breadcrumb-item">마이페이지</li>
			</c:if>

			<li class="breadcrumb-item text-primary active">게시글 내용</li>
		</ol>
	</div>

	<!-- 글 내용 -->
	<div class="px-5">
		<table
			class="table table-striped table-hover table-border table-bordered text-center">
			<tbody>
				<tr>
					<th width="25%">제목</th>
					<td class="text-primary fw-bold" width="75%" colspan="3">${n.title}</td>
				</tr>
				<tr>
					<th width="25%">작성일</th>
					<td class="fw-bold" width="75%" colspan="3">${n.regDateTimeView}</td>
				</tr>
				<tr>
					<th width="25%">작성자</th>
					<td width="25%">${n.writerId}</td>

					<th width="25%">조회수</th>
					<!-- 숫자 포맷 지정 -->
					<td width="25%"><fmt:formatNumber type="number"
							value="${n.hit}" /></td>
				</tr>
				<tr>
					<th width="25%">첨부파일</th>
					<td width="75%" colspan="3">
						<!-- download를 통해 다운로드 가능 / 파일명을 모두 대문자로 변경 / 'zip'으로 끝나는 파일에 특정 스타일 적용 -->
						<c:set var="style" value="" /> <c:if
							test="${fn:endsWith(n.files, '.zip')}">
							<c:set var="style" value="font-weight: bold; color:red;" />
						</c:if> <a download href="/upload/${n.files}" style="${style}">${fn:toUpperCase(n.files)}</a>
					</td>
				</tr>

				<tr class="text-start">
					<!-- 글 내용 -->
					<td class="py-5 px-5" width="100%" colspan="4">${n.content}</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- 목록 | 수정 | 삭제 -->
	<div class="py-3 d-flex justify-content-center">

		<!-- 삭제시 사용할 id 모음 -->
		<input type="hidden" value="${param.l}" id="lid" /> <input
			type="hidden" value="${n.nid}" id="hid" />

		<!-- 목록 | list로 이동 ? p(페이지) & f(검색 필드) & q(검색어) & l(게시판 or 마이페이지) -->
		<a class="btn btn-primary"
			href="/list?p=${param.p}&f=${param.f}&q=${param.q}&l=${param.l}">목록</a>

		<!-- 게시판 -->
		<c:if test="${param.l == '1'}">
			<!-- 관리자 -->
			<c:if test="${sessionScope.userMember.role == 'ADMIN'}">

				<!-- 수정 | update로 이동 ? id(식별자) & l(게시판 or 마이페이지) -->
				<a class="mx-2 btn btn-outline-primary"
					href="/update?id=${n.nid}&l=${param.l}">수정</a>

				<!-- 삭제 | detail.js 실행 -->
				<a class="btn btn-danger" id="del">삭제</a>

			</c:if>
		</c:if>

		<!-- 마이페이지 -->
		<c:if test="${param.l == '2'}">

			<!-- 수정 | update로 이동 ? id(식별자) & l(게시판 or 마이페이지) -->
			<a class="mx-2 btn btn-outline-primary"
				href="/update?id=${n.nid}&l=${param.l}">수정</a>

			<!-- 삭제 | detail.js 실행 -->
			<a class="btn btn-danger" id="del">삭제</a>

		</c:if>
	</div>

	<!--  이전 글 | 다음 글 -->
	<div class="px-5 py-3">
		<table
			class="table table-striped table-hover table-border text-center">
			<tbody>
				<tr>
					<th width="25%">다음 글</th>

					<!-- 다음 글이 있다면 -->
					<c:if test="${nextN.nid != 0}">
						<td width="75%" colspan="3">
							<!-- detail로 이동 ? p(페이지) & id(식별자) & f(검색필드) & q(검색어) & l(게시판 or 마이페이지) -->
							<a class="fw-bold text-primary"
							href="/detail?p=${param.p}&id=${nextN.nid}&f=${param.f}&q=${param.q}&l=${param.l}">
								${nextN.title} </a>
						</td>
					</c:if>

					<!-- 다음 글이 없다면 -->
					<c:if test="${nextN.nid == 0}">
						<td width="75%" colspan="3" class="fw-bold text-secondary">다음글이
							없습니다.</td>
					</c:if>
				</tr>

				<tr>
					<th width="25%">이전 글</th>

					<!-- 이전 글이 있다면 -->
					<c:if test="${pervN.nid != 0}">
						<td width="75%" colspan="3">
							<!-- detail로 이동 ? p(페이지) & id(식별자) & f(검색필드) & q(검색어) & l(게시판 or 마이페이지) -->
							<a class="fw-bold text-primary"
							href="/detail?p=${param.p}&id=${pervN.nid}&f=${param.f}&q=${param.q}&l=${param.l}">
								${pervN.title} </a>
						</td>
					</c:if>

					<!-- 이전 글이 없다면 -->
					<c:if test="${pervN.nid == 0}">
						<td width="75%" colspan="3" class="fw-bold text-secondary">이전
							글이 없습니다..</td>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>