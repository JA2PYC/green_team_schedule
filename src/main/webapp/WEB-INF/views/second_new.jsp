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
				<td><a href='/read/post?bnum=<c:out value="${board.bnum}"/>'>
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
</body>
</html>