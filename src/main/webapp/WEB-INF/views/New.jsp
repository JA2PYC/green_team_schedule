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
	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=e1ec5378979a9f3ffe97d798bdcd05e1&libraries=services"></script>
    <script>

    var selectedEvent = null;
    var mouseX = undefined;
    var mouseY = undefined;
    
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var jsonData = [
            <c:forEach var="board" items="${list}" varStatus="status">
                {
                    "title": "<c:out value="${board.cname}"/>",
                    "start": "<c:out value="${board.visitdate}"/>",
                    "end": "<c:out value="${board.visitdate_end}"/>",
                    "extendedProps": {
                    	"location": "<c:out value="${board.address}"/>" // DB에서 가져온 장소 값
                    }
                }
                <c:if test="${!status.last}">,</c:if> <!-- 마지막 요소 뒤에 쉼표를 없애기 위해 조건 추가 -->
            </c:forEach>
        ];
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
        	locale: 'ko',
        
        	  eventSources: [

        		    // your event source
        		    {
        		      events: jsonData,
        		      
        		      color: 'black',     // an option!
        		      textColor: 'yellow' // an option!
        		    }

        		    // any other event sources...

        		  ],
                  eventClick: function(info) {
                      handleEventClick(info);
                  }

        		});

        calendar.render();
    });
      
   // 카카오 지도 로드 함수
      function loadMap(location) {
          var mapContainer = document.getElementById('map');
          mapContainer.innerHTML = ''; // 이전 지도 내용 초기화

          var geocoder = new kakao.maps.services.Geocoder();
          var mapOption = {
              center: new kakao.maps.LatLng(33.450701, 126.570667), // 기본 위치
              level: 3
          };

          // 지도 객체 미리 생성
          var map = new kakao.maps.Map(mapContainer, mapOption);

          // 주소-좌표 변환을 위한 카카오 지도 API 호출
          geocoder.addressSearch(location, function(result, status) {
              if (status === kakao.maps.services.Status.OK) {
                  var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                  // 새로운 지도 생성 및 업데이트
                  // 지도 초기화 후 약간의 지연을 두고 지도를 다시 렌더링
            	  setTimeout(function() {
                  map.setCenter(coords);

                  // 마커 표시
                  var marker = new kakao.maps.Marker({
                      map: map,
                      position: coords
                  });

                  // 인포윈도우 표시
                  var infowindow = new kakao.maps.InfoWindow({
                      content: '<div style="width:150px;text-align:center;padding:6px 0;">' + location + '</div>'
                  });
                  infowindow.open(map, marker);
                  
                  // 지도 레이아웃 갱신
                  map.relayout(); // 레이아웃 다시 계산

                  // 지도 로딩 완료 후 모달 표시
                  var eventDetails = document.getElementById('eventDetails');
                  eventDetails.style.display = 'block';
              	}, 100); 
              } else {
                  console.error("주소 변환 실패: " + status);
              }
          });
      }
      
      // 이벤트 클릭 시 상세 정보 표시
      function handleEventClick(info) {
          selectedEvent = info.event;
          mouseX = info.jsEvent.clientX;
          mouseY = info.jsEvent.clientY;

          // 이벤트 상세 정보를 modal에 표시
          document.getElementById('eventTitle').innerText = selectedEvent.title;

          // 날짜 및 시간을 시간대 설정으로 포맷
          const startDate = new Date(selectedEvent.start);
          const endDate = new Date(selectedEvent.end + 60 * 60 * 1000);
          
          const startTime = startDate.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit', timeZone: 'Asia/Seoul' });
          const endTime = endDate.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit', timeZone: 'Asia/Seoul' });

          document.getElementById('eventTime').innerText = startTime + " ~ " + endTime;
         
          // 장소 (여기서 장소는 extendedProps로 가정)
		  document.getElementById('eventLocation').innerText = selectedEvent.extendedProps.location || "미정";

		  // 카카오 지도 로드
		  loadMap(selectedEvent.extendedProps.location);
          
          // 모달을 화면에 표시
          var eventDetails = document.getElementById('eventDetails');
          eventDetails.style.left = mouseX + 'px';
          eventDetails.style.top = mouseY + 'px';
          eventDetails.style.display = 'block';
      }
      
/*    // 카카오 지도 로드 함수
      function loadMap(location) {
          var mapContainer = document.getElementById('map');
          mapContainer.innerHTML = ''; // 이전 지도 내용 초기화

          var geocoder = new kakao.maps.services.Geocoder();

          // 주소-좌표 변환을 위한 카카오 지도 API 호출
          geocoder.addressSearch(location, function(result, status) {
              if (status === kakao.maps.services.Status.OK) {
                  var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                  // 새로운 지도 생성
                  var mapOption = {
                      center: coords,
                      level: 3
                  };

                  var map = new kakao.maps.Map(mapContainer, mapOption);

                  // 마커 표시
                  var marker = new kakao.maps.Marker({
                      map: map,
                      position: coords
                  });

                  // 인포윈도우 표시
                  var infowindow = new kakao.maps.InfoWindow({
                      content: '<div style="width:150px;text-align:center;padding:6px 0;">' + location + '</div>'
                  });
                  infowindow.open(map, marker);

                  // 지도의 중심을 결과값으로 받은 위치로 이동시킴
                  map.setCenter(coords);
              }
          });
      }
 */
      // 모달 닫기
      function closeEventDetails() {
          var eventDetails = document.getElementById('eventDetails');
          eventDetails.style.display = 'none';
      }

    </script>
  </head>
  <body>
  
      <div id='calendar'></div><br>
  
<!--   <p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=e1ec5378979a9f3ffe97d798bdcd05e1&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script> -->
  

    
    <!-- Event Details Modal (Initially Hidden) -->
    <div id="eventDetails" style="position: absolute; background: white; padding: 20px; border: 1px solid #ccc; display: none; width:500px; z-index:1000;">
        <h2 id="eventTitle"></h2>
        <div id="eventTimePlace">
            <p>시간: <span id="eventTime"></span></p>
            <p>주소: <span id="eventLocation"></span></p>
            <p>세부주소: <span id="eventLocation"></span></p>
            <p>
            위치: <div id="map" style="width:100%;height:350px;"></div> <!-- 카카오 지도 표시 영역 -->
        	</p>
        </div>
        <button onclick="closeEventDetails()">닫기</button>
    </div>
    
<%--     <h1>테스트용 텍스트</h1>
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
0.............<script>
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
</script> --%>

  </body>
</html>