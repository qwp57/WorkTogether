<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<div class="main-content">
<div style="height: 100px"></div>
<div class="wrap">
	<h2 >전체 업무요청</h2>
	<div class="searchWrap">
		<form class="form-inline mr-auto">
         	<select class="sorttmenu" id="selectsort_2">
			    <option>담당자</option>
			    <option>제목</option>
			    <option>내용</option>
		  	</select>
	        <div class="search-element">
	          <input class="form-control" type="search" placeholder="Search" aria-label="Search" data-width="250">
	          <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
	          <div class="search-backdrop"></div>
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
						  <input  type="radio" name="important" id="inlineRadio1" value="">
						  <label  for="inlineRadio1" class="radiolabel">상</label>
						  <input  type="radio" name="important" id="inlineRadio2" value="">
						  <label  for="inlineRadio2" class="radiolabel">중</label>
						  <input  type="radio" name="important" id="inlineRadio2" value="">
						  <label  for="inlineRadio2" class="radiolabel">하</label>
						</td>
						<th>업무</th>
						<td class="text-left">
						  <input  type="radio" name="important" id="inlineRadio1" value="">
						  <label  for="inlineRadio1" class="radiolabel">전체</label>
						  <input  type="radio" name="important" id="inlineRadio2" value="">
						  <label  for="inlineRadio2" class="radiolabel">요청됨</label>
						  <input  type="radio" name="important" id="inlineRadio2" value="">
						  <label  for="inlineRadio2" class="radiolabel">요청함</label>
						</td>
					</tr>
					<tr class="thead-light">
						<th>상태</th>
						<td colspan="3" class="text-left">
						  <input  type="radio" name="important" id="" value="">
						  <label  for="inlineRadio1" class="radiolabel">시작 전</label>
						  <input  type="radio" name="important" id="" value="">
						  <label  for="inlineRadio2" class="radiolabel">진행 중</label>
						  <input  type="radio" name="important" id="" value="">
						  <label  for="inlineRadio2" class="radiolabel">보류</label>
						  <input  type="radio" name="important" id="" value="">
						  <label  for="inlineRadio2" class="radiolabel">취소</label>
						  <input  type="radio" name="important" id="" value="">
						  <label  for="inlineRadio2" class="radiolabel">거절</label>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="section-body">
		<div class="rw-list">
			<select class="sorttmenu" id="selectsort_2">
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
							<th style="width: 400px; ">기한</th>
							<th style="width: 400px; ">완료된 일자</th>
						</tr>
					</thead>
					<tbody class="tbody rs">
						<tr>
							<td>홍길동</td>
							<td><button class="btn btn-sm btn-danger" style="width: 100px;">중요</button></td>
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
  </div>
</div>


</body>
</html>