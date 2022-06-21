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

</style>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<div class="main-content">
<div style="height: 100px"></div>
<div class="wrap">
	<h2 >완료된 업무</h2>
	<hr>
	<div class="section-body">
		<div><span class="cmenu" style="color: black;">전체</span><span class="cmenu">|</span><span class="cmenu">요청된 업무</span><span class="cmenu">|</span><span class="cmenu">요청한 업무</span></div>	
		<div class="rw-list">
			<div class="menu2-title">전 체</div>
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
			<div id="searchwrap">
		            <div id="search">
				        <select class="searchForm" id="selectsearch">
					    	<option>이름</option>
					    	<option>Ketchup</option>
					    	<option>Relish</option>
				  		</select>
						<input type="text" class="searchForm" id="searchText" placeholder="검색 키워드를 입력하세요!">
						<button class="btn btn-primary" type="button" id="searchbtn">검색</button>
					</div>
					</div>
		</div>
	</div>
  </div>
</div>


</body>
</html>