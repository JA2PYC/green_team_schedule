<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 - ${board.title }</title>
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
			<div class="post">
				<input type="hidden" name="bnum" value="${board.bnum}" />
				<table>
					<thead>
						<tr>
							<th><c:out value="${board.bnum}" /></th>
							<td colspan="5"><c:out value="${board.title}" /></td>
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
					<tbody>
						<tr>
							<td colspan="6"><c:out value="${board.content.replace()}" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="postButton">
				<button data-oper='update'
					onclick="location.href='/board/update?bnum=<c:out value="${board.bnum}"/>'">수정</button>
				<button class="buttonList"
					onclick="window.location.href='/board/list'">목록</button>
				<form role="form" action="/board/delete" method="post">
					<input type="hidden" name="bnum" value="${board.bnum}">
					<button type="submit" data-oper='delete'>삭제</button>
				</form>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>
</html>