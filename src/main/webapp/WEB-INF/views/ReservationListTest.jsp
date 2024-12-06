<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
</head>
<body>
    <h1>예약 목록</h1>

    <table border="1">
        <thead>
            <tr>
                <th>번호</th>
                <th>예약 날짜</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>주소</th>
                <th>내용</th>
                <th>방문 날짜</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="reservation" items="${reservations}">
                <tr>
                    <td>${reservation.rnum}</td>
                    <td>${reservation.rdate}</td>
                    <td>${reservation.cname}</td>
                    <td>${reservation.cphone}</td>
                    <td>${reservation.address}</td>
                    <td>${reservation.content}</td>
                    <td>${reservation.visitdate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>