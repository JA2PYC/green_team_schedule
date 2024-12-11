// DOM 로드 완료시 실행
$(document).ready(() => {
	function initialize() {
		ajaxCalendar();
		//		eventHandler();
	}

	function eventHandler() {
		$(document).on('click', '.eventButton', (e) => {
			//	closeEventDetails();
		});
	}

	// Full Calendar 호출
	function callCalendar(response) {
		// 데이터 변환
				console.log(response)
		let eventsData = transformData(response);

		let calendarEl = document.getElementById('calendar');
		let calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: 'dayGridMonth',
			themeSystem: 'bootstrap5',
			locale: 'ko',
			// timeZone: 'Asia/Seoul',
			headerToolbar: {
				start: 'today prev,next',
				center: 'title',
				end: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			events: eventsData, // 변환된 데이터를 직접 설정
			eventColor: '#e77c2a', // 기본 배경색
			eventTextColor: '#f0f0f0', // 텍스트 색상
			eventClick: function(info) {
				console.log(info)
				handleEventClick(info);
			}
		});
		calendar.render();
	}

	// AJAX 요청
	function ajaxCalendar() {
		// 오늘 날짜를 yyyy-MM-dd 형식으로 생성
		const today = new Date().toISOString().slice(0, 10);

		// AJAX 요청 보내기
		$.ajax({
			url: '/schedule/calendar',
			type: 'POST',
			data: { today: today }, // 파라미터 포함
			dataType: 'json',
			success: function(response) {
				// 성공 시 처리 로직 추가
				callCalendar(response);
			},
			error: function(xhr, status, error) {
				console.error('Error:', status, error);
				// 오류 시 처리 로직 추가
			}
		});
	}

	// 데이터 형식변환
	function transformData(response) {
		// response 데이터를 FullCalendar 형식으로 변환
		return response.map(item => ({
			id: item.rnum, // 고유 ID
			title: item.cname, // 이벤트 제목: 고객 이름과 전화번호
			start: item.visitdate, // 시작 날짜 및 시간
			end: item.visitdate_end,
			extendedProps: {
				location: item.address, // 장소 정보 추가
				unit: item.unit
			},
			description: `
            <strong>주소:</strong> ${item.address}<br>
            <strong>전화:</strong> ${item.cphone}<br>
        `, // 추가 설명 (주소, 전화번호)
			allDay: false // 시간 포함 여부 (여기선 false로 설정)
		}));
	}

	// 이벤트 클릭 시 상세 정보 표시
	function handleEventClick(info) {
		console.log(info);
		selectedEvent = info.event;
		//		mouseX = info.jsEvent.clientX;
		//		mouseY = info.jsEvent.clientY;

		// 날짜 및 시간을 시간대 설정으로 포맷
		let startDate = new Date(selectedEvent.start);
		console.log(startDate)
		let endDate = new Date(selectedEvent.end + 60 * 60 * 1000);
		console.log(endDate)

		let startTime = startDate.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit' });
		console.log(startTime)
		let endTime = endDate.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit', timeZone: 'Asia/Seoul' });
		console.log(endTime)

		timeData = startTime + " ~ " + endTime;
		console.log(timeData)

		// 장소 (여기서 장소는 extendedProps로 가정)
		locationData = selectedEvent.extendedProps.location || "주소 확인요망";
		detailLocationData = selectedEvent.extendedProps.unit || "세부주소 확인요망";

		window.openModal({
			title: selectedEvent.title,
			time: timeData,
			location: locationData,
			detailLocation: detailLocationData
		});

		// 카카오 지도 로드
		loadMap(selectedEvent.extendedProps.location);
	}

	initialize();
});