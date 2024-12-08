$(document).ready(() => {
	function initialize() {
		eventHandler();
	}

	function eventHandler() {
		$(document).on('click', (e) => {
			console.log(e);
		});
	}

	function callCalendar() {
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
			eventSources: [
				{
					events: [
						{
							title: '물주기',
							start: '2024-12-01'
						},
						{
							title: '뚜껑 닫기',
							start: '2024-12-13',
							end: '2024-12-15'
						}
					],
					textColor: '#f0f0f0',
					backgroundColor: '#DE596C',
					borderColor: '#DE596C'
				}
			]
		});
		calendar.render();
	}

	function ajaxCalendar() {
		var params = {
			'name': '홍길동',
			'age': 20
		};

		// $.ajax : 요청 방식을 정의
		$.ajax({
			url: '요청 URL',
			async: true, // true:비동기 방식, false:동기 방식
			type: 'POST', // 요청 메소드 형식 (GET/POST)
			contentType: 'application/json', // 요청 데이터 형식
			dataType: 'json', //응답 데이터 형식
			data: JSON.stringify(params),
			success: function (data, status, xhr) {
				// 요청 성공 후처리
				alert("성공!");
			},
			error: function (xhr, status, error) {
				// 요청 실패 후처리
				alert("실패!");
			}
		});

	}

	initialize();
});