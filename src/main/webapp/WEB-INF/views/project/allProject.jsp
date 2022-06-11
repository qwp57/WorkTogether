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
	<script src="https://kit.fontawesome.com/f2449ad7e5.js" crossorigin="anonymous"></script>
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

	/* projects */
	.projects {
		display: flex;
		flex-wrap: wrap;
		justify-content: start;
	}

	.project {
		background-color: gray; -
	-text: white;
		margin: 20px;
		padding: 20px;
		padding-top: 0px;
		width: 323px;
		height: 200px;
		min-height: 150px;
		display: grid;
		grid-template-rows: 20px 50px 1fr 50px;
		border-radius: 25px;
		box-shadow: 0 0 2rem -1rem rgba(0, 0, 0, .05);
		transition: all 0.2s;
		color: #ffffff;
		-text: white;
	}

	.colors {
		-text: white;
		margin: 20px;
		padding: 20px;
		margin-left: 40px;
		width: 70px;
		height: 70px;
		border-radius: 10px;
		box-shadow: 0 0 2rem -1rem rgba(0, 0, 0, .05);
		transition: all 0.2s;
		color: #ffffff;
		-text: white;
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

	.project:hover {
		box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.4);
		transform: scale(1.03);
	}

	.project__check, .project__icon, .project__count {
		position: relative;
		text-decoration: none;
		color: rgba(255, 255, 255, 0.9);
	}

	.project__check {
		grid-row: 2/4;
		grid-column: 4/5;
		justify-self: end;
	}

	.project__icon {
		grid-row: 2/3;
	}

	.project__title {
		grid-row: 3/4;
		grid-column: 1 / 4;
		font-family: 'Nanum Gothic', sans-serif;
		font-weight: 700;
		color: #ffffff;
	}

	.project__count {
		grid-row: 4/5;
	}

	.project__date {
		grid-row: 4/5;
		grid-column: 4/4;
		justify-self: end;
	}

	/* RESPONSIVE */
	@media ( max-width : 1600px) {
		.projects {
			justify-content: center;
		}
	}

	/* .project__link::after {
            position: absolute;
            top: 25px;
            left: 0;
            content: "";
            width: 0%;
            height: 3px;
            background-color: rgba(255, 255, 255, 0.6);
            transition: all 0.5s;
        }
        .project__link:hover::after {
            width: 100%;
        }*/
        
	.newPj {
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

	.project .project__title {
		justify-content: center;
	}
	.custom-radio{
		position: relative;
		left: 30px;
		bottom: 20px;
	}
	#totalProjectEditBar {
		z-index: 1000;
		width: 100%;
		position: fixed;
		text-align: center;
		width: 100%;
		height: 100px;
	}

	#totalEditButton li {
		display: inline-block; padding-left: 50px;
		padding-right: 50px;
		margin-left: 50px;
		margin-right: 50px;
	}

	#totalEditSelect {
		display: block;
		position: relative;
		left: 50%;
		top: 130%;
		width: 300px;
		height: 50px;
		line-height: 40px;
		border: 3px solid #6777ef;
		border-radius: 25px;
		font-family: 'Nanum Gothic', sans-serif;
		color: #6777ef;
	}

	.select-clear {
		color: red;
	}
	#tagTable{
		text-align: center;
		width: 100%;
		height: 100px;
		font-size: large;
	}

	.listViewTable {
		text-align: center;
		font-size: large;
		border-collapse: separate;
		border-spacing: 0px;
	}

	.listViewTable tr:hover, #tagTable tr:hover {
		background-color: white;
		transform: scale(1.01);
	}


	td {
		padding: 10px;
	}
	td:first-child {
		border-left-style: none;
		border-top-left-radius: 25px;
		border-bottom-left-radius: 25px;
	}
	td:last-child {
		border-right-style: none;
		border-bottom-right-radius: 25px;
		border-top-right-radius: 25px;
	}




	#tagTable tr:hover, .fa-plus:hover{
		color: #6777ef;
	}
	#colorTable{
		text-align: center;
		margin-left: 2%;
		width: 100%;
	}
	.custom-radio{
		margin-right: 27px;
	}

	.favoYellow {
		color: #f3da35;
	}

	.favoWhite {
		color: lightgray;
	}

	#editBarClose, .select-clear, .project, .listViewTable tr, .fa-cog,
	.fa-th-list, .fa-th-large, .fa-ellipsis-v , .fa-plus{
		cursor: pointer
	}
	.modal-content{
		z-index: 1001;
	}
