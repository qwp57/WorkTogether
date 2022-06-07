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
/* LIST */
.lists {
	display: inline-block;
	width: 100%;
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

.colors {
	background-color: #989c96; -
	-text: white;
	margin: 20px;
	padding: 20px;
	width: 60px;
	height: 60px;
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

.card .card__title {
	justify-content: center;
}

#totalProjectEditBar {
	z-index: 5000;
	width: 100%;
	position: fixed;
	text-align: center;
	width: 100%;
	height: 100px;
}

#totalEditButton li {
	display: inline-block; padding-left 50px;
	padding-right: 50px;
	margin-left: 50px;
	margin-right: 50px;
}

#totalEditSelect {
	display: block;
	position: relative;
	left: 50%;
	top: 150%;
	width: 300px;
	height: 50px;
	line-height: 40px;
	border: 5px solid #6777ef;
	border-radius: 25px;
	font-family: 'Nanum Gothic', sans-serif;
	color: #6777ef;
}
.select-clear{
	color: red;
}
#tagTable tr {
	height: 50px;
}
.listViewTable{
	text-align: center;
	font-size: large;
}
.listViewTable tr:hover{
	border-radius: 20px;
	background-color:white;
	transform: scale(1.01);
}
.listViewTable tr{
	border-radius: 20px;
}
.favoYellow{
 	color: #f3da35;
}
.favoWhite{
	color: #white;
}

#editBarClose, .select-clear, .card, .listViewTable tr, .fa-cog, .fa-th-list, .fa-th-large{
	cursor:pointer
}
</style>
<body>
	<div id="totalProjectEditBar" style="display: none;" >
		<nav id="test" class="navbar bg-primary"
			style="display: block; height: 100px; text-align: center;">
			<br> <i class='fa fa-paint-brush fa-lg' style='color: white'></i>
			<a class="navbar-brand" href="#" id="color">색상 설정</a> <i
				class='fa fa-tags fa-lg' style='color: white'></i> <a
				class="navbar-brand" href="#" id="tag">프로젝트 태그 설정</a>
			<a id="editBarClose"><i class='fa fa-window-close fa-2x' style='color: white'></i></a>
			<div style="height: 80px;"></div>

		</nav>
		<div id="totalEditSelect" align="center">
			<span class="select-count">0개 프로젝트가 선택되었습니다.</span> <em
				class="select-clear">선택취소</em>
		</div>
	</div>

	<div class="main-content largeView">
		<div style="height: 50px"></div>

		<button class="btn btn-secondary" id="newPj">+ 새 프로젝트</button>

		<br> <br> <br>
		<div style="width: 100%;">

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
					<i class='fa fa-th-large fa-2x' style="color:black"></i>
				</div>
			</div>
		</div>
		<div class="container">
			<div style="height: 30px"></div>
			<h3>즐겨찾기</h3>
			<div class="cards">
			
				<c:forEach var="index" begin="1" end="5">
					<div class="card card-${index }">
					<div class="card__icon">
						<i class='fa fa-star fa-2x favoYellow'></i>
					</div>
					<div class="card__check" style="display: none;">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" id="card${index }">
							<label class="custom-control-label" for="card${index }"></label>
						</div>
					</div>
					<h2 class="card__title">테스트</h2>
					<p class="card__count">
						<a class="card__link"></a><i class='fa fa-user'
							style='color: white'>&nbsp;7</i>
					</p>
					<p class="card__date">
						<a class="card__link"><i class='fa fa-flag'
							style='color: white'></i>&nbsp;2022-06-02</a>
					</p>
				</div>
				</c:forEach>

			<div style="width:100%; height: 30px"></div>
			<h3>참여중</h3>
				<div style="width:100%; height: 30px"></div>
			<div class="cards">
				<c:forEach var="index" begin="6" end="12">
				<div class="card">
					<div class="card__icon">
						<i class='fa fa-star fa-2x favoWhite'></i>
					</div>
						<div class="card__check" style="display: none;">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" id="card${index }">
							<label class="custom-control-label" for="card${index }"></label>
						</div>
					</div>
					<h3 class="card__title">테스트</h3>
					<p class="card__count">
						<a class="card__link"><i class='fa fa-user'
							style='color: white'></i>&nbsp;7</a>
					</p>
					<p class="card__date">
						<a class="card__link"><i class='fa fa-flag'
							style='color: white'></i>&nbsp;2022-06-02</a>
					</p>
				</div>
				</c:forEach>
			
			
			</div>

		</div>
	</div>
