<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
    <h1 class="page-header">Admin Modify</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Admin Modify</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
      
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
      
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
    
<div class="form-group">
  <label>番号</label>
  <input class="form-control" name='bango' 
     value='<c:out value="${member.bango}"/>' readonly="readonly">
</div>

<div class="form-group">
  <label>ID</label> 
  <input class="form-control" name='id' 
    value='<c:out value="${member.id}"/>' readonly="readonly">
</div>

<div class="form-group">
  <label>パスワード</label>
   <input class="form-control" name='password' 
    value='<c:out value="${member.password }"/>'readonly="readonly">
</div>

<div class="form-group">
  <label>名前</label> 
  <input class="form-control" name='namae'
    value='<c:out value="${member.namae}"/>'readonly="readonly">            
</div>

<div class="form-group">
  <label>誕生日</label> 
  <input class="form-control" name='tannjyoubi '
    value='<c:out value="${member.tannjyoubi}"/>'readonly="readonly">              
</div>

<div class="form-group">
  <label>メール</label> 
  <input class="form-control" name='mail'
    value='<c:out value="${member.mail}"/>'readonly="readonly">              
</div>

<div class="form-group">
  <label>電話番号</label> 
  <input class="form-control" name='dennwabanngo'
    value='<c:out value="${member.dennwabanngo}"/>'readonly="readonly">              
</div>

<div class="form-group">
  <label>登録日</label>
  <input class="form-control" name='regDate'
    value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${member.regDate}" />'  readonly="readonly">            
</div>

<div class="form-group">
  <label>レベル</label> 
  <input class="form-control" name='authority'
    value='<c:out value="${auth.authority}"/>'readonly="readonly">            
</div>


 <button type="submit" onclick="location.href='/admin/admin_update?id=${ member.id }'">修正ページへ</button>
  
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

<%@include file="../includes/footer.jsp"%>
