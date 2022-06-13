<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/9b80e7c08f.js" crossorigin="anonymous"></script>
</head>
<style>
h2{
display: inline-block;
margin-right: 20px;
color: black;
}
#selectweek{
display: inline-block;
width: auto;
}
.wrap{
margin-left: 200px;
margin-right: 200px;
margin-top: 100px;
}
.section-body{
margin-bottom: 30px;
margin-top: 30px;
}
.vac-menu-title{
font-family: 'Nanum Gothic', sans-serif;
font-size: 26px;
font-weight: 700;
color: black;
margin-top: 10px;
}
#profileImg{
	width: 90px;
	margin: 20px
}
.pagination{
	justify-content: center;
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
<div class="wrap">
	<a href="vacationMgtMain.do"><h2 style="color: gray">내 휴가</h2></a>
	<a href="teamVacation.do"><h2>구성원 휴가</h2></a>
	
	<select class="form-control" id="selectweek">
	    <option>2022년</option>
	    <option>Ketchup</option>
	    <option>Relish</option>
  	</select>
  	<div class="vac-menu-title" style="color: gray">휴가 개요</div>
  	<hr>
  	<div class="section-body">
        <h2 class="section-title" style="text-align: left;"> </h2>
        <div class="row mt-sm-4 body-1">
            <div class="col-12 col-md-10 col-lg-12">
                <div class="card h-100">
                    <div class="card-body text-center">
                   		<table class="table table-bordered " >
                            <thead class="thead-dark">
                            	<tr id="thead">
                            		<th>이름</th>
                            		<th>기간</th>
                            		<th>총 사용 기간</th>
                            		<th>종류</th>
                            		<th>사유내용</th>
                            		<th>증명자료</th>
                            		<th>잔여휴가</th>
                            		<th>상태</th>
                            		
                            	</tr>
                            </thead>
                            <tbody>
                            	<tr>
                            		<td>
                            			<img alt="image"
                                                 src="resources/assets/img/avatar/avatar-1.png"
                                                 id="profileImg" class="img-fluid rounded-circle"><span>홍길동 대리</span>
                            		</td>
                            		<td></td>
                            		<td></td>
                            		<td></td>
                            		<td></td>
                            		<td></td>
                            		<td></td>
                            		<td></td>
                            		
                            	</tr>
                            </tbody>
                        </table>
                   
                    </div>
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
  	
  	
</div>
</div>
<br><br>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>