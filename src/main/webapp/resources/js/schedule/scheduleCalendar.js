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
   		 },
        description: `
            <strong>주소:</strong> ${item.address}<br>
            <strong>전화:</strong> ${item.cphone}<br>
        `, // 추가 설명 (주소, 전화번호)
        allDay: false // 시간 포함 여부 (여기선 false로 설정)
    }));
}

// Full Calendar 호출
function callCalendar(response) {
    // 데이터 변환
    let eventsData = transformData(response);
    console.log("events", eventsData);

    let calendarEl = document.getElementById('calendar');
    let calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        themeSystem: 'bootstrap5',
        locale: 'ko',
        timeZone: 'Asia/Seoul',

        headerToolbar: {
            start: 'today prev,next',
            center: 'title',
            end: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        events: eventsData, // 변환된 데이터를 직접 설정
        eventColor: '#DE596C', // 기본 배경색
        eventTextColor: '#f0f0f0' // 텍스트 색상
        
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
			success: function (response) {
				console.log('Success:', response);
				// 성공 시 처리 로직 추가
				callCalendar(response);
			},
			error: function (xhr, status, error) {
				console.error('Error:', status, error);
				// 오류 시 처리 로직 추가
			}
		});
	}

// DOM 로드 완료시 실행
$(document).ready(() => {
	function initialize() {
		ajaxCalendar();
		// eventHandler();
	}

	function eventHandler() {
		$(document).on('click', (e) => {
			console.log(e);
		});
	}

	initialize();
});