</div>


		<div class="main-content listView">
		<div style="height: 50px"></div>
		<button class="btn btn-secondary" id="newPj">+ 새 프로젝트</button>

		<br> <br> <br>
		<div style="width: 100%;">

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
			<div class="lists">
				<table class="listViewTable">
					<c:forEach var="index" begin="1" end="5">
						<tr style="width: 100%">
							<td>
							<div class="custom-control custom-checkbox" style="display: none;">
								<input type="checkbox" class="custom-control-input" id="list${index }">
								<label class="custom-control-label" for="list${index }"></label>
							</div>
						</td>
							<td><div class="colors lists card-${index }"></div></td>
							<td style="width: 10%"><i class='icon fa fa-star fa-2x favoYellow'></i></td>
							<th style="width: 40%">테스트</th>
							<td style="width: 20%"><a class="card__link"><i class='fa fa-user'></i>&nbsp;7</a></td>
							<td style="width: 30%"><a class="card__link"><i class='fa fa-flag'></i>&nbsp;2022-06-02</a></td>
						</tr>
					</c:forEach>
				</table>
			<div style="width:100%; height: 30px"></div>
			<h3>참여중</h3>
				<div style="width:100%; height: 30px"></div>
				<table class="listViewTable">
				<c:forEach var="index" begin="6" end="12">
					<tr style="width: 100%">
							<td><div class="colors lists list"></div></td>
							<td style="width: 10%"><i class='icon fa fa-star fa-2x favoWhite'></i></td>
							<th style="width: 40%">테스트</th>
						<td style="width: 20%"><a class="card__link"><i class='fa fa-user'></i>&nbsp;7</a></td>
							<td style="width: 30%"><a class="card__link"><i class='fa fa-flag'></i>&nbsp;2022-06-02</a></td>
						</tr>
				</c:forEach>
			
				</table>

		</div>
	</div>
