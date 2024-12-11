<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>난방기사 A/S 스케쥴 관리 서비스</title>
<!-- Head Requires // 헤더 공통 스크립트 -->
<jsp:include page="/WEB-INF/views/includes/headScript.jsp"></jsp:include>

<!-- Page Style & Script // 개별 페이지 스타일 및 스크립트-->
<link rel='stylesheet' type='text/css' href='/resources/css/home.css'>
</head>
<body>
	<main>
		<div class="home">
			<h1>난방기사 A/S 스케쥴 관리 서비스</h1>
			<hr>
			<div class="homeMenu">
				<a href="/board/list">
					<div class="menuBox menuRegist">
						<i class="bi bi-info-square"></i><span>공지사항</span>
					</div>
				</a> <a href="/schedule/calendar">
					<div class="menuBox menuCalendar">
						<i class="bi bi-calendar-check"></i><span>AS 스케쥴</span>
					</div>
				</a> <a href="/schedule/registAS">
					<div class="menuBox menuRegist">
						<i class="bi bi-file-earmark-plus"></i><span>AS 접수</span>
					</div>
				</a> </a> <a href="/schedule/processStatus">
					<div class="menuBox menuRegist">
						<i class="bi bi-file-earmark-bar-graph"></i><span>AS 현황</span>
					</div>
				</a>
			</div>
		</div>
	</main>
</body>
</html>