<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
.wrap{
width: 80%;
margin: auto;
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
.cmenu{
font-size: 18px;
font-family: 'Nanum Gothic', sans-serif;
font-weight: bold;
margin: 5px;
cursor: pointer;
}
#searchwrap{
margin: 20px;
}
#search{
width: 60%;
margin: auto;
}
.searchForm{
height: 50px;
border-radius: 10px;
border: 1px solid lightgray;

}

.searchForm:focus{
outline: none;
border: 1px solid blue;

}
#selectsearch{
width: 20%;
text-align: center;
font-family: 'Nanum Gothic', sans-serif;
}
#searchText{
width : 60%;
font-family: 'Nanum Gothic', sans-serif;
}
#searchbtn{
height: 50px;
border-radius: 10px;
border: 1px solid lightgray;

width: 15%;
font-size: 17px;
font-family: 'Nanum Gothic', sans-serif;
}
.complete > tr:hover {
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
	<h2 >완료된 업무</h2>
	<hr>
	<div class="section-body">
		<div><span class="cmenu">전체</span><span class="cmenu">|</span><span class="cmenu">요청된 업무</span><span class="cmenu">|</span><span class="cmenu">요청한 업무</span></div>	
		<div class="rw-list">
		<form action="/completedRequest.do" method="post" id="completeForm">
			<div class="menu2-title">
				<c:choose>
					<c:when test="${type eq 'RQ'}">요청한 업무</c:when>
					<c:when test="${type eq 'RS'}">요청된 업무</c:when>
					<c:otherwise>전 체</c:otherwise>
				</c:choose>
			</div>
			<select class="sorttmenu" id="selectsort_2" name = sort>
				<option value="">정렬 없음</option>
			    <option value="important">중요도</option>
			    <option value="term">기한</option>
			    <option value="modified_date">완료일자</option>
		  	</select>
		  	
				<table class="table table-sm">
					<thead class="thead">
						<tr>
							<th style="width: 150px; ">글번호</th>
							<th style="width: 300px; ">요청자</th>
							<th style="width: 300px; ">담당자</th>
							<th style="width: 200px; ">중요도</th>
							<th style="width: 600px; "> 제목</th>
							<th style="width: 400px; ">기한</th>
							<th style="width: 400px; ">완료된 일자</th>
							<th style="width: 200px; ">삭제</th>
						</tr>
					</thead>
					<tbody class="tbody complete">
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
						<td>${i.title }</td>
						<td>
						<c:choose>
							<c:when test="${empty i.term}">기한 없음</c:when>
							<c:otherwise>${i.term }</c:otherwise>
						</c:choose>
						</td>
						<td>${i.modified_date}</td>
						<td><button type="button" class="btn btn-secondary" onclick="deleteComplete(${i.rw_no});">삭제</button></td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			
				<ul class="pagination rqPi">
					<c:choose>
						<c:when test="${ pi.currentPage ne 1 }">
							<li class="page-item" ><a class="page-link" onclick="beforafterRQPage(-1)">Previous</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" >Previous</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:choose>
						<c:when test="${ pi.currentPage ne p }">
								<li class="page-item" ><a class="page-link" onclick="changeRQPage(${p})">${ p }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" id="crnpageRQ">${ p }</a></li>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					
					
					<c:choose>
						<c:when test="${ pi.currentPage ne pi.maxPage }">
							<li class="page-item"><a class="page-link" onclick="beforafterRQPage(1)">Next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" >Next</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<input type="hidden" id="crnPage" name="currentPage" value="${pi.currentPage}">
				<input type="hidden" id="typeid" name="type" value="${type}">
				<div id="searchwrap">
		            <div id="search">
				        <select class="searchForm" id="selectsearch" name="searchTarget">
					    	<option value="name">이름</option>
					    	<option value="title">제목</option>
					    	<option value="content">내용</option>
				  		</select>
						<input type="text" class="searchForm" id="searchText" name="searchKeyword" placeholder="검색 키워드를 입력하세요!" value="${sd.searchKeyword}">
						<button class="btn btn-primary" type="button" id="searchbtn">검색</button>
					</div>
				</div>
		</form>
		</div>
	</div>
  </div>
</div>
<jsp:include page="../requestwork/rwDetail_3.jsp"></jsp:include>
<script>
$(function(){
let type = '${type}';
console.log(type); 
if(type == 'RQ'){

$('.cmenu:nth-child(5)').css('color', 'black');
}else if(type == 'RS'){
	$('.cmenu:nth-child(3)').css('color', 'black');
}else{
	$('.cmenu:nth-child(1)').css('color', 'black');
}
})
let sortVal = '${sort}';
let searchTarget = '${sd.searchTarget}';
if(sortVal != ''){
	
    $('#selectsort_2 option[value = '+sortVal+']').prop("selected", true);
}

if(searchTarget != ''){

	$('#selectsearch option[value = '+searchTarget+']').prop("selected", true);
}


</script>
<script src="/resources/assets/js/rwComplete.js?ver=2"></script>
</body>
</html>