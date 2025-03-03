<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<%@include file="../includes/menu.jsp"%>
<%@include file="../includes/header.jsp"%>
<style>
@import url("reset.css");

* {
	box-sizing: border-box;
}
</style>

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
		
		<c:if test="${param.type eq '1'}">
		主の日説教
		</c:if>
		
		<c:if test="${param.type eq '2'}">
		水曜礼拝
		</c:if>
		
		<c:if test="${param.type eq '3'}">
		金曜祈禱会
		</c:if>
		
		<c:if test="${param.type eq '4'}">
		お知らせ
		</c:if>
		
		<c:if test="${param.type eq '5'}">
		校友お知らせ
		</c:if>
		
		<c:if test="${param.type eq '6'}">
		教会学校
		</c:if>
		
		<c:if test="${param.type eq '7'}">
		青年部
		</c:if>
		
				
			
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<button id='regBtn' type="button" class="btn btn-xs pull-right">書く</button>
		</sec:authorize>
			
		</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>タイトル</th>
							<th>作成者</th>
							<th>登録日</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="list">
						<tr>
							<td><a class='move' href='<c:out value="${list.bno}"/>'>
								<c:out value="${list.title}" /> <b>
							
							<td><c:out value="${list.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate}" /></td>
						</tr>
					</c:forEach>

				</table>

				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/board/list" method='get'>
							
							<select name='type'>
							
							<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
							
							<option value="T"
							<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>タイトル</option>
							
							<option value="C"
							<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>内容</option>
							
							<option value="W"
							<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>作成者</option>
							
							<option value="TC"
							<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>タイトル or 内容</option>
							
							<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>タイトル or 作成者</option>
							
							<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>タイトル or 内容 or 作成者</option>
							</select>
							
							<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
							
							<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
							
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							
							<button class='btn btn-default'>検索</button>
						
						</form>
					
					</div>
				
				</div>

				<div class='pull-right'>
					<ul class="pagination">

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next">
							<a href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>


					</ul>
				</div>
				<!--  end Pagination -->
			</div>

			<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

				<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> <input
					type='hidden' name='keyword'
					value='<c:out value="${ pageMaker.cri.keyword }"/>'>
					
			</form>


			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">処理されました！</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
</div>
<!-- /.row -->

<script type="text/javascript">
$(document).ready(function() {

	var result = '<c:out value="${result}"/>';

	checkModal(result);

	history.replaceState({}, null, null);

	function checkModal(result) {

		if (result === '' || history.state) {
			
			return;
		}

		if (parseInt(result) > 0) {
			
			$(".modal-body").html("掲示物 " + parseInt(result) + " 番が 登録されました！");
		
		}

	$("#myModal").modal("show");
	
	}

$("#regBtn").on("click", function() {

	self.location = "/board/register?type=${param.type}";

	});

var actionForm = $("#actionForm");

$(".paginate_button a").on("click", function(e) {

	e.preventDefault();

	console.log('click');

	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
	
	});

$(".move").on("click",function(e) {

	e.preventDefault();
	
	actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
	
	actionForm.attr("action","/board/get");
	
	actionForm.submit();

	});

var searchForm = $("#searchForm");

$("#searchForm button").on( "click", function(e) {

	if (!searchForm.find("option:selected").val()) {
		
		alert("検索条件を選んでください");
		return false;
	
	}

	if (!searchForm.find("input[name='keyword']").val()) {
		
		alert("キーワードを入力してください");
		return false;
	
	}

searchForm.find("input[name='pageNum']").val("1");
	
	e.preventDefault();

	searchForm.submit();

	});

});

</script>

<%@include file="../includes/footer.jsp"%>
