<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/menu.jsp"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">会員登録</h1>
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

      <div class="panel-heading">会員登録</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" name="touroku" action="/member/touroku" method="post" onsubmit="return Check()" >
        
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>          
        
          <div class="form-group">
            <label>id</label>
            <input class="form-control"  type="text" name='id' >
          </div>
          
          <div class="form-group">
            <label>password</label>
            <input class="form-control" type="text" name='password'>
          </div>
          
          <div class="form-group"> 
             <label>password確認</label>
            <input class="form-control" name='passwordKakuninn'>
           </div>

          <div class="form-group">
            <label>名前</label>
            <input class="form-control" type="text" name='namae'>
            </div>

          <div class="form-group">
            <label>誕生日</label>
            <input class="form-control" type="text" name='tannjyoubi'>
          </div>

          <div class="form-group">
            <label>mail</label>
            <input class="form-control" type="text" name='mail'>
          </div>
 
           <div class="form-group">
            <label>電話番号</label>
            <input class="form-control" type="text" name='dennwabanngo'>
          </div>
          
          <button type="submit" class="btn btn-default">加入</button>
        
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

function Check() {

    if( touroku.id.value == "" ) {

    	touroku.id.focus();
        alert("IDを入力してください");
        
        return false;
        
    }
    
    if( touroku.password.value == "" ) {

    	touroku.id.focus();
        alert("パスワードを入力してください");
        
        return false;
        
    }
    
    if( touroku.namae.value == "" ) {

    	touroku.id.focus();
        alert("お名前を入力してください");
        
        return false;
        
    }
    
    if( touroku.password.value != touroku.passwordKakuninn.value ) {

    	touroku.id.focus();
        alert("パスワードを確認してください");
        
        return false;
        
    }
    
}

</script>

<%@include file="../includes/footer.jsp"%>
