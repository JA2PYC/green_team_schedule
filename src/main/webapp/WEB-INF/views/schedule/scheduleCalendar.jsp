<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>AS 스케쥴</title>
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

<!-- Kakao Map API -->
<script type="text/javascript"
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=e1ec5378979a9f3ffe97d798bdcd05e1&libraries=services"></script>
<script type="text/javascript" src="/resources/js/kakaomap.js"></script>

<!-- Modal Style and Script -->
<script type="text/javascript" src="/resources/js/modal.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/modal.css">

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
			<h1>AS 스케쥴</h1>
			<hr>
			<div id='calendar'></div>
			<div class='calendarData'>
				<form action="/schedule/registAS" method="post">
					<input type="hidden" name="asDate" />
					<button type="submit" class="calendar_submit">접수하기</button>
				</form>
			</div>
		</div>
		<div id="eventModal" class="modal eventModal">
			<div class="modal-content">
				<h2 id="eventTitle">이벤트 제목</h2>
				<div id="eventTimePlace">
					<p>
						시간: <span id="eventTime"></span>
					</p>
					<p>
						주소: <span id="eventLocation"></span>
					</p>
					<p>
						세부주소: <span id="eventDetailLocation"></span>
					</p>
					<p>위치</p>
					<div id="map" style="width: 100%; height: 250px;"></div>
				</div>
				<button class="eventButton">닫기</button>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>
</html>