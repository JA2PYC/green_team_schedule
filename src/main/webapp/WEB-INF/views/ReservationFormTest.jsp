<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 등록</title>
</head>
<body>
    <h1>예약 등록</h1>
    
    <!-- 예약 등록 폼 -->
    <form action="${pageContext.request.contextPath}/reservation/register" method="post">
        <label for="rdate">예약 날짜:</label>
        <input type="datetime-local" id="rdate" name="rdate" required>
        <br><br>

        <label for="cname">이름:</label>
        <input type="text" id="cname" name="cname" required>
        <br><br>

        <label for="cphone">전화번호:</label>
        <input type="text" id="cphone" name="cphone" required>
        <br><br>

        <label for="address">주소:</label>
        <input type="text" id="address" name="address" required>
        <br><br>

        <label for="content">내용:</label>
        <textarea id="content" name="content" rows="5" cols="30" required></textarea>
        <br><br>

        <label for="visitdate">방문 날짜:</label>
        <input type="datetime-local" id="visitdate" name="visitdate" required>
        <br><br>

        <button type="submit">예약 등록</button>
    </form>
</body>
</html>