</style>
<body>
<div id="totalProjectEditBar" style="display: none;">
	<nav id="test" class="navbar bg-primary"
		 style="display: block; height: 100px; text-align: center;">
		<br> <i class='fa fa-paint-brush fa-lg' style='color: white;'></i>
		<a class="navbar-brand" href="#" id="color">색상 설정</a> <i
			class='fa fa-tags fa-lg' style='color: white;'></i> <a
			class="navbar-brand" href="#" id="tag">프로젝트 태그 설정</a> <a
			id="editBarClose"><i class='fa fa-window-close fa-2x'
								 style='color: white;'></i></a>
		<div style="height: 80px;"></div>

	</nav>
	<div id="totalEditSelect" align="center">
		<span class="select-count">0개 프로젝트가 선택되었습니다.</span> <em
			class="select-clear">선택취소</em>
	</div>
</div>



<div class="main-content largeView">
	<div style="height: 50px;"></div>


	<div class="container">
		<button class="btn btn-secondary newPj">+ 새 프로젝트</button>
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
					<i class='fa fa-th-large fa-2x' style="color: black;"></i>
				</div>
			</div>
		</div>
		<div style="height: 30px;"></div>
		<h3>즐겨찾기</h3>
		<div class="projects">

			<c:forEach var="index" begin="1" end="8">
				<div class="project color-${index }">
					<div class="project__icon">
						<i class='fa fa-star fa-2x favoYellow'></i>
					</div>
					<div class="project__check pjCheck" style="display: none;">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input pjCheckAll"
								   id="ckedFavo${index }"> <label class="custom-control-label"
																  for="ckedFavo${index }"></label>
						</div>
					</div>
					<h3 class="project__title">테스트</h3>
					<p class="project__count">
						<i class='fa fa-user'
						   style='color: white;'>&nbsp;7</i>
					</p>
					<p class="project__date">
						<i class='fa fa-flag'
						   style='color: white;'>&nbsp;2022-06-02</i>
					</p>
				</div>
			</c:forEach>

			<div style="width: 100%; height: 30px;"></div>
			<h3>참여중</h3>
			<div style="width: 100%; height: 30px;"></div>
			<div class="projects">
				<c:forEach var="index" begin="1" end="8">
					<div class="project">
						<div class="project__icon">
							<i class='fa fa-star fa-2x favoWhite'></i>
						</div>
						<div class="project__check pjCheck" style="display: none;">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input pjCheckAll"
									   id="ckedPj${index }"> <label
									class="custom-control-label" for="ckedPj${index }"></label>
							</div>
						</div>
						<h3 class="project__title">테스트</h3>
						<p class="project__count">
							<i class='fa fa-user'
							   style='color: white;'>&nbsp;7</i>
						</p>
						<p class="project__date">
							<i class='fa fa-flag'
							   style='color: white;'>&nbsp;2022-06-02</i>

						</p>
					</div>
				</c:forEach>


			</div>

		</div>
	</div>
</div>


<div class="main-content listView" style="display: none;">
	<div style="height: 50px;"></div>

	<div class="container">
		<button class="btn btn-secondary newPj">+ 새 프로젝트</button>

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
		<div style="height: 30px;"></div>
		<h3>즐겨찾기</h3>
		<div class="lists">
			<table class="listViewTable">
				<c:forEach var="index" begin="1" end="8">
					<tr style="width: 100%;">
						<td>
							<div class="custom-control custom-checkbox pjCheck"
								 style="display: none;">
								<input type="checkbox" class="custom-control-input pjCheckAll"
									   id="ckedFavo${index }"> <label
									class="custom-control-label" for="ckedFavo${index}"></label>
							</div>
						</td>
						<td><div class="colors color-${index }"></div></td>
						<td style="width: 10%;"><i
								class='icon fa fa-star fa-2x favoYellow'></i></td>
						<th style="width: 40%;">테스트</th>
						<td style="width: 20%"><i
								class='fa fa-user'></i>&nbsp;7</td>
						<td style="width: 30%;"><i
								class='fa fa-flag'></i>&nbsp;2022-06-02</td>
					</tr>
				</c:forEach>
			</table>
			<div style="width: 100%; height: 30px;"></div>
			<h3>참여중</h3>
			<div style="width: 100%; height: 30px;"></div>
			<table class="listViewTable">
				<c:forEach var="index" begin="1" end="8">
					<tr style="width: 100%">
						<td>
							<div class="custom-control custom-checkbox pjCheck"
								 style="display: none;">
								<input type="checkbox" class="custom-control-input pjCheckAll"
									   id="ckedPj${index }"> <label
									class="custom-control-label" for="ckedPj${index }"></label>
							</div>
						</td>
						<td><div class="colors color-8"></div></td>
						<td style="width: 10%;"><i
								class='icon fa fa-star fa-2x favoWhite'></i></td>
						<th style="width: 40%;">테스트</th>
						<td style="width: 20%;"><i
								class='fa fa-user'></i>&nbsp;7</td>
						<td style="width: 30%;"><i
								class='fa fa-flag'></i>&nbsp;2022-06-02</td>
					</tr>
				</c:forEach>

			</table>

		</div>
	</div>
