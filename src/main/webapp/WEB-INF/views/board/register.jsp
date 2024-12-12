<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>작성하기</title>
<!-- Head Requires // 헤더 공통 스크립트 -->
<jsp:include page="/WEB-INF/views/includes/headScript.jsp"></jsp:include>

<!-- Page Style // 개별 페이지 스타일 및 스크립트 -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/board/register.css" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
	<main>
		<div class="boardRegister">
			<h1>작성하기</h1>
			<hr>
			<div class="register">
				<form role="form" action="/board/register" method="post">
					<table>
						<thead>
							<tr>
								<th><label for="title">제목</label></th>
								<td><input type="text" name='title' id='title'
									class="form-control" placeholder="글제목"></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2"><textarea class="form-control" rows="12"
										name='content' placeholder="내용"></textarea></td>
							</tr>
						</tbody>
					</table>
					<div class="registerButton">
						<button type="submit">작성하기</button>
					</div>
				</form>
			</div>
		</div>
	</main>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#regBtn").on("click", function() {

				self.location = "/board/register";

			});

		});
	</script>
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>
</html>