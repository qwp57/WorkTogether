<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/sidebar.jsp" />

<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji",
		"Segoe UI Symbol";
}

/* CARDS */
.cards {
	display: flex;
	flex-wrap: wrap;
	justify-content: start;
}

.card {
	background-color: #989c96; -
	-text: white;
	margin: 20px;
	padding: 20px;
	padding-top: 0px;
	width: 300px;
	height: 200px;
	min-height: 200px;
	display: grid;
	grid-template-rows: 20px 50px 1fr 50px;
	border-radius: 10px;
	box-shadow: 0 0 2rem -1rem rgba(0, 0, 0, .05);
	transition: all 0.2s;
	color: #ffffff;
	-text: white;
}

.card:hover {
	box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.4);
	transform: scale(1.01);
}

.card__link, .card__check, .card__icon, card__date1 {
	position: relative;
	text-decoration: none;
	color: rgba(255, 255, 255, 0.9);
}

.card__check {
	grid-row: 2/3;
	justify-self: end;
}

.card__icon {
	grid-row: 2/3;
	
}

.card__title {
	grid-row: 3/4;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 700;
	color: #ffffff;
}

.card__count {
	grid-row: 4/5;
	align-self: center;
}
.card__date {
	grid-row: 4/5;
	justify-self: end
}

/* CARD BACKGROUNDS */
.card-1 {
	background: #3C3B3D;
}

.card-2 {
	background: #EC87C0;
}

.card-3 {
	background: #5D9CEC;
}

.card-4 {
	background: #6b10ec;
}

.card-5 {
	background: #76cf0e;
}

/* RESPONSIVE */
@media ( max-width : 1600px) {
	.cards {
		justify-content: center;
	}
}

/* .card__link::after {
        position: absolute;
        top: 25px;
        left: 0;
        content: "";
        width: 0%;
        height: 3px;
        background-color: rgba(255, 255, 255, 0.6);
        transition: all 0.5s;
    }
    .card__link:hover::after {
        width: 100%;
    }*/
#newPj {
	width: 180px;
	height: 70px;
	color: black;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 700;
	font-size: x-large;
	border-radius: 20px;
	font-family: 'Nanum Gothic', sans-serif;
}

.topmenu {
	display: inline-block;
	width: 49%;
	height: 100%;
}

.menuIcon {
	float: right;
	margin-left: 5%;
}

.menuIcon .fa:hover {
	color: black;
}
.card .card__title{
	justify-content: center;
	}
#totalProjectEditBar{
	z-index: 5;
	width: 100%;
	position: fixed;
	text-align: center;
}
#totalEditButton li{
	display:inline-block;
	padding-left 50px;
	padding-right: 50px;
	margin-left: 50px;
	margin-right: 50px;
}
	
