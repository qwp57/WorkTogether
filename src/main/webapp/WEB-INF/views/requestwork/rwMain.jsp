<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	height: auto;
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
.thead tr th, .tbody tr td{
text-align: center;
}
.pagination{
	justify-content: center;
}
.sorttmenu{
display: inline-block;
height: 35px;
width : 100px;
margin : 10px;
float: right;
border: 1px solid lightgray;
border-radius: 5px;
}
.rw-btn{
cursor: pointer;
}
.rw-btn:hover{
box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.4);
transform: scale(1.02);
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
									<div class="card rw-menu rw-count-card rw-btn" id="completed-rw">
										<h1>
											<i class='fa-solid fa-box-archive'></i>
										</h1>
										<span class="menuText" >완료된 업무요청</span>
									</div>
								</div>
								<div class="col-12 col-lg-5">
									<div class="card rw-btn" id="all-rw" style="margin-bottom: 10px;">
										<i class='fa fa-file-text menuText'> 전체 업무요청</i>
									</div>
									<div class="card rw-btn" id="rw-application" style="margin-top: 0;">
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
					<select class="sorttmenu" id="selectsort_2">
					    <option>중요도</option>
					    <option>기한</option>
					    <option>상태</option>
				  	</select>
					<table class="table  table-sm">
						<thead class="thead">
							<tr>
								<th style="width: 300px; ">보낸 이</th>
								<th style="width: 200px; ">중요도</th>
								<th style="width: 600px; "> 제목</th>
								<th style="width: 300px; ">상태</th>
								<th style="width: 400px; ">기한</th>
								<th style="width: 300px; "></th>
							</tr>
						</thead>
						<tbody class="tbody rs">
							<tr>
								<td>홍길동</td>
								<td><button class="btn btn-sm btn-danger" style="width: 100px;">중요</button></td>
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
					<div class="menu2-title">요청한 업무</div>
					<select class="sorttmenu" id="selectsort_1">
					    <option>중요도</option>
					    <option>기한</option>
					    <option>상태</option>
				  	</select>
					<table class="table table-sm">
						<thead class="thead">
							<tr>
								<th style="width: 300px; ">담당자</th>
								<th style="width: 200px; ">중요도</th>
								<th style="width: 600px; "> 제목</th>
								<th style="width: 300px; ">상태</th>
								<th style="width: 400px; ">기한</th>
								<th style="width: 300px; "></th>
							</tr>
						</thead>
						<tbody class="tbody rq">					
							<tr>
								<td>홍길동</td>
								<td><button class="btn btn-sm btn-danger" style="width: 100px;">중요</button></td>
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
	<jsp:include page="../requestwork/rwApplication.jsp"></jsp:include>
	<jsp:include page="../requestwork/rwDetail_1.jsp"></jsp:include><!-- css rwDetail_2와 공유함 -->
	<jsp:include page="../requestwork/rwDetail_2.jsp"></jsp:include>
	
<script type="text/javascript">
	$('#completed-rw').click(function() {
		location.href="/completedRequest.do";
	})
	
	$('#all-rw').click(function() {
		location.href="/allRequest.do";
	})
</script>
</body>
</html>