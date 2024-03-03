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
<script type="text/javascript" src="js/agree.js" charset="utf-8"></script>
<body class="container">

	<!-- 헤더 -->
	<jsp:include page="../header.jsp" flush="false"></jsp:include>

	<!-- 제목 -->
	<div class="pt-5 px-5">
		<h2 class="ps-5">가입 동의</h2>
	</div>

	<!-- 브래드크럼브 -->
	<div class="pt-3 px-5 d-flex justify-content-end">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">home</li>
			<li class="breadcrumb-item">회원 메뉴</li>
			<li class="breadcrumb-item text-primary active">가입 동의</li>
		</ol>
	</div>

	<!-- 가입 동의 본문 -->
	<div class="mt-4 px-5 mx-3">

		<div class="pb-3 ps-3">
			<span class="fw-bold"> ※ 개인정보 수집 및 이용</span>에 대한 안내입니다. 불편하신 사항이
			없으시도록 꼭 읽어주시기 바랍니다.
		</div>
		<div>
			<textarea style="width: 100%; height: 400px">
				
	가. 수집 및 이용 목적
	  o 한국저작권위원회에서 실시하는 기획혁신본부장 공모에 필요한 사항(응시원서 접수, 선발전형, 자격증빙 확인, 지원자의 시험성적 확인, 경력사항 
		증빙 등)에 대하여 외부공모 과정 진행을 위하여 필요한 최소한의 범위 내에서 개인정보를 수집하고 있습니다.
	
	나. 수집 및 이용 항목
	  1) 필수항목 : 성명(한글/한자/영문), 생년월일, 연락처, 전자우편, 주소, 병역사항, 증명사진, 경력사항, 자격증 취득여부
				 한국저작권위원회가 위와 같이 개인정보 필수항목을 수집ㆍ이용하는 것에 동의합니다.
	  2) 선택항목 : 보훈대상, 장애 관련 사항, 자격사항, 사회경험, 경력사항 등 입사에 필요한 일반 정보
				 한국저작권위원회가 위와 같이 개인정보 선택항목을 수집ㆍ이용하는 것에 동의합니다.
	다. 개인정보의 보유 및 이용 기간
	  o 입사지원자의 개인정보 수집ㆍ이용에 관한 동의일로부터 채용절차 종료 시까지 위 이용목적을 위하여 보유 및 이용하게 됩니다. 단, 채용절차 
		종료 후에는 고용계약 유지, 민원처리, 분쟁해결 및 법령상 의무이행 등을 위하여 1년간 보유하게 됩니다.
	
	라. 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
	  o 위 개인정보 중 필수정보의 수집ㆍ이용에 관한 동의는 외부공모 진행을 위해 필수적이므로, 위 사항에 동의하셔야만심사 및 근로계약의 
	  	체결이 가능합니다.
	  o 지원자는 개인정보의 선택항목 제공 동의를 거부할 권리가 있습니다. 다만, 지원자가 선택항목 동의를 거부하는 경우 원활한 
		공모 심사를 할 수 없어 공모 접수에 제한을 받을 수 있습니다.
		
			</textarea>
		</div>
	</div>

	<!-- 약관 동의 체크박스 | 다음 버튼 -->
	<div class="d-flex justify-content-center mb-5">

		<form id="frm" action="/join" method="post" class="text-center">

			<!-- 약관 동의 체크박스 -->
			<div class="my-3 form-check">
				<input class="form-check-input" type="checkbox" name="agree"
					value="true" id="flexCheckDefault" /> <label
					class="form-check-label" for="flexCheckDefault"> 약관에 동의합니다.
				</label>
			</div>

			<!-- 다음 버튼 -->
			<div>
				<!-- 다음 버튼 | agree.js 실행 -> form 전송 -->
				<input id="submit-button" class="btn btn-primary"
					style="height: 40px; width: 100px; font-size: 13px;" type="button"
					value="다음" />
			</div>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>