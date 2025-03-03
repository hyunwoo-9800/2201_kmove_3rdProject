<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%

String refer = request.getHeader("referer");

if(refer == null) {
	
	response.sendRedirect("/board/mainHome");
	
}

%>

<%@include file="../includes/menu.jsp"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
		</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">

			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<table class="table table-striped table-bordered table-hover">
					<thead>
					
						<tr>
							<!-- <th>番号</th> -->
							<th>ID</th>
							<th>名前</th>
							<th>誕生日</th>
							<th>登録日</th>
						</tr>
					</thead>
 <c:forEach items="${ member }" var="member" >
						<tr>
							<%-- <th>${member.bango}</th> --%>
							<th>${member.id}</th>
							<th><a href="/admin/admin_search?id=${ member.id }">${member.namae}</a></th>
							<th>${member.tannjyoubi}</th>
							<th><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regDate}" /></th>
						</tr>
 </c:forEach>
				</table>

<script type="text/javascript">

var actionForm = $("#actionForm");

$(".move").on("click",function(e) {

	e.preventDefault();
	
	actionForm.append("<input type='hidden' name='id' value='" + $(this).attr("href") + "'>");
	
	actionForm.attr("action","/admin/admin_update");
	
	actionForm.submit();

	});

</script>

<%@include file="../includes/footer.jsp"%>
