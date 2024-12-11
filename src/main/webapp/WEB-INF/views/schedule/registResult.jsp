<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>AS 접수하기</title>
<!-- Head Requires // 헤더 공통 스크립트 -->
<jsp:include page="/WEB-INF/views/includes/headScript.jsp"></jsp:include>

<!-- Page Style & Script // 개별 페이지 스타일 및 스크립트-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/schedule/registResult.css">

</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
	<main>
		<div class="registResult">
			<h1>AS 접수결과</h1>
			<hr>
			<div class="result">
				<div class="check_icon">
					<i class="bi bi-check-circle bi-lg"></i>
				</div>
				<div class="resultMessage">${message }</div>
				<hr>
				<div class="cname">고객 ${data.cname }</div>
				<div class="visitdate">방문일 ${data.visitdate }</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>
</html>