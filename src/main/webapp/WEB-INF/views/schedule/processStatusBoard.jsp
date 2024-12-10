<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>A/S처리현황 표시 게시판</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/schedule/processStatusBoard.css">
</head>
<body>
	 <h1>A/S 처리현황</h1>
    <table>
        <thead>
            <tr>
                <th>접수번호</th> <!-- rnum(DB접수번호) -->
                <th>접수일자</th> <!-- rdate(DB접수일자) -->
                <th>고객명</th>	<!-- cname(DB고객명) -->
                <th>처리현황</th> <!-- 새 칼럼 processStatus -->
                <th>완료일자 및 시각</th> <!-- visitedateEnd(DB완료일자 시각) -->
            </tr>
        </thead>
        <tbody>
            <c:forEach var="status" items="${statusList}">
                <tr>
                    <td>${status.rnum}</td>
                    <td>${status.rdate}</td>
                    <td>${status.cname}</td>
                    <td>${status.processStatus}</td> <!-- 새로운 칼럼 -->
                    <td>${status.visitdate_end}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>