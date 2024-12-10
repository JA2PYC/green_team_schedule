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
<link rel="stylesheet" type="text/css" href="" />
<script type="text/javascript" src=""></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
	<main>
		<div class="boardRead">
			<input type="hidden" name="bnum" value="${board.bnum}" />
			<table border="1" width="90%">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>내용</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>

				<tr>
					<td><c:out value="${board.bnum}" /></td>
					<td><c:out value="${board.title}" /></td>
					<td><c:out value="${board.ename}" /></td>
					<td><c:out value="${board.content}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${board.postdate}" /></td>
					<td><c:out value="${board.visitcount}" /></td>
				</tr>
			</table>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>
</html>