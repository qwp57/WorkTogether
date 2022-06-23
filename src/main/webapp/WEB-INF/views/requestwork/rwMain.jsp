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
									<h1>
									<c:choose>
										<c:when test="${empty RQ}">0</c:when>
										<c:otherwise>${RQ}</c:otherwise>
									</c:choose>
									</h1>
									<span class="menuText">새 업무요청</span>
								</div>
								<div class="card rw-menu rw-count-card ">
									<h1>
									<c:choose>
										<c:when test="${empty P}">0</c:when>
										<c:otherwise>${P}</c:otherwise>
									</c:choose>
									</h1>
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
								<th style="width: 150px">글번호</th>
								<th style="width: 200px; ">보낸 이</th>
								<th style="width: 200px; ">중요도</th>
								<th style="width: 600px; "> 제목</th>
								<th style="width: 200px; ">상태</th>
								<th style="width: 300px; ">기한</th>
								<th style="width: 200px; "></th>
							</tr>
						</thead>
						<tbody class="tbody rs">
						<c:forEach items="${resList}" var="r">
							<tr>
								<td>${r.rw_no }</td>
								<td>${r.req_member}</td>
								<td>
								<c:choose>
									<c:when test="${r.important eq '1'}"><button class="btn btn-sm btn-danger" style="width: 100px;">상</button></c:when>
									<c:when test="${r.important eq '2'}"><button class="btn btn-sm btn-primary" style="width: 100px;">중</button></c:when>
									<c:otherwise><button class="btn btn-sm btn-secondary" style="width: 100px;">중</button></c:otherwise>
								</c:choose>
								</td>
								<td>${r.title}</td>
								<td>
								<c:choose>
									<c:when test="${r.status eq 'RQ'}">진행전</c:when>
									<c:when test="${r.status eq 'P'}">진행중</c:when>
									<c:when test="${r.status eq 'S'}">보류중</c:when>
									<c:when test="${r.status eq 'CC'}">취소됨</c:when>
									<c:when test="${r.status eq 'RF'}">거절됨</c:when>
								</c:choose>
								</td>
								<td>
								<c:choose>
									<c:when test="${empty r.term}">기한 없음</c:when>
									<c:otherwise>${r.term }</c:otherwise>
								</c:choose>
								</td>
								<td><button>삭제버튼</button></td>
							</tr>
						</c:forEach>
						<c:if test="${empty resList}"><tr><td colspan="6">조회된 내역이 없습니다.</td></tr></c:if>
						</tbody>
					</table>
					
				       <ul class="pagination">
						<c:choose>
							<c:when test="${ respi.currentPage ne 1 }">
								<li class="page-item" ><a class="page-link" href="#">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach begin="${ respi.startPage }" end="${ respi.endPage }" var="p">
							<c:choose>
							<c:when test="${ respi.currentPage ne p }">
									<li class="page-item" ><a class="page-link" href="#">${ p }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						
						
						<c:choose>
							<c:when test="${ respi.currentPage ne respi.maxPage }">
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
							</c:otherwise>
						</c:choose>
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
								<th style="width: 150px">글번호</th>
								<th style="width: 200px; ">담당자</th>
								<th style="width: 200px; ">중요도</th>
								<th style="width: 600px; "> 제목</th>
								<th style="width: 200px; ">상태</th>
								<th style="width: 300px; ">기한</th>
								<th style="width: 200px; "></th>
							</tr>
						</thead>
						<tbody class="tbody rq">					
							<c:forEach items="${reqList}" var="r">
							<tr>
								<td>${r.rw_no}</td>
								<td>${r.res_member}</td>
								<td>
								<c:choose>
									<c:when test="${r.important eq '1'}"><button class="btn btn-sm btn-danger" style="width: 100px;">상</button></c:when>
									<c:when test="${r.important eq '2'}"><button class="btn btn-sm btn-primary" style="width: 100px;">중</button></c:when>
									<c:otherwise><button class="btn btn-sm btn-secondary" style="width: 100px;">중</button></c:otherwise>
								</c:choose>
								</td>
								<td>${r.title}</td>
								<td>
								<c:choose>
									<c:when test="${r.status eq 'RQ'}">진행전</c:when>
									<c:when test="${r.status eq 'P'}">진행중</c:when>
									<c:when test="${r.status eq 'S'}">보류중</c:when>
									<c:when test="${r.status eq 'CC'}">취소됨</c:when>
									<c:when test="${r.status eq 'RF'}">거절됨</c:when>
								</c:choose>
								</td>
								<td>
								<c:choose>
									<c:when test="${empty r.term}">기한 없음</c:when>
									<c:otherwise>${r.term }</c:otherwise>
								</c:choose>
								</td>
								<td><button>삭제버튼</button></td>
							</tr>
						</c:forEach>
						<c:if test="${empty reqList}"><tr><td>조회된 내역이 없습니다.</td></tr></c:if>
						</tbody>	
					</table>
				 <ul class="pagination">
						<c:choose>
							<c:when test="${ reqpi.currentPage ne 1 }">
								<li class="page-item" ><a class="page-link" href="#">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach begin="${ reqpi.startPage }" end="${ reqpi.endPage }" var="p">
							<c:choose>
							<c:when test="${ reqpi.currentPage ne p }">
									<li class="page-item" ><a class="page-link" href="#">${ p }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						
						
						<c:choose>
							<c:when test="${ reqpi.currentPage ne reqpi.maxPage }">
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="../requestwork/rwApplication.jsp"></jsp:include>
	<jsp:include page="../requestwork/rwDetail_1.jsp"></jsp:include><!-- css rwDetail_2와 공유함 -->
	<jsp:include page="../requestwork/rwDetail_2.jsp"></jsp:include>
	


</body>
</html>