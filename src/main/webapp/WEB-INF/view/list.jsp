<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<script type="text/javascript" src="js/list.js" charset="utf-8"></script>
<body>

	<!-- 변수들 -->

	<!-- 현재 페이지 | 기본값 : 1 -->
	<c:set var="page" value="${(empty param.p)?1:param.p}" />

	<!-- 마지막 페이지 -->

	<!-- 게시판 -->
	<c:if test="${param.l == '1'}">

		<!-- 일반회원 or 비회원 -->
		<c:if test="${sessionScope.userMember.role != 'ADMIN'}">
			<!-- count1 / 10 => 올림 => 소수점 삭제 => 정수 / 10개 -->
			<c:set var="lastNum"
				value="${fn:substringBefore(Math.ceil(count1/10), '.')}" />
		</c:if>

		<!-- 관리자 -->
		<c:if test="${sessionScope.userMember.role == 'ADMIN'}">
			<!-- count2 / 10 => 올림 => 소수점 삭제 => 정수 / 10개 -->
			<c:set var="lastNum"
				value="${fn:substringBefore(Math.ceil(count2/10), '.')}" />
		</c:if>

	</c:if>

	<!-- 마이페이지 -->
	<c:if test="${param.l == '2'}">
		<!-- count3 / 5 => 올림 => 소수점 삭제 => 정수 / 5개 -->
		<c:set var="lastNum"
			value="${fn:substringBefore(Math.ceil(count3/5), '.')}" />
	</c:if>

	<!-- 시작 페이지 | 계산식 : page-(page-1)%5 -->
	<!-- (1~5) => 1 / (6~10) => 6 / (11~15) => 11 ... -->
	<c:set var="startNum" value="${page-(page-1)%5}" />

	<!-- 글 목록 -->
	<div class="px-5 pt-3">
		<!-- form을 submit 하면 선택된 id와 버튼에 따라 일괄공개/일괄삭제된다. -->
		<form method="post" id="frm">

			<!-- 글 목록 : 게시판의 비회원-회원(list1), 관리자(list2), 마이페이지의 뷰(list3) -->
			<div class="mb-3">
				<table class="table table-striped table-hover text-center">
					<thead class="table-light">
						<tr>
							<th width="4%">No</th>
							<th width="60%">제목</th>
							<th width="10%">작성자</th>

							<!-- 게시판 -->
							<c:if test="${param.l == '1'}">
								<!-- 일반회원 or 비회원 -->
								<c:if test="${sessionScope.userMember.role != 'ADMIN'}">
									<th width="13%">작성일</th>
									<th width="13%">조회수</th>
								</c:if>

								<!-- 관리자 -->
								<c:if test="${sessionScope.userMember.role == 'ADMIN'}">
									<th width="10%">작성일</th>
									<th width="6%">조회수</th>
									<th width="5%">공개</th>
									<th width="5%">삭제</th>
								</c:if>
							</c:if>

							<!-- 마이페이지 -->
							<c:if test="${param.l == '2'}">
								<th width="10%">작성일</th>
								<th width="6%">조회수</th>
								<th width="5%">공개</th>
								<th width="5%">삭제</th>
							</c:if>
						</tr>
					</thead>

					<!-- 게시판 -->
					<c:if test="${param.l == '1'}">

						<!-- 회원-비회원(list1) -->
						<c:if test="${sessionScope.userMember.role != 'ADMIN'}">
							<tbody>
								<c:forEach var="n" items="${list1}">
									<tr>
										<!-- id -->
										<td>${n.nid}</td>

										<!-- 제목 -->
										<td class="text-start">
											<!-- detail로 이동 ? p(페이지) & id(식별자) & f(검색 필드) & q(검색어) & l(게시판 or 마이페이지) -->
											<a class="px-3"
											href="detail?p=${page}&id=${n.nid}&f=${param.f}&q=${param.q}&l=${param.l}&o=${param.o}">
												${n.title} </a> <!-- 이전, 다음 글이 무엇인지 판별하기 위함 -->
										</td>

										<!-- 작성자 -->
										<td>${n.writerId}</td>

										<!-- 등록일자 -->
										<td>${n.regDateTimeView}</td>

										<!-- 조회수 | 숫자 포맷 지정 -->
										<td><fmt:formatNumber type="number" value="${n.hit}" />
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>

						<!-- 관리자(list2) -->
						<c:if test="${sessionScope.userMember.role == 'ADMIN'}">
							<tbody>
								<c:forEach var="n" items="${list2}">
									<tr>
										<!-- id -->
										<td>${n.nid}</td>

										<!-- 제목 -->
										<td class="text-start">
											<!-- detail로 이동 ? p(페이지) & id(식별자) & f(검색 필드) & q(검색어) & l(게시판 or 마이페이지) -->
											<a class="px-3"
											href="/detail?p=${page}&id=${n.nid}&f=${param.f}&q=${param.q}&l=${param.l}">
												${n.title} </a> <!-- 이전, 다음 글이 무엇인지 판별하기 위함 -->
										</td>

										<!-- 작성자 -->
										<td>${n.writerId}</td>

										<!-- 등록일자 -->
										<td>${n.regDateTimeView}</td>

										<!-- 조회수 | 숫자 포맷 지정 -->
										<td><fmt:formatNumber type="number" value="${n.hit}" />
										</td>

										<!-- 공개 여부 | "1" => 체크 / (!"1") => 체크 X | open_id에 체크된 n.id만 축적 -->
										<td><input type="checkbox" name="open_id"
											value="${n.nid}" ${(n.pub == 1)?"checked":""}></td>

										<!-- 제거 여부 | del_id에 n.id를 축적 -->
										<td><input type="checkbox" name="del_id" value="${n.nid}">
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
					</c:if>

					<!-- 마이페이지(list3) -->
					<c:if test="${param.l == '2'}">
						<tbody>
							<c:forEach var="n" items="${list3}">
								<tr>
									<!-- id -->
									<td>${n.nid}</td>

									<!-- 제목 -->
									<td class="text-start">
										<!-- detail로 이동 ? p(페이지) & id(식별자) & f(검색 필드) & q(검색어) & l(게시판 or 마이페이지) -->
										<a class="px-4"
										href="/detail?p=${page}&id=${n.nid}&f=${param.f}&q=${param.q}&l=${param.l}">
											${n.title} </a> <!-- 이전, 다음 글이 무엇인지 판별하기 위함 -->
									</td>

									<!-- 작성자 -->
									<td>${n.writerId}</td>

									<!-- 등록일자 -->
									<td>${n.regDateTimeView}</td>

									<!-- 조회수 | 숫자 포맷 지정 -->
									<td><fmt:formatNumber type="number" value="${n.hit}" /></td>

									<!-- 공개 여부 | "1" => 체크 !"1" => 체크 X | open_id에 n.id를 축적-->
									<td><input type="checkbox" name="open_id" value="${n.nid}"
										${(n.pub == 1)?"checked":""}></td>

									<!-- 제거 여부 | del_id에 n.id를 축적 -->
									<td><input type="checkbox" name="del_id" value="${n.nid}"></td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
				</table>
			</div>

			<div class="row">

				<div class="ps-4 pb-1 col">
					<select name="o" style="width: 30%;" class="form-select"
						id="order_btn" aria-label="Default select">

						<option ${(param.o == 'REGDATE') ? "selected":""} value="REGDATE">최신순</option>

						<option ${(param.o == 'HIT') ? "selected":""} value="HIT">조회순</option>

					</select>
				</div>

				<!-- 일괄공개 | 일괄삭제 | 글쓰기 -->
				<div class="mb-2 mx-2 d-flex justify-content-end col">

					<!-- ids 초기화 -->
					<c:set var="ids" value="" />

					<!-- 게시판 -->
					<c:if test="${param.l == '1'}">

						<!-- 관리자 -->
						<c:if test="${sessionScope.userMember.role == 'ADMIN'}">

							<!-- ids : 목록의 모든 id (일괄 등록시 사용) -->
							<c:forEach var="n" items="${list2}">
								<c:set var="ids" value="${ids} ${n.nid}" />
							</c:forEach>
							<input type="hidden" name="ids" value="${ids}" />

							<!-- 일괄 등록 / 일괄 삭제 -->
							<div class="btn-group" role="group">
								<!-- open_id => 공개 / (ids - open_id) => 비공개 -->
								<input type="submit" class="btn btn-outline-primary" name="btn"
									value="일괄공개">

								<!-- 체크된 del_id 삭제 -->
								<input type="submit" class="btn btn-danger" name="btn"
									value="일괄삭제">
							</div>

						</c:if>

						<!-- 비회원 X -->
						<c:if test="${sessionScope.userMember != null}">
							<a class="ms-2 btn btn-primary" href="/reg?l=${param.l}">글쓰기</a>
						</c:if>
					</c:if>

					<!-- 마이페이지 -->
					<c:if test="${param.l == '2'}">

						<!-- ids : 목록의 모든 id (일괄 등록시 사용) -->
						<c:forEach var="n" items="${list3}">
							<c:set var="ids" value="${ids} ${n.nid}" />
						</c:forEach>
						<input type="hidden" name="ids" value="${ids}" />

						<!-- 일괄 등록 / 일괄 삭제 -->
						<div class="btn-group" role="group">
							<!-- open_id => 공개 / (ids - open_id) => 비공개 -->
							<input type="submit" class="btn btn-outline-primary" name="btn"
								value="일괄공개">

							<!-- 체크된 del_id 삭제 -->
							<input type="submit" class="btn btn-danger" name="btn"
								value="일괄삭제">
						</div>

						<a class="ms-2 btn btn-primary" href="/reg?l=${param.l}">글쓰기</a>
					</c:if>
				</div>
			</div>
		</form>
	</div>

	<!-- 현재페이지 / 전체페이지 -->
	<div class="px-5 mx-2 mb-5 d-flex justify-content-end">

		<div class="fw-bold">
			<span class="text-primary"> ${page} </span> / ${lastNum} pages
		</div>
	</div>

	<!-- 페이지네이션 -->
	<div class="d-flex justify-content-center">
		<ul class="pagination">

			<!-- startNum 의 최솟값 : 1 -->
			<!-- startNum 의 최댓값 : 마지막 페이지 목록의 첫번째 번호 -->

			<!-- 이전 -->
			<li class="page-item">
				<!--  시작 페이지 > 1 | (6, 11, 16, 21 ...) --> <c:if
					test="${startNum-1>=1}">
					<!-- (시작 페이지 - 1) : 이전 페이지의 마지막 번호 -->
					<!-- list로 이동 ? p(페이지) & f(검색 필드) & q(검색어) & l(게시판 or 마이페이지) -->
					<a
						href="?p=${startNum-1}&f=${param.f}&q=${param.q}&l=${param.l}&o=${param.o}"
						aria-label="Previous" class="page-link"><span
						aria-hidden="true">&laquo;</span></a>
				</c:if> <!--  시작 페이지 == 1 --> <c:if test="${startNum-1<1}">
					<!-- disabled -->
					<a href="#" aria-label="Previous" class="page-link disabled"><span
						aria-hidden="true">&laquo;</span></a>
				</c:if>
			</li>

			<!-- 번호 -->
			<c:forEach var="i" begin="0" end="4">
				<!-- 현재 페이지 <= 마지막 페이지 -->
				<c:if test="${startNum + i <= lastNum}">
					<!-- 현재 페이지 : 시작 페이지 + i (i=0~4) | active -->
					<li class="page-item">
						<!-- list로 이동 ? p(페이지) & f(검색 필드) & q(검색어) & l(게시판 or 마이페이지) --> <a
						class="page-link ${(page==(startNum+i))?'active':''} fw-bold"
						href="?p=${startNum + i}&f=${param.f}&q=${param.q}&l=${param.l}&o=${param.o}">${startNum + i}</a>
					</li>
				</c:if>
			</c:forEach>

			<!-- 다음 -->
			<li class="page-item">
				<!-- 다음 페이지 목록의 첫번째 번호 <= 마지막 페이지 --> <c:if
					test="${(startNum+5)<=lastNum}">
					<!-- (시작 페이지 + 5) : 다음 페이지 목록의 첫번째 번호 -->
					<!-- list로 이동 ? p(페이지) & f(검색 필드) & q(검색어) & l(게시판 or 마이페이지) -->
					<a
						href="?p=${startNum+5}&f=${param.f}&q=${param.q}&l=${param.l}&o=${param.o}"
						aria-label="Next" class="page-link"> <span aria-hidden="true">&raquo;</span>
					</a>
				</c:if> <!-- 다음 페이지 목록의 첫번째 번호 > 마지막 페이지 --> <c:if
					test="${(startNum+5)>lastNum}">
					<!-- disabled -->
					<a href="#" aria-label="Next" class="page-link disabled"> <span
						aria-hidden="true">&raquo;</span>
					</a>
				</c:if>
			</li>

		</ul>
	</div>

</body>
</html>