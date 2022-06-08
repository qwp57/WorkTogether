<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	color: black;
}

#newPj {
	width: 180px;
	height: 70px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 700;
	font-size: x-large;
	border-radius: 20px;
	font-family: 'Nanum Gothic', sans-serif;
}

.favoYellow {
	color: #f3da35;
}

.favoWhite {
	color: #white;
}

.colors {
	-text: white;
	margin: 20px;
	padding: 20px;
	width: 70px;
	height: 70px;
	border-radius: 10px;
	box-shadow: 0 0 2rem -1rem rgba(0, 0, 0, .05);
	transition: all 0.2s;
	color: #ffffff;
	-text: white;
	grid-row: 1/2;
	gird-column: 1/3;
}

.color-1 {
	background: #3C3B3D;
}

.color-2 {
	background: #EC87C0;
}

.color-3 {
	background: #5D9CEC;
}

.color-4 {
	background: #8a40f2;
}

.color-5 {
	background: #82B553;
}

.color-6 {
	background: #f05650;
}

.color-7 {
	background: #917B56;
}

.color-8 {
	background: gray;
}

.detailTop {
	display: grid;
	grid-template-columns: 100px 40px 40px 1.5fr 120px;
	grid-template-rows: 50px 50px 60px;
}

.fa-star {
	grid-row: 1/2;
	grid-column: 2/3;
}

#topMenu {
	grid-row: 1/2;
	grid-column: 3/4;
}

.card-body {
	padding-bottom: 0px !important;
}

#pjDetail {
	gird-row: 2/3;
	grid-column: 2/5;
	font-family: 'Nanum Gothic', sans-serif;
	margin-top: 17px;
}

#pjTitle {
	grid-column: 4/5;
	grid-row: 1/2;
}

.btn-secondary {
	width: 120px;
	border-radius: 25px;
	grid-row: 1/3;
	grid-column: 5/6;
	height: 50px;
	line-height: 40px;
}

.btn-secondary, .fa-star, #topMenu, #pjTitle {
	margin-top: 25px;
}

#navMenus {
	grid-row: 3/4;
	grid-column: 1/6;
}

.navMenu {
	padding-top: 28px;
	width: 80px;
	position: relative;
	display: inline-block;
	text-decoration: none;
	color: black;
	text-align: center;
	padding-bottom: 10px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
	width: 80px;
}

.navMenu:after {
	text-align: center;
	content: "";
	position: absolute;
	bottom: -2px;
	left: 25%;
	width: 50%;
	height: 8px;
	border-radius: 50px;
	transform: scaleX(0);
	background-color: rgb(0, 0, 0);
	transition: transform .3s;
}

.calendar:after, .drive:after {
	text-align: center;
	content: "";
	position: absolute;
	bottom: -2px;
	left: 15%;
	width: 70%;
	height: 8px;
	border-radius: 50px;
	transform: scaleX(0);
	background-color: rgb(0, 0, 0);
	transition: transform .2s;
}

.clicked:after {
	transform: scaleX(1);
}

.navMenu:hover:after {
	transform: scaleX(1);
}

.body-1 {
	height: 250px;
}
.body-2{
	height: 220px;
}
.body-3{
	height: 50px;
}

.card {
	border-radius: 25px !important;
}

.chart {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	grid-template-rows: 100px 100px;
}

.taskChart {
	grid-row: 1/3;
	grid-column: 1/2;
	width: 50%;
	margin-left: 30px;
	
}
.chartDeatil{
	text-align: center;
	margin-top: 13%;
}

</style>
</head>
<body>
	<div class="main-content text-center">
		<div style="height: 50px;"></div>

		<div class="container text-left">

			<section class="section">
				<div class="section-body">

					<div class="row mt-sm-4">

						<div class="col-12 col-md-12 col-lg-12">
							<div class="card">
								<div class="card-body body-1">
									<div>
										<button class="btn btn-primary" id="newPj">+ 새 프로젝트</button>
									</div>
									<div class="detailTop">
										<div class="colors color-1"></div>
										<i class='icon fa fa-star fa-2x favoYellow'></i>
										<div class="btn-group dropright" id="topMenu">
											<i class='fa fa-ellipsis-v fa-2x' data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false"
												style="width: 30px;"></i>
											<div class="dropdown-menu dropright">
												<a class="dropdown-item" href="#" id="tagEdit">수정</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#">삭제</a>
											</div>
										</div>
										<p id="pjDetail">프로젝트 설명 프로젝트 설명</p>
										<h5 id="pjTitle">프로젝트 제목</h5>
										<a href="#" class="btn btn-icon icon-left btn-secondary"><i
											class="far fa-user"></i> +초대하기</a>
										<div id="navMenus">
											<a class="navMenu home clicked">홈</a> <a
												class="navMenu calendar">캘린더</a> <a class="navMenu drive">드라이브</a>
										</div>
									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="section-body">
					<div class="row mt-sm-4">
						<div class="col-12 col-md-10 col-lg-12">
							<div class="card h-100">
								<div class="card-body  body-2">
									<h4 class="text-left d-inline">업무 리포트</h4>
									<h4 class="d-inline" style="color: gray">12</h4>
									<div class="chart">
										<div class="taskChart">
											<canvas id="taskChart"></canvas>
										</div>
											<h5 class="chartDeatil">요청 4</h5>
											<h5 class="chartDeatil">진행 4</h5>
											<h5 class="chartDeatil">완료 4</h5>
											<h5 class="chartDeatil">보류 4</h5>
										
									</div>



								</div>
							</div>
						</div>
					</div>
				</div>
					<div class="section-body">
					<div class="row mt-sm-4">
						<div class="col-12 col-md-10 col-lg-12">
							<div class="card h-100">
								<div class="card-body body-3">


								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>

	<script>
		$(function() {

			$(".home").addClass("clicked")

			$(".fa-star").click(function(e) {
				if ($(this).hasClass("favoWhite")) {
					$(this).removeClass("favoWhite")
					$(this).addClass("favoYellow")
					console.log("즐겨찾기 추가할것")
				} else if ($(this).hasClass("favoYellow")) {
					$(this).removeClass("favoYellow")
					$(this).addClass("favoWhite")
					console.log("즐겨찾기 제거할것")
				}
				e.stopPropagation()
			})

		})
	</script>
	<script type="text/javascript">
		var sum = Number("{{sum}}");

		// Pie Chart Example
		var ctx = document.getElementById("taskChart");
		var myPieChart = new Chart(ctx, {
			type : 'doughnut',
			data : {
				labels : [ "요청", "진행", "완료", "보류" ],
				datasets : [ {
					data : [ sum, 50, 20 ],
					backgroundColor : [ '#4e73df', '#1cc88a', '#36b9cc' ],
					hoverBackgroundColor : [ '#2e59d9', '#17a673', '#2c9faf' ],
					hoverBorderColor : "rgba(234, 236, 244, 1)",
				} ],
			},
			options : {
				maintainAspectRatio : false,
				tooltips : {
					backgroundColor : "rgb(255,255,255)",
					bodyFontColor : "#858796",
					borderColor : '#dddfeb',
					borderWidth : 1,
					xPadding : 15,
					yPadding : 15,
					displayColors : false,
					caretPadding : 10,
				},
				legend : {
					display : false
				},
				cutoutPercentage : 80,
			},
		});
	</script>
</body>
</body>
</html>