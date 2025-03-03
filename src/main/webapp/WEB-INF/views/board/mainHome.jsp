<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>栄光長老教会</title>
<style type="text/css">
@import url("reset.css");

* {
	box-sizing: border-box;
}



.wrap {
	margin: 0 auto;
	width: 1000px;
}

#content_img{

	/*  border: 1px solid dimgrey; */
     margin: 0 auto;
	
}
#main {
	height: 600px;
	width: 1500px;
	display: flex;
    justify-content: center; /* 1 */
  /*   border-bottom: 1px solid dimgrey; */
}



.flex-container {
	display: flex;
	height: 300px;
	width: 1500px;
	justify-content: center;
}

.flex-item {
  /* flex-grow: 1; /* 
  flex-shrink: 1; 
  flex-basis: 0; */
  flex:0;
  margin:0;
  
 
}

.flex-item-right {
  margin-left: auto;
} 

</style>
</head>
<body>
<%@include file="../includes/menu.jsp"%> 
	<div class="wrap">
		<div id="main">
			<div id="content_img">
				<div id="slide">
				<img alt="main1" src="/resources/img/main1.png" width="1900" height="600">
				<!-- <img alt="main2" src="./imgs/menu2.png" width="1730" height="601">
				<img alt="main3" src="./imgs/menu3.png" width="1730" height="601">
				
				<a class="prev" onclick="prevSilde()">&#10094;</a>
				<a class="next" onclick="nextSlide()">&#10095;</a>
				 -->
				</div>
			</div>
		</div>
		<br>
		<br>
		<div class="flex-container">
			<div class="flex-item">
			<a href="/board/infomation"><img alt="menu1" src="/resources/img/menu1.png" width="515" height="300"></a>
			</div>
			<div class="flex-item">
			<a href="/board/list?type=1"><img alt="menu2" src="/resources/img/menu2.png" width="515" height="300"></a>
			</div>
			<div class="flex-item">
			<a href="/board/gil"><img alt="menu3" src="/resources/img/menu3.png" width="515" height="300"></a>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>