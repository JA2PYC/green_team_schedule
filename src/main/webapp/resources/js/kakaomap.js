/**
 * 
 */

// 카카오 지도 로드 함수
function loadMap(location) {
	let mapContainer = document.getElementById('map');
	mapContainer.innerHTML = ''; // 이전 지도 내용 초기화

	let geocoder = new kakao.maps.services.Geocoder();
	let mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), // 기본 위치
		level: 3
	};

	// 지도 객체 미리 생성
	let map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환을 위한 카카오 지도 API 호출
	geocoder.addressSearch(location, function(result, status) {
		
		if (status === kakao.maps.services.Status.OK) {
			let coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			// 새로운 지도 생성 및 업데이트
			// 지도 초기화 후 약간의 지연을 두고 지도를 다시 렌더링
			setTimeout(function() {
				map.setCenter(coords);

				// 마커 표시
				let marker = new kakao.maps.Marker({
					map: map,
					position: coords
				});

				// 인포윈도우 표시
				let infowindow = new kakao.maps.InfoWindow({
					content: '<div style="width:150px;text-align:center;padding:6px 0;">' + location + '</div>'
				});
				infowindow.open(map, marker);

				// 지도 레이아웃 갱신
				map.relayout(); // 레이아웃 다시 계산

				// 지도 로딩 완료 후 모달 표시
				//				let eventDetails = document.getElementById('eventDetails');
				//				eventDetails.style.display = 'block';
			}, 100);
		} else {
			console.error("주소 변환 실패: " + status);
		}
	});
}