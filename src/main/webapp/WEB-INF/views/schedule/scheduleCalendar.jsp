<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>AS 달력</title>
<!-- Head Requires // 헤더 공통 스크립트 -->
<jsp:include page="/WEB-INF/views/includes/headScript.jsp"></jsp:include>

<!-- Full Calendar // 달력 라이러리 -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.15/locales/ko.global.js'></script>
<script
	src="
https://cdn.jsdelivr.net/npm/@fullcalendar/bootstrap5@6.1.15/index.global.min.js
"></script>

<!-- Page Style // 개별 페이지 스타일 및 스크립트 -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/schedule/scheduleCalendar.css" />
<script type="text/javascript"
	src="/resources/js/schedule/scheduleCalendar.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
	<main>
		<div class="scheduleCalendar">
			<h1>AS 달력</h1>
			<hr>
			<div id='calendar'></div>
			<div class='calendarData'>
				<form action="/schedule/registAS" method="post">
					<input type="hidden" name="asDate" />
					<button type="submit" class="calendar_submit">접수하기</button>
				</form>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>
</html>