</style>
<body>
	<div id="totalProjectEditBar">
	<nav class="navbar bg-primary" style="display: block;" >
         <a class="navbar-brand" href="#">색상 설정</a>
       	 <a class="navbar-brand" href="#">프로젝트 태그 설정</a>
        
	    <a href="https://flow.team/main.act#" id="editBarCloseButton" class="main-container-close-button-1"></a>
	    <div id="totalEditSelect" class="menu-text-popup-1">
            <span class="select-count">0개 프로젝트가 선택되었습니다.</span>
            <em class="select-clear">선택취소</em>
        </div>
	</nav>
	</div>
	<div class="main-content">
		<div style="height: 50px"></div>
	
	
		<button class="btn btn-secondary" id="newPj">+ 새 프로젝트</button>

		<br> <br> <br>
		<div style="width:100%;">
		
		
		
	
	
			<div class="topmenu">
				<h2>내 프로젝트</h2>
			</div>
			<div class="topmenu" style="text-align: right;">
				<div class="menuIcon">
					<i class='fa fa-cog fa-2x'></i>
				</div>
				<div class="menuIcon">
					<i class='fa fa-th-list fa-2x'></i>
				</div>
				<div class="menuIcon">
					<i class='fa fa-th-large fa-2x'></i>
				</div>
			</div>
		</div>
		<div class="container">
			<div style="height: 30px"></div>
			<h3>즐겨찾기</h3>
			<div class="cards">
				<div class="card card-1">
					<div class="card__icon">
						<i class='fa fa-star' style='color: #f3da35'></i>
					</div>
					<p class="card__check">
						<i class='fa fa-check-circle fa-lg' style='color: silver;' hidden></i>
					</p>
					<h2 class="card__title">테스트</h2>
					<p class="card__count">
						<a class="card__link"></a><i class='fa fa-user'
							style='color: white'>&nbsp;7</i> 
					</p>
					<p class="card__date">
					<a class="card__link"><i class='fa fa-flag'	style='color: white'></i>&nbsp;2022-06-02</a>
					</p>
				</div>

				<div class="card card-2">
					<div class="card__icon">
						<i class='fa fa-star' style='color: white'></i>
					</div>
					<p class="card__check">
						<i class='fa fa-check-circle fa-lg' style='color: silver;'></i>
					</p>
					<h3 class="card__title">테스트2</h3>
				<p class="card__count">
						<a class="card__link"></a><i class='fa fa-user'
							style='color: white'>&nbsp;7</i> 
					</p>
					<p class="card__date">
					<a class="card__link"><i class='fa fa-flag'	style='color: white'></i>&nbsp;2022-06-02</a>
					</p>
				</div>

				<div class="card card-3">
					<div class="card__icon">
						<i class='fa fa-star' style='color: white'></i>
					</div>
					<p class="card__check">
						<i class='fa fa-check-circle fa-lg' style='color: silver;'></i>
					</p>
					<h3 class="card__title">테스트3</h3>
				<p class="card__count">
						<a class="card__link"></a><i class='fa fa-user'
							style='color: white'>&nbsp;7</i> 
					</p>
					<p class="card__date">
					<a class="card__link"><i class='fa fa-flag'	style='color: white'></i>&nbsp;2022-06-02</a>
					</p>
				</div>
				<div class="card card-4">
					<div class="card__icon">
						<i class='fa fa-star' style='color: white'></i>
					</div>
					<p class="card__check">
						<i class='fa fa-check-circle fa-lg' style='color: silver;'></i>
					</p>
					<h3 class="card__title">테스트4</h3>
				<p class="card__count">
						<a class="card__link"></a><i class='fa fa-user'
							style='color: white'>&nbsp;7</i> 
					</p>
					<p class="card__date">
					<a class="card__link"><i class='fa fa-flag'	style='color: white'></i>&nbsp;2022-06-02</a>
					</p>
				</div>
				<div class="card card-5">
					<div class="card__icon">
						<i class='fa fa-star' style='color: white'></i>
					</div>
					<p class="card__check">
						<i class='fa fa-check-circle fa-lg' style='color: silver;'></i>
					</p>
					<h3 class="card__title">줄바꿈되면 어떻게되는지</h3>
					<p class="card__count">
						<a class="card__link"></a><i class='fa fa-user'
							style='color: white'>&nbsp;7</i> 
					</p>
					<p class="card__date">
					<a class="card__link"><i class='fa fa-flag'	style='color: white'></i>&nbsp;2022-06-02</a>
					</p>
				</div>
			</div>
			<div style="height: 30px"></div>
			<h3>참여중</h3>
			<div class="cards">
				<div class="card">
					<div class="card__icon">
						<i class='fa fa-star' style='color: white'></i>
					</div>
					<p class="card__check">
						<i class='fa fa-check-circle fa-lg' style='color: silver;'></i>
					</p>
					<h3 class="card__title">테스트</h3>
				<p class="card__count">
						<a class="card__link"></a><i class='fa fa-user'
							style='color: white'>&nbsp;7</i> 
					</p>
					<p class="card__date">
					<a class="card__link"><i class='fa fa-flag'	style='color: white'></i>&nbsp;2022-06-02</a>
					</p>
				</div>
				<div class="card card-2">
					<div class="card__icon">
						<i class='fa fa-star' style='color: white'></i>
					</div>
					<p class="card__check">
						<i class='fa fa-check-circle fa-lg' style='color: silver;'></i>
					</p>
					<h3 class="card__title">테스트2</h3>
					<p class="card__count">
						<a class="card__link"></a><i class='fa fa-user'
							style='color: white'>&nbsp;7</i> 
					</p>
					<p class="card__date">
					<a class="card__link"><i class='fa fa-flag'	style='color: white'></i>&nbsp;2022-06-02</a>
					</p>
				</div>
				<div class="card card-3">
					<div class="card__icon">
						<i class='fa fa-star' style='color: white'></i>
					</div>
					<p class="card__check">
						<i class='fa fa-check-circle fa-lg' style='color: silver;'></i>
					</p>
					<h3 class="card__title">줄바꿈 3줄 넘어가면 박스 크기 벗어남</h3>
				<p class="card__count">
						<a class="card__link"></a><i class='fa fa-user'
							style='color: white'>&nbsp;7</i> 
					</p>
					<p class="card__date">
					<a class="card__link"><i class='fa fa-flag'	style='color: white'></i>&nbsp;2022-06-02</a>
					</p>
				</div>
			</div>
			
		</div>
	</div>
	
	
			
			
			
			
</body>
</html>