</div>






<jsp:include page="colorTagModal.jsp" />
<jsp:include page="pjForm.jsp" />
<script>
	$(function() {
		$("#tag").click(function() {
			$("#tagModal").modal("show")
		});

		$("#color").click(function() {
			$("#colorModal").modal("show")
		});
		

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

		$(".fa-cog").click(function() {
			$("#totalProjectEditBar").css("display", "block")
			$(".pjCheck").css("display", "block")
		})

		$(".fa-window-close").click(function() {
			$(".pjCheck").css("display", "none")
		})

		$(".fa-th-list").click(function() {
			console.log("ㅋㅋ")
			$(".largeView").css("display", "none")
			$(".listView").css("display", "block")
			$(".fa-th-list").css("color", "black")
			$(".fa-th-large").css("color", "")

		})

		$(".fa-th-large").click(function() {
			console.log("bb")

			$(".listView").css("display", "none")
			$(".largeView").css("display", "block")
			$(".fa-th-large").css("color", "black")
			$(".fa-th-list").css("color", "")

		})

		$("#editBarClose").click(function() {
			$(".pjCheckAll").prop("checked", false)
			$(".select-count").text("0개 프로젝트가 선택되었습니다.")
			$("#totalProjectEditBar").css("display", "none")
		})

		$(".select-clear").click(function() {
			$(".pjCheckAll").prop("checked", false)
			$(".select-count").text("0개 프로젝트가 선택되었습니다.")
		})


		$(".pjCheckAll").change(function() {
			console.log("체크변경")
			console.log($('.pjCheckAll:checked'))
			var checkedCnt = $('.pjCheckAll:checked').length;
			console.log(checkedCnt)
			$(".select-count").text(checkedCnt + "개 프로젝트가 선택되었습니다.")
		})

		$(".pjCheck").click(function(e) {
			e.stopPropagation()
		})

		/*$(".fa-plus").click(function(){
            $("#tagTable").append('<tr class="dontAdd"><td colspan="4">'+
                    '<div class="input-group mb-3 id="dontAdd">' +
                        '<input type="text" class="form-control" placeholder="" aria-label="">' +
                        '<div class="input-group-append">' +
                          '<button class="btn btn-primary" type="button">추가</button>' +
                         '</div></div></td></tr>'
            )
        })*/
		$(".tagAddBtn").click(function(){
			$("#AddTagModal").modal("show")
		})

		$(".newPj").click(function(){
			$("#makePj").modal("show")
		})

		$(".project").click(function(e){
			//project__icon
			//project__check
			console.log(e.target)
			location.href = "/detailPj.do";
		})

		$("#tagEdit").click(function(){
			$("#tagEditModal").modal("show")
		})

		$("#addTag").click(function(){
			console.log('확인df')
				$("#tagTable").append(
						'<tr>'+
						'<td><i class="fa fa-tag fa-lg"></i>'+
						'</td>'+
						'<th style="width: 50%">테스트</th>'+
						'<td style="width: 20%; text-align: right;">'+
							'<div class="custom-control custom-checkbox">'+
								'<input type="checkbox" class="custom-control-input" id="tag6">'+
									' <label class="custom-control-label" for="tag6"></label>'+
							'</div>'+
						'</td>'+
						'<td style="width: 15%; text-align: right;">'+
							'<div class="btn-group dropright">'+
								'<i class="fa fa-ellipsis-v fa-lg" data-toggle="dropdown"'+
								   'aria-haspopup="true" aria-expanded="false" style="width: 30px;"></i>'+
								'<div class="dropdown-menu dropright">'+
									'<a class="dropdown-item" href="#" id="tagEdit">수정</a>'+
									'<div class="dropdown-divider"></div>'+
									'<a class="dropdown-item" href="#">삭제</a>'+
								'</div>'+
							'</div>'+
						'</td>'+
					'</tr>'
						)
		})
		
		
		
		
		
	})
	

</script>



</body>
</html>