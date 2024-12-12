<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Modify Page</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			
			<div class="panel-heading">Board Modify Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
			<form role="form" action="/board/update" method="post">
			
				<div class="form-group">
				<label>Bnum</label> <input class="form-control" name='bnum'
					value='<c:out value="${board.bnum }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
				<label>Title</label> <input class="form-control" name='title'
					value='<c:out value="${board.title }"/>'>
				</div>
				
				<div class="form-group">
				<label>Text area</label>
				<textarea class="form-control" rows="3" name='content'>
				<c:out value="${board.content }"/>
				</textarea>
				</div>
				
				
				<div class="form-group">
				<label>postdate</label> <input class="form-control" name='postdate'
					value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.postdate}"/>' readonly="readonly">
				</div>
				
			
					<button type="submit" data-oper='update' class="btn btn-default">update</button>
					<button type="submit" data-oper='list' class="btn btn-info">List</button>
						
			</form>
					
			</div>
			<!-- end panel-body -->
			
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
        
<script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action","/board/remove");
		}else if(operation === 'list'){
			// move to list
			self.location="/board/list";
			return;
		}
		formObj.submit();
	})
})
</script>
<%@include file="../includes/footer.jsp" %>
