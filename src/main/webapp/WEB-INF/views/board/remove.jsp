<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div align="center">
		<h1>${ param.bno }番${ param.title }削除しました！</h1>
		<h2> 5秒後、元のページへ戻りますので少々お待ちくださいませ… </h2>
	</div><body onload="javascript:window_onload()">
</body>
 <script>

  

      function window_onload(){

         setTimeout('go_url()',5000)  // 5초후 go_url() 함수를 호출한다.

      }

 

      function go_url(){

         location.href="/board/list?type='${param.type}'";

      }

  

</script>
</html>