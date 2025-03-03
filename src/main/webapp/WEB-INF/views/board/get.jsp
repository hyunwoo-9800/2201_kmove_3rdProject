<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/menu.jsp"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">掲示物</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">掲示物</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<div class="form-group">
					
 					<label>番号</label> 
					
 					<input type="hidden" class="form-control" name='bno' value='<c:out value="${board.bno }"/>' readonly="readonly">
 				</div>

				<div class="form-group">
					
					<label>タイトル</label>
					
					<input class="form-control" name='title' value='<c:out value="${board.title}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					
<!-- 					<label>url</label> -->
<%-- 					<input class="form-control" name='url' value='<c:out value="${board.url}"/>' readonly="readonly"> --%>
					<iframe width="560" height="315" src="${ board.url }" title="YouTube video player">
					</iframe>
				</div>
				
				
				<div class="form-group">
					
					<label>内容</label>
					
					<textarea class="form-control" rows="30" name='content' readonly="readonly"><c:out value="${board.content}" /></textarea>
				</div>

				<div class="form-group">
					
					<label>作成者</label>
					
					<input class="form-control" name='writer' value='<c:out value="${board.writer }"/>' readonly="readonly">
				</div>

		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<button data-oper='modify' class="btn btn-default">修正</button>
		</sec:authorize>

				<button data-oper='list' class="btn btn-info">リスト</button>

				<form id='operForm' action="/boad/modify" method="get">
				
				<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
				
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				
				<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
				
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
				
				<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>

				</form>



			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->



<div class='bigPictureWrapper'>
	<div class='bigPicture'></div>
</div>



<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 600px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/board/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
	  window.history.back();
    operForm.find("#bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();
    
  });  
});
</script>

<%@include file="../includes/footer.jsp"%>
