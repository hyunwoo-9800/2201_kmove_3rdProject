<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("reset.css");

.wrap {
	margin: 0 auto;
	width: 1500px;
}

header {
	width: 100%;
	height: 110px;
	padding: 15px 0px 0px 0px;
	box-sizing: border-box;

	
} /*패딩포함높이가 변하지 않도록 boxsizing*/
.logo {
	float: left;
	margin-bottom: 12px;
	padding: 5px 0;
}

.top-menu {
	float: right;
	width: 290px;
	height: 10px;
	top: 50px;
}

.top-menu a {
	text-decoration: none;
}

.top-menu img {
	top: 15px;
	right: 230px;
}

nav {
	/* float: right; */
	/* 	position:absolute; */
	position: relative;
	left: 1060px;
	top: -90px;
	text-decoration: none;
}

nav li {
	display: inline;
	/* margin-left: 30px; */
}

.dropmenu {
	width: 780px;
	display: inline;
	overflow: hidden;
	position: absolute;
	top: 1px;
	float: right;
	font-size: 16px;
	left: -180px;
	padding: 0px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

.dropmenu>li {
	width: 20%; /*20*5=100%*/
	float: left;
	text-align: center;
	line-height: 40px;
	background-color: #ffffff;
	margin-left: auto;
	margin-right: auto;
}

.dropmenu a {
	color: #000000;
	text-decoration: none;
	
}

.dropmenu a:hover {
	color: #ffffff; 
}

.submenu li {
	line-height: 50px;
	margin-left: auto;
	margin-right: auto;
	/* color: #ffffff; */
}

.submenu {
	height: 0; /*ul의 높이를 안보이게 처리*/
	overflow: hidden;
	margin-left: auto;
	margin-right: auto;
	padding:0px;
}

.submenu a {
	/* text-align: center; */
	color: #000000;
	margin-left: auto;
	margin-right: auto;
}

.submenu a:hover {
	color: #000000;
}

.dropmenu>li:hover {
	background-color: #33576d;
	transition-duration: 0.5s;
}

.dropmenu>li:hover .submenu {
	height: 250px; /*서브메뉴 li한개의 높이 50*5*/
	background-color: #ffffff;
	transition-duration: 1s;
	text-align: center; 
	
ul { list-style : none;
	
}

li {
	float: left;
	
}
</style>
</head>
<body>

	<div class="wrap">
		<header>

			<!-- 비로그인 -->
			<div class="top-menu">
				<sec:authorize access="isAnonymous()">
					<a href="/customLogin"> <img alt="enter"
						src="/resources/img/enter.png" width="14"></a>
					<a href="/customLogin">ログイン</a> &nbsp; &nbsp; <img alt="join"
						src="/resources/img/join.png" width="14">
					<a href="/member/touroku">会員登録</a>
				</sec:authorize>

				<!-- 로그인 -->

				<sec:authorize access="hasRole('ROLE_USER')">
					<sec:authentication property="principal.member.namae" />様 &nbsp; &nbsp;
   			<a href="/customLogout"><img alt="enter"
						src="/resources/img/enter.png" width="14">ログアウト</a>
				</sec:authorize>


				<!-- 관리자 -->

				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<sec:authentication property="principal.member.namae" />様
		 	&nbsp; &nbsp;
		 	<a href="/admin/admin_page" sec:authorize="hasRole='ROLE_ADMIN"><img alt="gear"
						src="/resources/img/gear.png" width="14">管理者</a>
		 	&nbsp; &nbsp;
   			<a href="/customLogout"><img alt="enter"
						src="/resources/img/enter.png" width="14">ログアウト</a>
			&nbsp; &nbsp;
		</sec:authorize>
			</div>

			<a href="/board/mainHome"><img alt="Logo"
				src="/resources/img/logo.png" width="400"></a> <br> <br>
			<nav>
				<ul class="dropmenu">
					<!-- 교회안내 -->
					<li><a href="#">教会案内</a>
						<ul class="submenu">
							<li><a href="/board/infomation">挨拶の言葉</a></li>
							<br>
							<li><a href="/board/gil">お越しの道</a></li>
						</ul></li>
					<!-- 예배-->
					<li><a href="#">礼拝</a>
						<ul class="submenu">
							<li><a href="/board/list?type=1">主の日説教</a></li>
							<br>
							<li><a href="/board/list?type=2">水曜礼拝</a></li>
							<br>
							<li><a href="/board/list?type=3">金曜祈禱会</a></li>
						</ul></li>
					<!-- 나눔터 -->
					<li><a href="#">教徒</a>
						<ul class="submenu">
							<li><a href="/board/list?type=4">お知らせ</a></li>
							<br>
							<li><a href="/board/list?type=5">校友お知らせ</a></li>
						</ul></li>
					<!-- 다음세대 -->
					<li><a href="#">次の世代</a>
						<ul class="submenu">
							<li><a href="/board/list?type=6">教会学校</a></li>
							<br>
							<li><a href="/board/schoolinfo">教会学校紹介</a></li>
							<br>
							<li><a href="/board/list?type=7">青年部</a></li>
							<br>
							<li><a href="/board/seinenbu">青年部紹介</a></li>
						</ul></li>
				</ul>
			</nav>

		</header>


	</div>

</body>
</html>