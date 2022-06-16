<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>



	.pjColors {
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




	#tagTable tr:hover, .tagAddBtn:hover{
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
	.fa-th-list, .fa-th-large, .fa-ellipsis-v , .tagAddBtn{
		cursor: pointer
	}
	.modal-content{
		z-index: 1001;
	}
</style>
</head>
<body>

<!-- 태그 모달창 -->
<!-- data-backdrop="static" 속성은 모달창 주위의 배경을 클릭해도 창이 닫히지 않도록 한다. -->
<!-- data-keybaord="false" 속성은 esc키를 눌러도 창이 닫히지 않게 한다. -->
<div class="modal fade"  id="tagModal" data-backdrop="static"
	 data-keyboard="false">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content row">
			<!-- modal header : 제목 -->
			<div class="modal-header">
				<span><h3 class="modal-title text-left">프로젝트 태그 설정</h3></span> <span><input
					type="image" data-dismiss="modal"
					src="/resources/assets/img/close.png/" style="width: 20px;"></span>
			</div>
			<!-- modal body : 내용 -->
			<form class="form" id="tagSave">
				<div class="modal-body">
					<table id="tagTable">
						<c:forEach var="index" begin="1" end="5">
							<tr>
								<td><i class='fa fa-tag fa-lg'></i>
								</td>
								<th style="width: 50%">테스트</th>
								<td style="width: 20%; text-align: right;">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											   id="tag${index }"> <label
											class="custom-control-label" for="tag${index }"></label>
									</div>
								</td>
								<td style="width: 15%; text-align: right;">
									<div class="btn-group dropright">
										<i class='fa fa-ellipsis-v fa-lg' data-toggle="dropdown"
										   aria-haspopup="true" aria-expanded="false" style="width: 30px;"></i>
										<div class="dropdown-menu dropright">
											<a class="dropdown-item" href="#" id="tagEdit">수정</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">삭제</a>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
					<br>
					<div class="col-lg-12 text-center">
						<i class='fa fa-plus fa-2x tagAddBtn'></i>
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



<!-- 태그추가 모달창 -->
<!-- data-backdrop="static" 속성은 모달창 주위의 배경을 클릭해도 창이 닫히지 않도록 한다. -->
<!-- data-keybaord="false" 속성은 esc키를 눌러도 창이 닫히지 않게 한다. -->
<div class="modal fade"  id="AddTagModal" data-backdrop="static"
	 data-keyboard="false">
	<div class="modal-dialog modal-sm modal-dialog-centered">
		<div class="modal-content row">
			<!-- modal header : 제목 -->
			<div class="modal-header">
				<span><h4 class="modal-title text-left">프로젝트 태그 추가</h4></span> <span><input
					type="image" data-dismiss="modal"
					src="/resources/assets/img/close.png/" style="width: 20px;"></span>
			</div>
			<!-- modal body : 내용 -->
			<form class="form" id="tagAdd">
				<div class="modal-body">
					<div class="form-group">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="" aria-label="">
							<div class="input-group-append">
								<button class="btn btn-primary" id="addTag" type="button" data-dismiss="modal">추가</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- 태그수정 모달창 -->
<!-- data-backdrop="static" 속성은 모달창 주위의 배경을 클릭해도 창이 닫히지 않도록 한다. -->
<!-- data-keybaord="false" 속성은 esc키를 눌러도 창이 닫히지 않게 한다. -->
<div class="modal fade"  id="tagEditModal" data-backdrop="static"
	 data-keyboard="false">
	<div class="modal-dialog modal-sm modal-dialog-centered">
		<div class="modal-content row">
			<!-- modal header : 제목 -->
			<div class="modal-header">
				<span><h4 class="modal-title text-left">프로젝트 태그 수정</h4></span> <span><input
					type="image" data-dismiss="modal"
					src="/resources/assets/img/close.png/" style="width: 20px;"></span>
			</div>
			<!-- modal body : 내용 -->
			<form class="form" id="tagAdd">
				<div class="modal-body">
					<div class="form-group">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="테스트" aria-label="">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button" data-dismiss="modal">수정</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>



<!-- 색상 모달창 -->
<!-- data-backdrop="static" 속성은 모달창 주위의 배경을 클릭해도 창이 닫히지 않도록 한다. -->
<!-- data-keybaord="false" 속성은 esc키를 눌러도 창이 닫히지 않게 한다. -->
<div class="modal fade" id="colorModal" data-backdrop="static" data-keyboard="false" style="text-align: center;">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content row">
			<!-- modal header : 제목 -->
			<div class="modal-header">
				<span><h3 class="modal-title text-left">프로젝트 색상 설정</h3></span> <span><input
					type="image" data-dismiss="modal"
					src="/resources/assets/img/close.png/" style="width: 20px;"></span>
			</div>
			<!-- modal body : 내용 -->
			<form class="form" id="pjColorsave">
				<div class="modal-body">
					<table id="colorTable">
						<tr>
							<c:forEach var="index" begin="1" end="4">
								<td><div class="pjColors color-${index }"><div class="custom-control custom-radio">
										<input type="radio" name="customRadio" value="color-${index}"
											   class="custom-control-input" id="color${index}"> <label
											class="custom-control-label" for="color${index}"></label>
									</div></div>
									</td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="index" begin="5" end="8">
								<td><div class="pjColors color-${index }"><div class="custom-control custom-radio">
										<input type="radio" name="customRadio" value="color-${index}"
											   class="custom-control-input" id="color${index}">
									<label class="custom-control-label" for="color${index}"></label>
									</div></div>
									</td>
							</c:forEach>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<div class="col-lg-12 text-center">
						<button type="button" class="btn btn-primary btn-lg mb-3" onclick="closeColorModal();">저장</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>

</html>