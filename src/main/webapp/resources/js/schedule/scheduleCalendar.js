$(document).ready(() => {
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


});