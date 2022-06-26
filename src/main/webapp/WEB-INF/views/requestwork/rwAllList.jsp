<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h2{
display: inline-block;
margin-right: 20px;
color: black;
}
#sort{
display: inline-block;
width: auto;
}
.section-body{
margin-left: 20px;
margin-right: 20px;
margin-top: 5px;

}
.rw-list{
	background-color: white;
	border-radius: 5px;
	height: auto;
	margin-top: 20px;
	margin-bottom: 20px;
	padding: 20px;
	
}

.thead tr th, .tbody tr td{
text-align: center;
}
.pagination{
	justify-content: center;
	margin-top: 100px;
	
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
.searchWrap{
width: auto;
display: inline-block;
float: right;
}
.search-O-title{
	font-size: 18px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
	width: 100px;
	border-bottom: 1px solid lightgray;
	margin-bottom: 10px;
	color: black;
	display: inline-block;
}
.radiolabel{
font-family: 'Nanum Gothic', sans-serif;
margin-right: 15px;
font-size: 18px;
font-weight: bold;
margin-top: 5px;
}
.s-css{
border-radius: 5px;
font-weight: bold;
padding: 5px;


}
.tbody tr td{
text-align: center;
}

.listarea > tr:hover {
	background-color: rgb(243, 240, 240);
	cursor: pointer;
}
</style>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<div class="main-content">
<div style="height: 100px"></div>
<div>
	<h2 >전체 업무요청</h2>
	<div class="searchWrap">
		<form class="form-inline mr-auto" method="get" action="allRequest.do">
         	<select class="sorttmenu" id="selectsearch" name="searchTarget">
			    <option value="name">담당자</option>
			    <option value="title">제목</option>
			    <option value="content">내용</option>
		  	</select>
	        <div class="search-element">
	          <input class="form-control" type="search" name="searchKeyword" placeholder="Search" aria-label="Search" data-width="250" value="${sd.searchKeyword}">
			  <input type="hidden" id="searchedKeyword" value="${sd.searchKeyword}">
			  <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
         	</div>
       </form>
	</div>
	<hr>
	<div class="section-body">
		<div class="rw-list">
			<div class="search-O-title">검색옵션</div>
			<div class="text-center">
				<table class="table table-bordered">
					<tr class="thead-light">
						<th>중요도</th>
						<td class="text-left">
							<input  type="radio" name="important" id="importantAll" value="">
						  <label  for="importantAll" class="radiolabel">전체</label>
						  <input  type="radio" name="important" id="important1" value="1">
						  <label  for="important1" class="radiolabel">상</label>
						  <input  type="radio" name="important" id="important2" value="2">
						  <label  for="important2" class="radiolabel">중</label>
						  <input  type="radio" name="important" id="important3" value="3">
						  <label  for="important3" class="radiolabel">하</label>
						</td>
						<th>분류</th>
						<td class="text-left">
						  <input  type="radio" name="type" id="type1" value="all">
						  <label  for="type1" class="radiolabel">전체</label>
						  <input  type="radio" name="type" id="type2" value="RS">
						  <label  for="type2" class="radiolabel">요청됨</label>
						  <input  type="radio" name="type" id="type3" value="RQ">
						  <label  for="type3" class="radiolabel">요청함</label>
						</td>
					</tr>
					<tr class="thead-light">
						<th>진행 상태</th>
						<td colspan="3" class="text-left">
						  <input  type="radio" name="status" id="statusall" value="">
						  <label  for="statusall" class="radiolabel">전체</label>
						  <input  type="radio" name="status" id="rq" value="RQ">
						  <label  for="rq" class="radiolabel">시작 전</label>
						  <input  type="radio" name="status" id="p" value="P">
						  <label  for="p" class="radiolabel">진행 중</label>
						  <input  type="radio" name="status" id="s" value="S">
						  <label  for="s" class="radiolabel">보류</label>
						  <input  type="radio" name="status" id="cc" value="CC">
						  <label  for="cc" class="radiolabel">취소</label>
						  <input  type="radio" name="status" id="rf" value="RF">
						  <label  for="rf" class="radiolabel">거절</label>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="section-body">
		<div class="rw-list">
			<select class="sorttmenu" id="selectsort">
				<option value="">정렬 없음</option>
			    <option value="IMPORTANT">중요도</option>
			    <option value="TERM">기한</option>
			    <option value="CREATE_DATE">요청된 일자</option>
		  	</select>
				<table class="table table-sm">
					<thead class="thead">
						<tr>
							<th style="width: 150px; ">글번호</th>
							<th style="width: 200px; ">요청자</th>
							<th style="width: 200px; ">담당자</th>
							<th style="width: 200px; ">중요도</th>
							<th style="width: 200px; ">진행상태</th>
							<th style="width: 600px; "> 제목</th>
							<th style="width: 400px; ">기한</th>
							<th style="width: 400px; ">요청된 일자</th>
							<th style="width: 200px; ">삭제</th>
						</tr>
					</thead>
					<tbody class="tbody listarea">
					<c:forEach items="${list}" var="i">
					<tr>
						<td>${i.rw_no}</td>
						<td>${i.req_member}</td>
						<td>${i.res_member}</td>
						<td>
						<c:choose>
							<c:when test="${i.important eq '1' }"><button class="btn btn-sm btn-danger" style="width: 100px;">중요</button></c:when>
							<c:when test="${i.important eq '2' }"><button class="btn btn-sm btn-primary" style="width: 100px;">보통</button></c:when>
							<c:otherwise><button class="btn btn-sm btn-secondary" style="width: 100px;">낮음</button></c:otherwise>
						</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${i.status eq 'RQ' }"><div class='s-css' style='background-color: lightgray;'>진행전</div></c:when>
								<c:when test="${i.status eq 'P' }"><div class='s-css' style='background-color: rgb(39, 82, 223); color: white; '>진행중</div></c:when>
								<c:when test="${i.status eq 'S' }"><div class='s-css' style='background-color: rgb(94, 155, 94); color: white;'>보류중</div></c:when>
								<c:when test="${i.status eq 'CC' }"><div class='s-css' style='background-color: rgb(187, 42, 42); color: white; '>취소됨</div></c:when>
								<c:when test="${i.status eq 'RF' }"><div class='s-css' style='background-color: rgb(219, 124, 15); color: white;'>거절됨</div></c:when>
							</c:choose>
						</td>
						<td>${i.title }</td>
						<td>
						<c:choose>
							<c:when test="${empty i.term}">기한 없음</c:when>
							<c:otherwise>${i.term }</c:otherwise>
						</c:choose>
						</td>
						<td>${i.create_date }</td>
						<td><button type="button" class="btn btn-secondary" onclick="deleteRW(${i.rw_no});">삭제</button></td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			
				<ul class="pagination Pi">
					<c:choose>
						<c:when test="${ pi.currentPage ne 1 }">
							<li class="page-item" ><a class="page-link" onclick="beforafterPage(-1)">Previous</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" >Previous</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:choose>
						<c:when test="${ pi.currentPage ne p }">
								<li class="page-item" ><a class="page-link" onclick="changePage(${p})">${ p }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" id="crnpage">${ p }</a></li>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					
					
					<c:choose>
						<c:when test="${ pi.currentPage ne pi.maxPage }">
							<li class="page-item"><a class="page-link" onclick="beforafterPage(1)">Next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" >Next</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
		</div>
	</div>
  </div>
</div>

<jsp:include page="../requestwork/rwDetail_3.jsp"></jsp:include>
<script src="/resources/assets/js/rwAllList.js"></script>
<script>
	console.log("${sd}");
$(function(){
	let searchTarget = '${sd.searchTarget}';
if(searchTarget != ''){
$('#selectsearch option[value = '+searchTarget+']').prop("selected", true);
}

})
</script>
</body>
</html>