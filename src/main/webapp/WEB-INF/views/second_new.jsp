<%@page import="java.util.List"%>
<%@page import="org.team.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<table border="1">
		<thead>
			<tr>
				<th>#번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
	                     
		<c:forEach items="${boardlist}" var="board">
			<tr>
				<td><c:out value="${ board.bnum}"/></td>
				<td><a href='/read/get?bnum=<c:out value="${board.bnum}"/>'>
				<c:out value="${board.title}"/></a></td>
				<td><c:out value="${board.ename}" /></td>
				<%-- <td><c:out value="${board.postdate}" /></td> --%>
 				<td><fmt:formatDate pattern="yyyy-MM-dd"
				value="${board.postdate}"/></td>
				<td><c:out value="${board.visitcount}" /></td>
			</tr>
		</c:forEach>            			                     		
	</table>
</div>

<!-- 페이징 네비게이션 -->
<div>
    <!-- 이전 페이지 링크 -->
    <c:if test="${currentPage > 1}">
        <a href="/second_new?page=${currentPage - 1}">Previous</a>
    </c:if>
    
    <!-- 페이지 번호 링크 -->
    <c:forEach begin="1" end="${totalPages}" var="i">
        <a href="/second_new?page=${i}">${i}</a>
    </c:forEach>
    
    <!-- 다음 페이지 링크 -->
    <c:if test="${currentPage < totalPages}">
        <a href="/second_new?page=${currentPage + 1}">Next</a>
    </c:if>
</div>

<br>
<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=e1ec5378979a9f3ffe97d798bdcd05e1&libraries=services,route"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//출발지 주소를 '울산 남구 삼산중로100번길 26'으로 설정하여 좌표를 검색합니다
geocoder.addressSearch('울산 남구 삼산중로100번길 26', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {

        var startCoords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 출발지 마커를 표시합니다
        var startMarker = new kakao.maps.Marker({
            map: map,
            position: startCoords
        });

        // 출발지 마커에 대한 인포윈도우 표시
        var startInfowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">출발지</div>'
        });
        startInfowindow.open(map, startMarker);

        // 목적지 주소를 '울산 남구 중앙로 201'으로 설정하여 좌표를 검색합니다
        geocoder.addressSearch('울산 남구 중앙로 201', function(result, status) {

            if (status === kakao.maps.services.Status.OK) {

                var destinationCoords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 목적지 마커를 표시합니다
                var destinationMarker = new kakao.maps.Marker({
                    map: map,
                    position: destinationCoords
                });

                // 목적지 마커에 대한 인포윈도우 표시
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">목적지</div>'
                });
                infowindow.open(map, destinationMarker);

                // 출발지와 목적지 사이의 중간 지점을 계산하여 지도 중심 설정
                var centerLat = (startCoords.getLat() + destinationCoords.getLat()) / 2;
                var centerLng = (startCoords.getLng() + destinationCoords.getLng()) / 2;
                var centerCoords = new kakao.maps.LatLng(centerLat, centerLng);
                map.setCenter(centerCoords);
                
                getCarDirection(startCoords, destinationCoords);
        

            }
        });
    }
});
        
//카카오 네비 API를 호출하여 차량 경로를 계산하고 지도에 표시
async function getCarDirection(startCoords, destinationCoords) {
	
    console.log(startCoords);
    console.log(destinationCoords);

    const REST_API_KEY = '4f996114cccadd84c1b311d572c14783'; // 여기에 카카오 네비 API 키 입력
    const url = 'https://apis-navi.kakaomobility.com/v1/directions';
	
/*     const origin = String(startCoords.getLng()) + ',' + String(startCoords.getLat());
    const destination = String(destinationCoords.getLng()) + ',' + String(destinationCoords.getLat()); */
    
    const origin = [startCoords.getLng(), startCoords.getLat()].join(',');
    const destination = [destinationCoords.getLng(), destinationCoords.getLat()].join(',');

    const headers = {
        Authorization: `KakaoAK 4f996114cccadd84c1b311d572c14783`,
        'Content-Type': 'application/json'
    };

    const queryParams = new URLSearchParams({
        origin: origin,
        destination: destination,
        car_type: "1",  // 차량 경로로 설정
        options: {
            /* avoid: ['toll'], // 유료 도로 회피 옵션 예시 */
        } 
    });
    
    console.log(queryParams.toString());

    console.log(url);
    
    const requestUrl = String(url) + '?' + String(queryParams); // 파라미터까지 포함된 전체 URL
    
    console.log(requestUrl);
    
    try {
        const response = await fetch(requestUrl, {
            method: 'GET',
            headers: headers,
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        console.log(data); // 응답 데이터 확인
        console.log(data.routes[0]); // 응답 데이터 확인
        console.log(data.routes[0].sections);
        console.log(data.routes[0].sections[0]);
        console.log(data.routes[0].sections[0].polyline);
        
        // 경로가 존재하는지 먼저 확인하고, 없을 경우 에러 처리
        if (data.routes && data.routes[0] && data.routes[0].sections && data.routes[0].sections[0]) {
            const section = data.routes[0].sections[0];
            console.log(section); // sections 안의 데이터 확인

            // polyline 데이터가 있을 경우만 폴리라인 그리기
            if (section.polyline) {
                const path = section.polyline;
                const polylinePath = path.map(point => new kakao.maps.LatLng(point[1], point[0]));  // 경로 좌표 변환

                const polyline = new kakao.maps.Polyline({
                    map: map,
                    path: polylinePath,
                    strokeWeight: 5,
                    strokeColor: '#FF0000',
                    strokeOpacity: 1,
                    strokeStyle: 'solid'
                });

                polyline.setMap(map);  // 지도에 폴리라인을 표시
            } else {
                console.error('Polyline data is missing in the response.');
                alert('경로를 찾을 수 없습니다. polyline 데이터가 없습니다.');
            }
        } else {
            console.error('Route or sections not found in the response.');
            alert('경로를 찾을 수 없습니다.');
        }
    } catch (error) {
        // API 호출 오류 처리
        console.error('API 호출 오류:', error);
        alert('경로 계산에 실패했습니다.');
    }
}
     

</script>



</body>
</html>