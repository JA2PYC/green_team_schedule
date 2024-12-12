<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
	href="/resources/css/board/update.css" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
	<main>
		<div class="boardUpdate">
			<h1>공지사항</h1>
			<hr>
			<div class="update">
				<form role="form" action="/board/update" method="post">
					<input type="hidden" name="bnum" value="${board.bnum}" />
					<table>
						<thead>
							<tr>
								<th><c:out value="${board.bnum}" /></th>
								<td colspan="5"><input class="form-control" name='title'
									value='<c:out value="${board.title }"/>'></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><c:out value="${board.ename}" /></td>
								<th>작성일</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.postdate}" /></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="6"><textarea class="form-control" rows="3"
										name='content'><c:out value="${board.content }"> </c:out></textarea></td>
							</tr>
						</tbody>
					</table>
				</form>
				<div class="updateButton">
					<button type="submit" data-oper='update'>수정</button>
					<button type="submit" data-oper='list'>목록</button>
				</div>
			</div>
		</div>

	</main>
	<script type="text/javascript">
		$(document).ready(function() {

			var formObj = $("form");

			$('button').on("click", function(e) {
				e.preventDefault();

				var operation = $(this).data("oper");

				console.log(operation);

				if (operation === 'remove') {
					formObj.attr("action", "/board/remove");
				} else if (operation === 'list') {
					// move to list
					self.location = "/board/list";
					return;
				}
				formObj.submit();
			})
		})
	</script>
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
</body>
</html>