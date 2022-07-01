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
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<style>
.card-body {
	padding-bottom: 0px !important;
}

.body-1 {
	max-height: 850px;
}

.card {
	border-radius: 25px !important;
	margin-bottom: 0px;
}

.boardTable {
	width: 100%;
	text-align: center;
	font-size: large;
}

.boardTable tr {
	border-bottom: 1px solid black;
	border-bottom-color: black;
	height: 80px;
}

.boardTable tr:hover {
	background-color: lightgray;
	transform: scale(1);
	cursor: pointer;
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

.boardTable tr:last-child {
	border-bottom: none;
}

.badge {
	width: 70px;
	color: white;
}

#caSetting:hover, .fa-star:hover, .fa-ellipsis-v:hover, .navMenu:hover,
	.fa-plus:hover, .todoCalendar, .todoPerson, .switchPost, .switchSch,
	.switchTodo {
	cursor: pointer;
}


.boardEnrollBtn tr td:hover {
	cursor: pointer;
	color: #6777ef;
}

.colors {
	-text: white;
	margin-left: 0px;
	margin-left: 15px;
	padding: 0px;
	width: 35px;
	height: 35px;
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

.buttons {
	margin-left: 38%;
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
							<h2>내가 쓴 게시물</h2>
							<div class="input-group col-lg-6 mb-6">
								<input type="text" class="form-control" id="keyword"
									placeholder="검색어를 입력해주세요">
								<div class="input-group-append">
									<button class="btn btn-light" type="submit">
										<i class="bi bi-search"></i>
									</button>
								</div>
							</div>
							<h1 class="section-title"
								style="text-align: left; width: 50%; display: inline-block;">전체</h1>
							<div
								style="text-align: right; width: 49%; display: inline-block;">

								<div class="btn-group dropright mt-4">
									<img id="caSetting"
										src="https://img.icons8.com/external-yogi-aprelliyanto-basic-outline-yogi-aprelliyanto/64/undefined/external-equalizer-multimedia-yogi-aprelliyanto-basic-outline-yogi-aprelliyanto.png"
										style="width: 30px; margin-bottom: 36px;"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false" />
									<h4>&nbsp;&nbsp;필터</h4>
									<div class="dropdown-menu dropright">
										<a class="dropdown-item" href="#">전체</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">글</a> <a
											class="dropdown-item" href="#">업무</a> <a
											class="dropdown-item" href="#">일정</a> <a
											class="dropdown-item" href="#">할 일</a>
									</div>
								</div>
							</div>
							<hr>
							<div class="card">
								<div class="card-body body-1 p-0">
									<table class="boardTable">
										<c:forEach var="index" begin="1" end="2">
											<tr>
												<td style="width: 7%"><div class="colors color-3"></div></td>
												<td style="width: 7%; text-align: right; color: #f3a435;"><span
													class='bi bi-file-text'></span></td>
												<td style="width: 7%; text-align: left;">글</td>
												<th style="width: 35%;">제목</th>
												<td style="width: 12%;">작성자</td>
												<td style="width: 20%;">2022-06-02 01:15</td>
												<td style="width: 12%;">d</td>

											</tr>
										</c:forEach>
										<tr>
											<td style="width: 7%"><div class="colors color-1"></div></td>
											<td style="width: 7%; text-align: right; color: #35f364"><span
												class="bi bi-calendar"></span></td>
											<td style="width: 7%; text-align: left;">일정</td>
											<th style="width: 35%;">제목</th>
											<td style="width: 12%;">작성자</td>
											<td style="width: 20%;">2022-06-02 01:15</td>
											<td style="width: 12%;"><b>6/10</b><br> <a
												style="font-size: smaller">오전 10:45</a></td>
										</tr>
										<tr>
											<td style="width: 7%"><div class="colors color-5"></div></td>
											<td style="width: 7%; text-align: right; color: #3591f3"><span
												class="bi bi-check2-square"></span></td>
											<td style="width: 7%; text-align: left;">할 일</td>
											<th style="width: 35%;">제목</th>
											<td style="width: 12%;">작성자</td>
											<td style="width: 20%;">2022-06-02 01:15</td>
											<td style="width: 12%;"><span class="badge"
												style="background-color: #3591f3; height: 100%; font-size: 18px; color: white;">20%</span>
											</td>

										</tr>
									</table>

								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="section-body">
					<div class="row mt-sm-4">
						<div class="col-md-12 col-lg-12">

							<div class="buttons">
								<nav aria-label="Page navigation example">
									<ul class="pagination text-center">
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												<span class="sr-only">이전</span>
										</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												<span class="sr-only">다음</span>
										</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>