<%@page import="java.util.List"%>
<%@page import="org.team.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
<!-- Head Requires // 헤더 공통 스크립트 -->
<jsp:include page="/WEB-INF/views/includes/headScript.jsp"></jsp:include>

<!-- Modal Style and Script -->
<script type="text/javascript" src="/resources/js/modal.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/modal.css">

<!-- Page Style // 개별 페이지 스타일 및 스크립트 -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/board/list.css" />
<script type="text/javascript" src="/resources/js/board/list.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
	<main>
		<div class="boardList">
			<h1>공지사항</h1>
			<hr>
			<div class="list">
				<table border="1">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>

					<c:forEach items="${boardlist}" var="board">
						<tr>
							<td><c:out value="${ board.bnum}" /></td>
							<td><a href='/read/post?bnum=<c:out value="${board.bnum}"/>'>
									<c:out value="${board.title}" />
							</a></td>
							<td><c:out value="${board.ename}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.postdate}" /></td>
							<td><c:out value="${board.visitcount}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<!-- 페이징 네비게이션 -->
			<div class="listButton">
				<!-- 이전 페이지 링크 -->
				<c:if test="${currentPage > 1}">
					<button class="buttonBox"
						onclick='window.location.href="/board/list?page=${currentPage - 1}"'>
						<i class="bi bi-chevron-left"></i>
					</button>
				</c:if>

				<!-- 페이지 번호 링크 -->
				<c:forEach begin="1" end="${totalPages}" var="i">
					<button class="buttonBox"
						onclick='window.location.href="/board/list?page=${i}"'>${i}</button>
				</c:forEach>

				<!-- 다음 페이지 링크 -->
				<c:if test="${currentPage < totalPages}">
					<button class="buttonBox"
						onclick='window.location.href="/board/list?page=${currentPage + 1}"'>
						<i class="bi bi-chevron-right"></i>
					</button>
				</c:if>
			</div>
		</div>
		<div id="eventModal" class="modal eventModal">
			<div class="modal-content">
				<h2 id="eventTitle"></h2>
				<hr>
				<div id="eventDetails"></div>
				<button class="eventButton">닫기</button>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>
</html>