</div>

	
	
	
	
	

	<!-- 태그 모달창 -->
	<!-- data-backdrop="static" 속성은 모달창 주위의 배경을 클릭해도 창이 닫히지 않도록 한다. -->
	<!-- data-keybaord="false" 속성은 esc키를 눌러도 창이 닫히지 않게 한다. -->
	<div class="modal" id="tagModal" data-backdrop="static"
		data-keyboard="false">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content row">
				<!-- modal header : 제목 -->
				<div class="modal-header">
					<span><h3 class="modal-title text-left">프로젝트 폴더 설정</h3></span> <span><input
						type="image" data-dismiss="modal"
						src="resources/assets/img/close.png/" style="width: 20px"></span>
				</div>
				<!-- modal body : 내용 -->
				<form class="form" id="test">
					<div class="modal-body">
						<table id="tagTable"
							style="text-align: center; width: 100%; height: 100px;">
							<tr>
								<td></td>
								<th style="width: 50%">테스트</th>
								<td>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="tag1">
										<label class="custom-control-label" for="tag1"></label>
									</div>
								</td>
								<td>
									<div class="dropdown d-inline mr-2">
										<button class="btn btn-primary dropdown-toggle" type="button"
											id="dropdownMenuButton" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"></button>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">수정</a> <a
												class="dropdown-item" href="#">삭제</a>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td></td>
								<th style="width: 50%">테스트</th>
								<td>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="tag2">
										<label class="custom-control-label" for="tag2"></label>
									</div>
								</td>
								<td>
									<div class="dropdown d-inline mr-2">
										<button class="btn btn-primary dropdown-toggle" type="button"
											id="dropdownMenuButton" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"></button>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">수정</a> <a
												class="dropdown-item" href="#">삭제</a>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td></td>
								<th style="width: 50%">테스트</th>
								<td>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="tag3">
										<label class="custom-control-label" for="tag3"></label>
									</div>
								</td>
								<td>
									<div class="dropdown d-inline mr-2">
										<button class="btn btn-primary dropdown-toggle" type="button"
											id="dropdownMenuButton" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"></button>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">수정</a> <a
												class="dropdown-item" href="#">삭제</a>
										</div>
									</div>
								</td>
							</tr>
						</table>
						<br>
						<div class="col-lg-12 text-center">
							<i class='fa fa-plus fa-2x'></i>
						</div>
					</div>
					<div class="modal-footer">
						<div class="col-lg-12 text-center">
							<button type="submit" class="btn btn-primary btn-lg mb-3">저장</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- 색상 모달창 -->
	<!-- data-backdrop="static" 속성은 모달창 주위의 배경을 클릭해도 창이 닫히지 않도록 한다. -->
	<!-- data-keybaord="false" 속성은 esc키를 눌러도 창이 닫히지 않게 한다. -->
	<div class="modal" id="colorModal" data-backdrop="static"
		data-keyboard="false" style="text-align: center;">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content row">
				<!-- modal header : 제목 -->
				<div class="modal-header">
					<span><h3 class="modal-title text-left">프로젝트 색상 설정</h3></span> <span><input
						type="image" data-dismiss="modal"
						src="resources/assets/img/close.png/" style="width: 20px"></span>
				</div>
				<!-- modal body : 내용 -->
				<form class="form" id="test">
					<div class="modal-body">
						<table id="colorTable" style="text-align: center; width: 100%;">
							<tr>
								<c:forEach var="index" begin="1" end="6">
									<td><div class="colors"></div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="color${index}"> <label
												class="custom-control-label" for="color${index}"></label>
										</div></td>
								</c:forEach>
							</tr>
							<tr>
								<c:forEach var="index" begin="7" end="12">
									<td><div class="colors"></div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="color${index}"> <label
												class="custom-control-label" for="color${index}"></label>
										</div></td>
								</c:forEach>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<div class="col-lg-12 text-center">
							<button type="submit" class="btn btn-primary btn-lg mb-3">저장</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
		$(function() {
			$("#tag").click(function() {
				$("#tagModal").modal("show")
			});
			
			$("#color").click(function() {
				$("#colorModal").modal("show")
			});
			
			$(".fa-star").click(function() {
				if($(this).hasClass("favoWhite")){
					$(this).removeClass("favoWhite")
					$(this).addClass("favoYellow")
					console.log("즐겨찾기 추가할것")
				}else if($(this).hasClass("favoYellow")){
					$(this).removeClass("favoYellow")
					$(this).addClass("favoWhite")
					console.log("즐겨찾기 제거할것")
				}
			})
			
			$(".fa-cog").click(function() {
				$("#totalProjectEditBar").css("display","block")
				
			})
			$(".fa-th-list").click(function() {
				console.log("ㅋㅋ")
				$(".largeView").css("display","none")
				$(".listView").css("display","block")
				$(".fa-th-list").css("color", "black")
				$(".fa-th-large").css("color","")
			
			})
			
			$(".fa-th-large").click(function() {
				console.log("bb")
			
				$(".listView").css("display","none")
				$(".largeView").css("display","block")
				$(".fa-th-large").css("color", "black")
				$(".fa-th-list").css("color","")
			
			})
			
			$("#editBarClose").click(function() {
				$("#totalProjectEditBar").css("display","none")
			})
		});
		
			
	</script>



</body>
</html>