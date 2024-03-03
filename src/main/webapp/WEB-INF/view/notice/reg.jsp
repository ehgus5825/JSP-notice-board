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
<script type="text/javascript" src="js/reg.js" charset="utf-8"></script>
<body class="container">

	<!-- 헤더 -->
	<jsp:include page="../header.jsp" flush="false"></jsp:include>

	<!-- 제목 -->
	<div class="pt-5 px-5">
		<h2 class="ps-5">글 등록</h2>
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
			<li class="breadcrumb-item text-primary active">게시글 등록</li>
		</ol>
	</div>

	<!-- 글 등록 -->
	<div class="px-5">

		<!-- multipart/form-data : 파일 업로드 -->
		<form id="frm" method="post" enctype="multipart/form-data">
			<table
				class="table table-striped table-hover table-border table-bordered text-center">
				<tbody>
					<tr>
						<th width="25%" class="text-center align-middle">제목</th>
						<td width="75%" colspan="3" class="ps-4 pe-5 me-5">
							<div class="w-75">
								<input required type="text"
									class="form-control form-control-plaintext"
									style="border-bottom: solid 1px gray; border-radius: 0px;"
									name="title_" />
							</div>
						</td>
					</tr>
					<tr>
						<th width="25%" class="align-items-center align-middle">첨부파일</th>
						<td width="75%" colspan="3" class="ps-4 pe-5 me-5">
							<div class="w-50">
								<input name="file" class="form-control" type="file"
									id="formFileMultiple">
							</div>
						</td>
					</tr>
					<tr>
						<!-- 글 내용 -->
						<td class="p-4" width="100%" colspan="4"><textarea
								style="width: 100%; height: 400px" required
								class="form-control-plaintext" name="content"></textarea></td>
					</tr>
					<tr>
						<!-- 공개 여부 -->
						<td class="my-3 py-3 text-end pe-5" width="100%" colspan="4">
							<input class="form-check-input" type="checkbox" id="open"
							name="open" value="true"> <label for="open">바로 공개</label>
						</td>
					</tr>
				</tbody>
			</table>

			<div class="py-4 d-flex justify-content-center">
				<!-- 수정 | reg.js 실행 => form 전송 -->
				<input class="mx-2 btn btn-outline-primary" id="btn" type="button"
					value="등록" />

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