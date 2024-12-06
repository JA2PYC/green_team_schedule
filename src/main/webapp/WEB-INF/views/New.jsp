<%@page import="java.util.List"%>
<%@page import="org.team.dto.ReservationDTO"%>
<%@page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
    <script
	src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.15/locales/ko.global.js'></script>
    	    <style>
	    
			.fc-day-sun .fc-col-header-cell-cushion {
				color: red;
			}
			.fc-day-sat .fc-col-header-cell-cushion {
				color: blue;
			}
	    	
/* 	    	.fc-daygrid-day .fc-daygrid-day-number {	// 일요일, 토요일 제외
	    		color: black;
	    	} */
	    	
	    	.fc-daygrid-day.fc-day-sun .fc-daygrid-day-number{ 		
	    		color: red;
	    	}
	    	.fc-daygrid-day.fc-day-sat .fc-daygrid-day-number{		
	    		color: blue;
	    	}
	    </style>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var jsonData = [
            <c:forEach var="board" items="${list}" varStatus="status">
                {
                    "title": "<c:out value="${board.cname}"/>",
                    "start": "<c:out value="${board.visitdate}"/>",
                    "end": "<c:out value="${board.visitdate}"/>",
                }
                <c:if test="${!status.last}">,</c:if> <!-- 마지막 요소 뒤에 쉼표를 없애기 위해 조건 추가 -->
            </c:forEach>
        ];
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
        	locale: 'ko',
            events: jsonData // jsonData 배열을 events로 전달
            ,
            eventClick: function(info) {
                alert('Event: ' + info.event.title);
                alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
                alert('View: ' + info.view.type);

                // change the border color just for fun
                info.el.style.borderColor = 'red';
              }
        });

        calendar.render();
    });
      

    </script>
  </head>
  <body>
    <div id='calendar'></div>
    <h1>테스트용 텍스트</h1>
                                <table border="1" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                    	<th>방문날짜</th>
                                        <th>이름</th>
                                        <th>번호</th>
                                    </tr>
                                </thead>
                         		<c:forEach items="${list}" var="board">
                     			<tr>
                     				<td><c:out value="${board.visitdate}"/></td>
                     				<td><c:out value="${board.cname}"/></td>
                     				<td><c:out value="${board.rnum}"/></td>
                     			</tr>
                     			</c:forEach>
                     			</table>
<div id="jsonOutput"></div>
<script>
    var jsonData = [
        <c:forEach var="board" items="${list}" varStatus="status">
            {
                "visitdate": "<c:out value="${board.visitdate}"/>",
                "cname": "<c:out value="${board.cname}"/>",
            }
            <c:if test="${!status.last}">,</c:if> <!-- 마지막 요소 뒤에 쉼표를 없애기 위해 조건 추가 -->
        </c:forEach>
    ];

    // JSON 데이터 출력 (콘솔에 출력)
    console.log(jsonData);
    
    // 자바스크립트에서 JSON 데이터로 처리할 수 있음
    jsonData.forEach(function(board) {

        document.write("title: " + board.cname + "<br>");
        document.write("start: " + board.visitdate + "<br><br>");
    });

    var jsonData = [
        <c:forEach var="board" items="${list}" varStatus="status">
            {
                "visitdate": "<c:out value="${board.visitdate}"/>",
                "cname": "<c:out value="${board.cname}"/>"
            }
            <c:if test="${!status.last}">,</c:if> <!-- 마지막 요소 뒤에 쉼표를 없애기 위해 조건 추가 -->
        </c:forEach>
    ];

    // JSON 데이터를 문자열로 변환하여 HTML 요소에 출력
    var jsonString = JSON.stringify(jsonData);
    document.getElementById("jsonOutput").textContent = jsonString;
</script>

  </body>
</html>