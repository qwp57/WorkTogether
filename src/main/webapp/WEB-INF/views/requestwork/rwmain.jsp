<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<script src="https://kit.fontawesome.com/9b80e7c08f.js"
	crossorigin="anonymous"></script>
<style>
.rw-menu {
	background-color: white;
	border-radius: 5px;
	display: inline-block;
}

.v-line {
	border-right: 1px solid black;
}

.rw-count {
	display: flex;
	justify-content: space-around;
	text-align: center;
}

.rw-count-card {
	width: 200px;
	padding: 20px;
}

.card {
	text-align: center;
	margin-top: 30px;
}

#all-rw, #rw-application {
	padding-top: 20px;
	padding-bottom: 20px;
}

.menuText {
	font-size: 18px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
}
.rw-list{
	background-color: white;
	border-radius: 5px;
	height: 300px;
	margin-top: 20px;
	margin-bottom: 20px;
	padding: 20px;
	
}
.menu2-title{
	font-size: 18px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
	width: 100px;
	border-bottom: 1px solid lightgray;
	margin-bottom: 10px;
	color: black;
	display: inline-block;
}
.thead th{
text-align: center;
}
.pagination{
	justify-content: center;
}
.sorttmenu{
display: inline-block;

}
#selectsortA , #selectsortB{
height: 40px;
margin-left: 20px;

}
</style>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/sidebar.jsp" />

	<div class="main-content">
		<section class="section">
			<div style="height: 50px"></div>
			<div class="section-body">
				<div class="container">
					<h2 class=""></h2>
					<div class="row">
						<div class="col-12 col-lg-6 v-line">
							<div class="rw-count">
								<div class="card rw-menu rw-count-card">
									<h1>0</h1>
									<span class="menuText">새 업무요청</span>
								</div>
								<div class="card rw-menu rw-count-card ">
									<h1>0</h1>
									<span class="menuText">진행중 업무요청</span>
								</div>
							</div>
						</div>

						<div class="col-12 col-lg-6">
							<div class="row rw-count">
								<div class="col-12 col-lg-5">
									<div class="card rw-menu rw-count-card">
										<h1>
											<i class='fa-solid fa-box-archive'></i>
										</h1>
										<span class="menuText">완료된 업무요청</span>
									</div>
								</div>
								<div class="col-12 col-lg-5">
									<div class="card" id="all-rw" style="margin-bottom: 10px;">
										<i class='fa fa-file-text menuText'> 전체 업무요청</i>
									</div>
									<div class="card" id="rw-application" style="margin-top: 0;">
										<i class='fa fa-edit menuText'> 업무요청신청</i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="section-body">
				<div class="rw-list">
					<div class="menu2-title">요청된 업무</div>
					<div class="sorttmenu" align="right">
						<select class="form-control" id="selectsort">
						    <option>중요도</option>
						    <option>기한</option>
						    <option>상태</option>
					  	</select>
					</div>
					<table class="table table-bordered ">
						<thead class="thead-dark">
							<tr class="thead">
								<th>보낸 이</th>
								<th>중요도</th>
								<th>제목</th>
								<th>상태</th>
								<th>기한</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
					
				   <ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</div>
				
				
				<div class="rw-list">
					<div class="menu2-title">요청된 업무</div>
					<table class="table table-bordered ">
						<thead class="thead-dark">
							<tr class="thead">
								<th>보낸 이</th>
								<th>중요도</th>
								<th>제목</th>
								<th>상태</th>
								<th>기한</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</div>
			</div>
		</section>
	</div>

</body>
</html>