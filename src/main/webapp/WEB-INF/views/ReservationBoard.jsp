<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
</head>
<body>
    <h1>게시판 목록</h1>
    <table border="1">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>상세보기</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="reservation" items="${list}">
                <tr>
                    <td>${reservation.rnum}</td>
                    <td>${reservation.cname}</td>
                    <td>${reservation.content}</td>
                    <td>${reservation.cphone}</td>
                    <td>${reservation.rdate}</td>
                    <td>
                        <a href="/reservation/get?rnum=${reservation.rnum}">상세보기</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>