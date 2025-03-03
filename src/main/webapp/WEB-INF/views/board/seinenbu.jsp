<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@include file="../includes/menu.jsp"%>
<head>
<title>栄光長老教会</title>
<style>
@import url("reset.css");

* {
	box-sizing: border-box;
}

.menu_title {
	margin: 0px;
	font-size: 35px;
	text-align: center;
	font-weight: 500;
	letter-spacing: -2px;
	line-height: 1.5 !important;
}

.submenu_title {
	font-size: 18px;
	color: #666;
	text-align: center;
	font-weight: 500;
	margin: 0 0 30px;
	letter-spacing: -1px;
	display: block;
	line-height: 24px;
	"
}

.container {
	margin: 0 auto;
	width: 100%;
	background-color: #efefef;
	height: 1030px;
	box-sizing: border-box;
	display: flex;
	justify-content: center;
}

.submain-wrapper {
	margin: 0px;
	width: 1355px;
	background-color: #ffffff;
	min-height: 760px;
	display: flex;
	justify-content: center;
}

._core_content_wrapper_ {
	font-size: 20px;
	letter-spacing: -0.8px;
	padding: 40px 40px;
	/* display: flex;
	justify-content: center; */
}

.flex-container {
	display: flex;
	height: 300px;
	width: 790px;
	justify-content: center;
}

.flex-item {
	flex: 0;
	margin: 0;
}

.flex-item-right {
	margin-left: auto;
}

.content-wrap {
	font-size: 30px;
	font-family: 'Noto Serif KR', serif;
	text-align: center;
	/* argin-bottom: 100px; */
}

table, th, td {
	border: 0.1px solid black;
	width: 1350px;
}

h3 {
	margin: 0;
}

.photo-basic {
	display: flex;
	justify-content: center;
}

.shoukai{
	padding: 0px 0px 10px 0px;
}
</style>



<style> /*폰트 */
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Serif+KR:wght@200&display=swap')
	;
</style>

<style>/* 소개 메뉴 */
.category body_wrapper_ {
	position: relative;
}

.category {
	display: inline-flex;
	border-bottom: 2px solid #009e79;
	height: 40px;
	width: 100%;
	margin-bottom: 40px;
	list-style: none;
	margin: 0;
	padding: 0;
}

.category li {
	background: #009e79;
	float: left;
	margin-right: 10px;
	padding: 5px 20px;
	color: #fff;
	border: 2px solid #009e79;
	font-size: 16px;
	cursor: pointer;
	line-height: 26px;
}

.category .tab_off {
	
}

.category .tab_on {
	border-bottom: 2px solid #fff;
	background: #fff;
	color: #009e79;
	font-weight: 600;
}

@media ( max-width :768px) {
	.category li {
		margin-right: 5px;
		padding: 5px 10px;
		font-size: 14px;
	}
}
</style>


</head>
<body>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<br>
				<div class="menu_title">青年部

</div>

				<!-- 교회소개-->
				<span class="submenu_title">またあなたがたが 心の 靈において 新しくされ,<br>眞理に
					基づく 義と 聖をもって 神にかたどり 造り 出された,<br>新しい 人を 身に
					着るべきことでした．(エペソ人への手紙4章 23~24節)
				</span>

				<div class="title-bar"></div>

				<div style="clear: both;"></div>

				<div class="submain-wrapper" style="">

					<div class="submain-wrapper">

						<div id="_core_content_wrapper_">
							<ul class="category">
								<li class="tab_on" onclick="location.href='/board/seinenbu'">教会学校紹介
								</li>
								<li class="tab_off" onclick="location.href='/board/list?type=7'">教会学校掲示板
								</li>
							</ul>


							<div class="content-wrap">

								<br> <br>
								<h3>
									変わらない信念
								<br> <br>

								</h3>
								<div class="photo-basic">

									<div class="flex-container">
										<div class="flex-item">
											<a href="/board/infomation"><img alt="menu1"
												src="/resources/img/seinen1.jpg" width="433" height="300"></a>
										</div>
										<div class="flex-item">
											<a href="/board/list?type=1"><img alt="menu2"
												src="/resources/img/seinen2.jpg" width="433" height="300"></a>
										</div>
										<div class="flex-item">
											<a href="/board/gil"><img alt="menu3"
												src="/resources/img/seinen3.jpg" width="433" height="300"></a>
										</div>
									</div>

								</div>
								
								<div class="shoukai">	
								<h4 align="left">部署紹介</h4>
								<table class="basic-table"
									style="font-family: fantasy; font-size: 16px">
									<colgroup>
										<col style="width: 20%">
										<col style="">
									</colgroup>
									<tr>
										<th>標語</th>
										<td>変わらない信念</td>
									</tr>
									<tr>
										<th>聖句</th>
										<td>神よ、私の心が確定され揺るぎませんので私が歌い、賛美します。</td>
									</tr>
								</table>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>