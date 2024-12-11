<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Board - ${board.title }</title>
<!-- Head Requires // 헤더 공통 스크립트 -->
<jsp:include page="/WEB-INF/views/includes/headScript.jsp"></jsp:include>

<!-- Page Style // 개별 페이지 스타일 및 스크립트 -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/board/post.css" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
	<main>
		<div class="boardPost">
			<h1>공지사항</h1>
			<hr>
			<input type="hidden" name="bnum" value="${board.bnum}" />
			<table>
				<thead>
					<tr>
						<th><c:out value="${board.bnum}" /></th>
						<td><c:out value="${board.title}" /></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><c:out value="${board.ename}" /></td>
						<th>작성일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board.postdate}" /></td>
						<th>조회수</th>
						<td><c:out value="${board.visitcount}" /></td>
					</tr>
				</thead>
				<tr>
					<td colspan="6"><c:out value="${board.content}" /></td>
				</tr>
			</table>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>
</html>