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
.menuTitle{
display: inline-block;
margin-right: 20px;
color: black;
}
#selectweek{
display: inline-block;
width: auto;
}
.wrap{
margin-left: 100px;
margin-right: 100px;
margin-top: 100px;
}
.section-body{
margin-bottom: 30px;
margin-top: 30px;
}
.card:hover {
	box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.4);
	transform: scale(1.02);
}
#card1, #card2, #card3, #card4,
#card5, #card6, #card7, #card8{
border-radius: 20px;
}

.icon{
font-size: 400%;
color: black;
}

.vac-name{
font-family: 'Nanum Gothic', sans-serif;
font-size: 25px;
font-weight: 700;
color: black;
margin-top: 10px;
}
.vac-days{
font-family: 'Nanum Gothic', sans-serif;
font-size: 17px;
font-weight: bold;
color: gray;
margin-top: 0px;
}
.vac-menu-title{
font-family: 'Nanum Gothic', sans-serif;
font-size: 23px;
font-weight: 700;
color: black;
margin-top: 10px;
}

.vac-menu-content{
	width: 100%;
	
}
.vmenustate{
	width: 100px;
}
.btn{
width: 80%;
}
.vac-detail{
font-size: 1.02vw;
font-family: 'Nanum Gothic', sans-serif;
}
#all-List-0, #all-List-1{
width: 150px; 
background-color: white;
color: black;
font-size: 15px;
border-radius: 100px;
font-family: 'Nanum Gothic', sans-serif;
}

</style>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<div class="main-content">
<div class="wrap">
	<h3 class="menuTitle">내 휴가</h3>
	<h3 class="menuTitle" style="color: gray">구성원 휴가</h3>
	
	<select class="form-control" id="selectweek">
	    <option>2022년</option>
	    <option>Ketchup</option>
	    <option>Relish</option>
  	</select>
  	<div class="vac-menu-title" style="color: gray">휴가 개요</div>
  	<hr>
  	<div class="section-body">
  		<div class="row mt-sm body-1">
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card1">
  					<div class="card-body">
					<i class='fa fa-user icon'></i>
					<div class="vac-name">연차</div>
					<div class="vac-days">남은 기간 3일</div>
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card2">
  					<div class="card-body">
  					<i class='fa fa-envelope icon'></i>
  					<div class="vac-name">조의</div>
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card3">
  					<div class="card-body">
					<i class='fas fa-user-friends icon' style="font-size: 400%"></i>
  					<div class="vac-name">가족돌봄</div>
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card4">
  					<div class="card-body">
						<i class='fa fa-bed icon'></i>
						<div class="vac-name">병가</div>
  					</div>
  				</div>
  			</div>
  		</div>
  	</div>
  	
  	<div class="section-body">
  		<div class="row mt-sm body-1">
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card5">
  					<div class="card-body">
					<i class='fa fa-heart icon'></i>
					<div class="vac-name">결혼</div>
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card6">
  					<div class="card-body">
  					<i class="fa-solid fa-circle-exclamation icon"></i>
  					<div class="vac-name">기타</div>
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card7">
  					<div class="card-body">
  					<i class='fa fa-plane icon'></i>
  					<div class="vac-name">리프레시</div>
  					<div class="vac-days">남은 기간 0일</div>
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card8">
  					<div class="card-body">
  					<i class="fa-solid fa-sun icon"></i>  
  					<div class="vac-name">바캉스</div>					
  					<div class="vac-days">남은기간 0일</div>
  					</div>
  				</div>
  			</div>
  		</div>
  	</div>
  	<hr>
  	<div class="section-body">
  		<div class="vac-menu-title"> 휴가 예정 </div>
  		<table class="vac-menu-content">
  			<tr>
  				<th><i class='fa fa-bed'></i></th>
  				<th class="vac-detail">병가 | 2022.06.03(금)~2022.06.07(화)</th>
  				<th class="vac-detail">총 2일</th>
  				<th class="vmenustate"><button class="btn btn-primary btn-lg">승인</button></th>
  				<th class="vmenustate"><button class="btn btn-secondary btn-lg">취소</button></i></th>
  			</tr>
  		</table>
  	</div>
  	<div style="position:relative;">
  		<div style="border-bottom: 1px solid black; height: 80px;"></div>
  		<div style="position: absolute; top: 60px; left: 40%;"><button id="all-List-0" class="btn btn-outline-info btn-lg">모두 보기</button></div>
 	</div>
  	
  	<div class="section-body">
  		<div class="vac-menu-title"> 사용 내역 </div>
  		<table class="vac-menu-content">
  			<tr>
  				<th><i class='fa fa-bed'></i></th>
  				<th class="vac-detail">병가 | 2022.06.03(금)~2022.06.07(화)</th>
  				<th class="vac-detail">총 2일</th>
  				<th class="vmenustate"><button class="btn btn-primary btn-lg">승인</button></th>
  				<th class="vmenustate"><button class="btn btn-secondary btn-lg">삭제</button></th>
  			</tr>
  		</table>
  	</div>
  	<div style="position:relative;">
  		<div style="border-bottom: 1px solid black; height: 80px;"></div>
  		<div style="position: absolute; top: 60px; left: 40%;"><button id="all-List-1" class="btn btn-outline-info btn-lg">모두 보기</button></div>
 	</div>
  	
  	
</div>
</div>
<br><br>

<jsp:include page="../common/footer.jsp"/>

<jsp:include page="../workstate/vacApplication.jsp"/>




</body>
</html>