<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script type="text/javascript" src="js/update.js"></script>
<body class="container">

	<!-- 헤더 -->
	<jsp:include page="../header.jsp" flush="false"></jsp:include>

	<!-- 제목 -->
	<div class="pt-5 px-5">
		<h2 class="ps-5">글 수정</h2>
	</div>

	<!-- 브래드크럼브 -->
	<div class="pt-3 mt-2 pb-2 px-5 d-flex justify-content-end">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">home</li>

			<c:if test="${param.l == '1'}">
				<li class="breadcrumb-item">게시판</li>
			</c:if>

			<c:if test="${param.l == '2'}">
				<li class="breadcrumb-item">마이페이지</li>
			</c:if>

			<li class="breadcrumb-item text-primary active">게시글 수정</li>
		</ol>
	</div>

	<!-- 글 수정 -->
	<div class="px-5">

		<!-- multipart/form-data : 파일 업로드 -->
		<form id="frm" method="post" enctype="multipart/form-data">
			<table
				class="table table-striped table-hover table-border table-bordered text-center">
				<tbody>
					<tr>
						<th width="25%" class="align-middle">제목</th>
						<td width="75%" class="text-center ps-3" colspan="3"><input
							required type="text"
							class="form-control form-control-plaintext text-center"
							value="${n.title}" name="title_" /></td>
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
						<th width="25%" class="align-middle">첨부파일</th>
						<td width="75%" colspan="3" class="text-center"><div
								class="row">
								<div class="col"></div>
								<div class="col">
									<input type="hidden" name="og_file" value="${n.files}"/>
									<input type="text" id="fileName" class="form-control text-center"
										value="${n.files}" readonly />
								</div>
								<div class="col d-flex align-content-center pe-3"
									style="position: relative; height: 36px; overflow: hidden;">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
										fill="currentColor" class="align-self-center bi bi-file-earmark-arrow-up"
										viewBox="0 0 16 16">
		<path
											d="M8.5 11.5a.5.5 0 0 1-1 0V7.707L6.354 8.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1-.708.708L8.5 7.707V11.5z" />
		<path
											d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z" />
	</svg>
									<input type="file" name="file"
										style="font-size: 29px; position: absolute; right: 0px; top: 0px; opacity: 0; filter: alpha(opacity = 0); -ms-filter: alpha(opacity = 0); cursor: pointer;"
										onchange="javascript: document.getElementById('fileName').value = this.value" />
								</div>
							</div></td>
					</tr>
					<tr>
						<!-- 글 내용 -->
						<td class="p-4" width="100%" colspan="4"><textarea
								style="width: 100%; height: 400px" required
								class="form-control-plaintext" name="content">${n.content}</textarea></td>
					</tr>
					<tr>
						<!-- 기존 공개 여부 -->
						<td class="my-3 py-3 text-end pe-5" width="100%" colspan="4">
							<input class="form-check-input" type="checkbox" id="open"
							name="open" ${(n.pub == 1)?"checked":""} value="true"> <label
							for="open">바로 공개</label>
						</td>
					</tr>
				</tbody>
			</table>

			<div class="py-4 d-flex justify-content-center">
				<!-- 수정 | update.js 실행 => form 전송 -->
				<input class="mx-2 btn btn-outline-primary" id="btn" type="button"
					value="수정" />

				<!-- 취소 : 뒤로가기 -->
				<a class="btn btn-danger" href="javascript:history.back()">취소</a>
			</div>
		</form>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>