<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>개인정보 처리방침</title>
<!-- Head Requires // 헤더 공통 스크립트 -->
<jsp:include page="/WEB-INF/views/includes/headScript.jsp"></jsp:include>

<!-- PDF.js CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.10.377/pdf.min.js"></script>

<!-- PDF Function -->
<script type="text/javascript" src="/resources/js/pdfViewer.js"></script>

<!-- Page Style // 개별 페이지 스타일 및 스크립트 -->
<link rel="stylesheet" type="text/css" href="/resources/css/privacyPolicy.css" />
<script type="text/javascript" src="/resources/js/privacyPolicy.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
	<main>
		<div class="privacyPolicy">
			<h1>개인정보 처리방침</h1>
			<hr>
			<div id="pdf-viewer"></div>

			<!-- 페이지 네비게이션 버튼 -->
			<div class="page-navigation">
				<div class="pageButton" id="prev">
					<i class="bi bi-caret-left"></i>
				</div>
				<div class="pageButton" id="next">
					<i class="bi bi-caret-right"></i>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>
</html>