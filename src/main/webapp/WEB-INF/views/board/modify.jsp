<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/menu.jsp"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">掲示物修正</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">掲示物修正</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

      <form role="form" action="/board/modify" method="post">
      
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
      
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
      
 
<div class="form-group">
  <label>番号</label> 
  <input class="form-control" name='bno' 
     value='<c:out value="${board.bno }"/>' readonly="readonly">
</div>

<div class="form-group">
  <label>タイトル</label> 
  <input class="form-control" name='title' 
    value='<c:out value="${board.title }"/>' >
</div>

   <div class="form-group">
    <label>url</label>
    <input class="form-control" name='url'
    value='<c:out value="${board.url }"/>'>
    </div>

<div class="form-group">
  <label>内容</label>
  <textarea class="form-control" rows="3" name='content' >
  <c:out value="${board.content}"/></textarea>
</div>

<div class="form-group">
  <label>作成者</label> 
  <input class="form-control" name='writer'
    value='<c:out value="${board.writer}"/>' readonly="readonly">            
</div>

<div class="form-group">
  <label>登録日</label> 
  <input class="form-control" name='regdate'
    value='<fmt:formatDate pattern = "yyyy/MM/dd"
    value = "${board.regdate}" />'  readonly="readonly">            
</div>

<div class="form-group">
  <label>修正日</label> 
  <input class="form-control" name='updateDate'
    value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updateDate}" />'
    readonly="readonly">            
</div>

<div class="form-group">
  <label>タイプ</label> 
  <input type="hidden" class="form-control" name='board_type'
   value='<c:out value="${param.type}"/>'  readonly="readonly">            
</div>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<button type="submit" data-oper='modify' class="btn btn-default">修正</button>
<button type="submit" data-oper='remove' class="btn btn-danger">削除</button>
<!-- <button type="submit" class="btn btn-info">リスト</button> -->
</sec:authorize>
  
<button type="button" class="btn btn-info" >リスト</button>
  
  
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
  <div class='bigPicture'>
  </div>
</div>



<style>
.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
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
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>

	<script>
		$("button[type='button']").on("click", function(e) {

			 window.history.back();
			 window.history.back();
			//location.href = "/board/mainHome";

		});
	</script>
<script type="text/javascript">
$(document).ready(function() {

	  var formObj = $("form");

	  $('button').on("click", function(e) {
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove') {
	    	
	      formObj.attr("action", "/board/remove");
	      
	    } else if(operation === 'modify') {
	        
	    	formObj.attr("action", "/board/modify");
	        
	    }
	   
	    formObj.submit();
	  
	  });

});
</script>

<%@include file="../includes/footer.jsp"%>
