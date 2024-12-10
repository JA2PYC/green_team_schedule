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
<h2>read페이지</h2>
<form name="readFrm">
	<input type="hidden" name="bnum" value="${board.bnum}"/>
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
				<td><c:out value="${board.bnum}"/></td>
				<td><c:out value="${board.title}"/></td>
				<td><c:out value="${board.ename}" /></td>
				<td><c:out value="${board.content}" /></td>
 				<td><fmt:formatDate pattern="yyyy-MM-dd"
				value="${board.postdate}"/></td>
				<td><c:out value="${board.visitcount}" /></td>
			</tr>
	</table>
</form>
</body>
</html>