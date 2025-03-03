<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/menu.jsp"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">掲示物作成</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

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
}

.uploadResult ul li img {
	width: 100px;
}
</style>

<style>
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
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">掲示物作成</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" name="keijiban" onsubmit="return Check();" action="/board/register" method="post">
        
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>          
        
          <div class="form-group">
            <!-- <label>番号</label> -->
            <input type="hidden" class="form-control" name='bno'>
          </div>
        
          <div class="form-group">
            <label>タイトル</label>
            <input class="form-control" name='title'>
          </div>
          
          <div class="form-group">
            <label>url</label>
            <input class="form-control" name='url'>
          </div>

          <div class="form-group">
            <label>内容</label>
            <textarea class="form-control" rows="30" name='content'></textarea>
          </div>

          <div class="form-group">
            <label>作成者</label> <input class="form-control" name='writer' 
                value='<sec:authentication property="principal.username"/>' readonly="readonly">
          </div>
          
<%--           <div class="form-group">
  			<label>登録日</label>　<input class="form-control" name='regdate'
    			value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate}"  />'readonly="readonly">            
		　</div>

		<div class="form-group">
  			<label>修正日</label>　<input class="form-control" name='updateDate'
    			value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updateDate}" />'readonly="readonly">            
		</div> --%>
          
          <div class="form-group">
            <!-- <label>タイプ</label> -->
            <input type="hidden" class="form-control" name='type' value="${ param.type }">
          </div>
          
          <button type="submit" data-oper='register' class="btn btn-default">書く</button>
          <button type="button" class="btn btn-default">後ろ</button>
        
        </form>
        
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<script>
		$("button[type='button']").on("click", function(e) {

			 window.history.back();

		});
</script>


<script type="text/javascript">
function Check() {

    if( keijiban.title.value == "" ) {

    	keijiban.title.focus();
        alert("タイトルを入力してください");
        
        return false;
        
    }
    
    if( keijiban.content.value == "" ) {

    	keijiban.content.focus();
        alert("内容を入力してください");
        
        return false;
        
    }
    
}

</script>

<%@include file="../includes/footer.jsp"%>
