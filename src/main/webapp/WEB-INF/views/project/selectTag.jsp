<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/sidebar.jsp" />

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
	#cardBody{
		width: 70%;
	}
</style>
</head>
<body>
	<div class="main-content">
		<div style="height: 50px;"></div>
				<div style="height: 50px;"></div>
		<div class="container">
			<div class="row">
			
				<div class="col-lg-12">
					<div class="card" id="cardBody" style="margin-left: 150px;">
						<div class="card-body">
							<h3 class="text-left">프로젝트 태그</h3>
							<hr>
							<table id="tagTable" style="width: 100%">
								<c:forEach var="index" begin="1" end="5">
									<tr style="height: 70px;">
										<td style="width: 5%"><i class='fa fa-tag fa-lg'></i></td>
										<th style="width: 50%">테스트</th>
										<td style="width: 15%; text-align: right;">
											<div class="btn-group dropright">
												<i class='fa fa-ellipsis-v fa-lg' data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false"
													style="width: 30px;"></i>
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>