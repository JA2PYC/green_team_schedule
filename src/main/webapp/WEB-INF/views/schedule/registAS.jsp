<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>AS 접수하기</title>
<!-- Head Requires // 헤더 공통 스크립트 -->
<jsp:include page="/WEB-INF/views/includes/headScript.jsp"></jsp:include>

<!-- Post Code Script // 다음 주소 API-->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- Page Style & Script // 개별 페이지 스타일 및 스크립트-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/schedule/registAS.css">
<script type="text/javascript" src="/resources/js/schedule/registAS.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
	<main>
		<div class="registAS">
			<h1>AS 접수하기</h1>
			<hr>
			<div class="register">
				<form action="/schedule/registProcess" method="post">
					<table>
						<caption>고객 정보 입력</caption>
						<tbody>
							<tr>
								<th><label for="customerName">성명</label></th>
								<td><input type="text" name="cname" id="customerName"
									placeholder="성명" required></td>
							</tr>
							<tr>
								<th><label for="customerPhone1">전화번호</label></th>
								<td><select name="customerPhone1" id="customerPhone1"
									class="phone">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select> - <input type="tel" name="customerPhone2" id="customerPhone2"
									class="phone" min="0000" max="9999" minlength="3" maxlength="4"
									step="1" placeholder="전화번호" required> - <input
									type="tel" name="customerPhone3" id="customerPhone3" class="phone"
									min="0000" max="9999" minlength="4" maxlength="4" step="1"
									placeholder="전화번호" required></td>
							</tr>
							<!-- DTO 설정중 확인 -->
							<tr>
								<th><label for="searchAddress">주 소</label></th>
								<td class="customerAddress">
									<button type="button" id="searchAddress"
										class="searchAddress btn btn-danger float-left">주소검색</button>
									<div>
										<input type="text" name="addressPostcode" id="addressPostcode"
											class="addressPostcode" placeholder="우편번호"> <input
											type="text" name="addressRoad" id="addressRoad"
											class="addressRoad" placeholder="도로명 주소"> <input
											type="text" name="addressBname" id="addressBname"
											class="addressBname" placeholder="동주소"> <input
											type="text" name="addressDetails" id="addressDetails"
											class="addressDetails" placeholder="상세주소">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<caption>제품 및 증상 입력</caption>
						<tbody>
							<tr>
								<th><label for="productType">제품 분류</label></th>
								<td><select name="category" id="productType"
									class="productType">
										<option value="gas">가스 보일러</option>
										<option value="oil">기름 보일러</option>
										<option value="other">그 외</option>
								</select></td>
							</tr>
							<tr>
								<th><label for="productId">모델명</label></th>
								<td><input type="text" name="model" id="productId"
									class="productId" placeholder="모델명"></td>
							</tr>
							<tr>
								<th><label for="troubleType">고장 증상</label></th>
								<td><select name="issue" id="troubleType"
									class="troubleType">
										<option value="e101">전원 고장</option>
										<option value="e201">온수 고장</option>
										<option value="e301">그 외</option>
								</select></td>
							</tr>
							<tr>
								<th><label for="troubleDetails">세부증상</label></th>
								<td><textarea name="detail" id="troubleDetails" rows="10" placeholder="세부증상"></textarea></td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<caption>희망 방문 일시</caption>
						<tbody>
							<tr>
								<td>
									<div class="calendar"></div>
									<div class="calendarTime"></div>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<caption>이용약관</caption>
						<tbody>
							<tr>
								<th>개인정보 수집 이용</th>
								<td><input type="checkbox" name="pinformation" id="term"><label
									for="term">개인정보 수집 이용 및 제3자 제공 동의서</label></td>
							</tr>
						</tbody>
					</table>
					<div>
						<button type="submit" class="btn btn-danger float-left">AS
							접수하기</button>
					</div>
				</form>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>
</html>