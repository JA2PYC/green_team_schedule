<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A/S 처리현황</title>
<!-- Head Requires // 헤더 공통 스크립트 -->
<jsp:include page="/WEB-INF/views/includes/headScript.jsp"></jsp:include>

<!-- Page Style // 개별 페이지 스타일 및 스크립트 -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/schedule/processStatusBoard.css">
<script type="text/javascript"
	src="/resources/js/schedule/processStatusBoard.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
	<main>
		<div class="processStatus">
			<h1>A/S 처리현황</h1>
			<hr>
			<table>
				<thead>
					<tr>
						<th>접수번호</th>
						<!-- rnum(DB접수번호) -->
						<th>접수일자</th>
						<!-- rdate(DB접수일자) -->
						<th>고객명</th>
						<!-- cname(DB고객명) -->
						<th>처리현황</th>
						<!-- 새 칼럼 processStatus -->
						<th>완료 예정일시</th>
						<!-- visitedateEnd(DB완료일자 시각) -->
						<th>처리 버튼</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="status" items="${statusList}">
						<tr>
							<td>${status.rnum}</td>
							<td>${status.rdate}</td>
							<td>${status.cname}</td>
							<td>${status.processStatus}</td>
							<!-- 새로운 칼럼 -->
							<td>${status.visitdate_end}</td>
							<td><button class="status">처리 버튼</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>
</html>