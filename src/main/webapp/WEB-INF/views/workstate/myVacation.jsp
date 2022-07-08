<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>휴가관리</title>
<script src="https://kit.fontawesome.com/9b80e7c08f.js" crossorigin="anonymous"></script>
</head>
<style>
.menuTitle{
display: inline-block;
margin-right: 20px;
color: black;
}
#selectyear, #selectyearWrap{
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
.vac-menu-content tr th{
	height : 80px;	
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

.nonVisible{
display: none;
}
.statusCss{
padding: 10px; 
border-radius: 5px;
width: 100%;
}

</style>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<div class="main-content">
<div class="wrap">
	<a href="vacationMgtMain.do"><h3 class="menuTitle">내 휴가</h3></a>
	<c:if test="${loginEmp.job_code != 'J5' && loginEmp.job_code != 'J6' && loginEmp.job_code != 'J7'}">
		<a href="teamVacation.do"><h3 class="menuTitle" style="color: gray">구성원 휴가</h3></a>
	</c:if>
	<form action="vacationMgtMain.do" method="post" id="selectyearWrap">
	<select class="form-control" id="selectyear" name="year">
		<c:forEach items="${years}" var="y">
			<option value="${y}">${y}년</option>
		</c:forEach>
  	</select>
  	</form>
  	<div class="vac-menu-title" style="color: gray">휴가 개요</div>
  	<hr>
  	<div class="section-body">
  		<div class="row mt-sm body-1">
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card1">
  					<div class="card-body">
					<i class='fa fa-user icon'></i>
					<div class="vac-name">연차</div>
					<p class="nonVisible">1</p>
					<div class="vac-days">남은 기간 ${days[0]}일</div>
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card2">
  					<div class="card-body">
  					<i class='fa fa-envelope icon'></i>
  					<div class="vac-name">조의</div>
					<p class="nonVisible">2</p>
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card3">
  					<div class="card-body">
					<i class='fas fa-user-friends icon' style="font-size: 400%"></i>
  					<div class="vac-name">가족돌봄</div>
					  <p class="nonVisible">3</p>
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card4">
  					<div class="card-body">
						<i class='fa fa-bed icon'></i>
						<div class="vac-name">병가</div>
						<p class="nonVisible">4</p>
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
					<p class="nonVisible">5</p>
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card6">
  					<div class="card-body">
  					<i class="fa-solid fa-circle-exclamation icon"></i>
  					<div class="vac-name">기타</div>
					  <p class="nonVisible">6</p>
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card7">
  					<div class="card-body">
  					<i class='fa fa-plane icon'></i>
  					<div class="vac-name">리프레시</div>
  					<div class="vac-days">남은 기간 ${days[1]}일</div>
					<p class="nonVisible">7</p>
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-12 col-lg-6 col-xl-3">
  				<div class="card h-100" id="card8">
  					<div class="card-body">
  					<i class="fa-solid fa-sun icon"></i>  
  					<div class="vac-name">바캉스</div>
					<p class="nonVisible">8</p>					
  					<div class="vac-days">남은기간 ${days[2]}일</div>
  					</div>
  				</div>
  			</div>
  		</div>
  	</div>
  	<hr>
  	<div class="section-body">
  		<div class="vac-menu-title"> 휴가 예정 </div>
  		<table class="vac-menu-content">
  			<c:forEach begin="0" end="2" items="${newVacList}" var="vac" >
  				<tr>
  				<c:choose>
  					<c:when test="${vac.vcategory_no eq '연차'}">
  						<th width="50px"><i class='fa fa-user icon'></i></th>
  					</c:when>
  					<c:when test="${vac.vcategory_no eq '조의'}">
  						<th width="50px"><i class='fa fa-envelope icon'></i></th>
  					</c:when>
  					<c:when test="${vac.vcategory_no eq '가족돌봄'}">
  						<th width="50px"><i class='fas fa-user-friends icon' style="font-size: 400%"></i></th>
  					</c:when>
  					<c:when test="${vac.vcategory_no eq '병가'}">
  						<th width="50px"><i class='fa fa-bed icon'></i></th>
  					</c:when>
  					<c:when test="${vac.vcategory_no eq '결혼'}">
  						<th width="50px"><i class='fa fa-heart icon'></i></th>
  					</c:when>
  					<c:when test="${vac.vcategory_no eq '기타'}">
  						<th width="50px"><i class="fa-solid fa-circle-exclamation icon"></i></th>
  					</c:when>
  					<c:when test="${vac.vcategory_no eq '리플레쉬'}">
  						<th width="50px"><i class='fa fa-plane icon'></i></th>
  					</c:when>
  					<c:otherwise>
  						<th width="50px"><i class="fa-solid fa-sun icon"></i> </th>
  					</c:otherwise>
  				</c:choose>
  					<th class="vac-detail"> ${vac.vcategory_no} | <fmt:formatDate value="${vac.start_date}" pattern="yyyy년 MM월 dd일(E)"/> ~ <fmt:formatDate value="${vac.end_date}" pattern="yyyy년 MM월 dd일(E)"/></th>
					<th class="vac-detail">총 ${vac.totaldays}일</th>
					<c:choose>
  						<c:when test="${vac.status eq 'W'}"><th><span  class="statusCss" style="background-color: lightgray; padding: 10px; border-radius: 5px;">승인 대기</span></th></c:when>
  						<c:when test="${vac.status eq 'A'}"><th><span class="statusCss" style="background-color: skyblue; padding: 10px; border-radius: 5px;color: white;">승인 완료</span></th></c:when>
  						<c:otherwise><th><span class="statusCss" style="background-color: red; padding: 10px; border-radius: 5px;color: white;">승인 거부</span></th></c:otherwise>
  					</c:choose>
  					<th class="vmenustate"><button class="btn btn-secondary btn-lg" onclick="deleteVac('${vac.vac_no}')">삭제</button></th>
					  <input type="hidden" name="vac_no" value="${vac.vac_no}">
				</tr>
  			</c:forEach>
  		</table>
  	</div>
  	<div style="position:relative;">
  		<div style="border-bottom: 1px solid black; height: 80px;"></div>
  		<div style="position: absolute; top: 60px; left: 40%;"><button id="all-List-0" class="btn btn-outline-info btn-lg">모두 보기</button></div>
 	</div>
  	
  	<div class="section-body">
  		<div class="vac-menu-title"> 사용 내역 </div>
  		<table class="vac-menu-content">
  			<c:forEach begin="0" end="2" items="${oldVacList}" var="vac" >
  				<tr>
  				<c:choose>
  					<c:when test="${vac.vcategory_no eq '연차'}">
  						<th width="50px"><i class='fa fa-user icon'></i></th>
  					</c:when>
  					<c:when test="${vac.vcategory_no eq '조의'}">
  						<th width="50px"><i class='fa fa-envelope icon'></i></th>
  					</c:when>
  					<c:when test="${vac.vcategory_no eq '가족돌봄'}">
  						<th width="50px"><i class='fas fa-user-friends icon' style="font-size: 400%"></i></th>
  					</c:when>
  					<c:when test="${vac.vcategory_no eq '병가'}">
  						<th width="50px"><i class='fa fa-bed icon'></i></th>
  					</c:when>
  					<c:when test="${vac.vcategory_no eq '결혼'}">
  						<th width="50px"><i class='fa fa-heart icon'></i></th>
  					</c:when>
  					<c:when test="${vac.vcategory_no eq '기타'}">
  						<th width="50px"><i class="fa-solid fa-circle-exclamation icon"></i></th>
  					</c:when>
  					<c:when test="${vac.vcategory_no eq '리플레쉬'}">
  						<th width="50px"><i class='fa fa-plane icon'></i></th>
  					</c:when>
  					<c:otherwise>
  						<th width="50px"><i class="fa-solid fa-sun icon"></i> </th>
  					</c:otherwise>
  				</c:choose>
  					<th class="vac-detail"> ${vac.vcategory_no} | <fmt:formatDate value="${vac.start_date}" pattern="yyyy년 MM월 dd일(E)"/> ~ <fmt:formatDate value="${vac.end_date}" pattern="yyyy년 MM월 dd일(E)"/></th>
					<th class="vac-detail">총 ${vac.totaldays}일</th>
					<c:choose>
  						<c:when test="${vac.status eq 'W'}"><th><span style="background-color: lightgray;padding: 10px; border-radius: 5px;">승인 대기</span></th></c:when>
  						<c:when test="${vac.status eq 'A'}"><th><span style="background-color: skyblue;padding: 10px; border-radius: 5px;color: white;">승인 완료</span></th></c:when>
  						<c:otherwise><th><span style="background-color: red;padding: 10px; border-radius: 5px; color: white;">승인 거부</span></th></c:otherwise>
  					</c:choose>
  					<th class="vmenustate"><button class="btn btn-secondary btn-lg" onclick="deleteVac('${vac.vac_no}');">삭제</button></th>
					<input type="hidden" name="vac_no" value="${vac.vac_no}">
				</tr>
  			</c:forEach>
  		</table>
  	</div>
  	<div style="position:relative;">
  		<div style="border-bottom: 1px solid black; height: 80px;"></div>
  		<div style="position: absolute; top: 60px; left: 40%;"><button id="all-List-1" class="btn btn-outline-info btn-lg">모두 보기</button></div>
 	</div>
  	
  	
</div>
</div>
<br><br>
<form action="/deleteVacLog.do" method="get" id="deleteVacForm">
<input type="hidden" id="vacNo" name="vac_no" value="">
</form>
<jsp:include page="../common/footer.jsp"/>

<jsp:include page="../workstate/vacApplication.jsp"/>
<jsp:include page="../workstate/vacDetailView.jsp"/>

 <script type="text/javascript">
 let newVacList = new Array();
 let oldVacList = new Array();
 let idx = 0;
 let Vac;
 let week = new Array('일', '월', '화', '수', '목','금', '토');
 
<c:forEach items="${oldVacList}" var="vac">

	 Vac = {
		vac_no : "${vac.vac_no}",
		emp_no : "${vac.emp_no}",
		vcategory_no :"${vac.vcategory_no}",
		start_date : "${vac.start_date}",
		end_date : "${vac.end_date}",
		status : "${vac.status}",
		totaldays : "${vac.totaldays}"
	}
	
	oldVacList[idx] = Vac;
	idx++;
</c:forEach>

idx = 0;

<c:forEach items="${newVacList}" var="vac">
Vac = {
		vac_no : "${vac.vac_no}",
		emp_no : "${vac.emp_no}",
		vcategory_no :"${vac.vcategory_no}",
		start_date : "${vac.start_date}",
		end_date : "${vac.end_date}",
		status : "${vac.status}",
		totaldays : "${vac.totaldays}"
	}

newVacList[idx] = Vac;
idx++;
</c:forEach>
console.log(newVacList)
console.log(oldVacList)


$(function() {
	let selectedyear = "${selectedYear}";
	
	$('#selectyear option[value = '+selectedyear+']').prop("selected", true);
	
	
})

$('#selectyear').change(function() {
	$('#selectedweekWrap').submit();
})


$('#all-List-0').click(function(){//휴가 예정
	let test;
	$('.vac-menu-content').eq(0).html("");
	 newVacList.forEach((v, index, array) =>{
	 		test = "<tr>";
	 		
	 		
	 		let vca = vcategoryName(v.vcategory_no);
	 		test +=vca
	 		let term = vacationTerm(v.start_date, v.end_date);
	 		
	 		test +="<th class='vac-detail'> "+v.vcategory_no+" | "+term+"</th>";
			test += "<th class='vac-detail'>총 "+v.totaldays+"일</th>";
			
	 		if(v.status == "W"){
	 			test +="<th><span style='background-color: lightgray; padding: 10px; border-radius: 5px;'>승인 대기</span></th>"
	 		}else if(v.status == "A"){
	 			test += "<th><span style='background-color: skyblue; padding: 10px; border-radius: 5px;color: white;'>승인 완료</span></th>"
	 		}else{
	 			test += "<th><th><span style='background-color: red; padding: 10px; border-radius: 5px;color: white;'>승인 거부</span></th>"	
	 		}
			
		//	test += "<th class='vmenustate'><button class='btn btn-primary btn-lg' onclick='selectVacDetail("+v.vac_no+")'>보기</button></th>"
			test +=	"<th class='vmenustate'><button class='btn btn-secondary btn-lg' onclick='deleteVac("+v.vac_no+")'>삭제</button></th>";
			test += "<input type='hidden' name='vac_no' value='"+v.vac_no+"' ></tr>"
	 $('.vac-menu-content').eq(0).append(test);
	 
		});
	
	 console.log(test);
	//console.log($('.vac-menu-content').eq(0).html(test));
	
	
})


function vcategoryName(category) {
	
	let result ;
	
	if(category =="연차"){
		result = "<th width='50px'><i class='fa fa-user icon'></i></th>"
		}else if(category =="조의"){
			result = "<th width='50px'><i class='fa fa-envelope icon'></i></th>"
		}else if(category =="가족돌봄"){
			result = "<th width='50px'><i class='fas fa-user-friends icon' style='font-size: 400%'></i></th>"
		}else if(category =="병가"){
			result = "<th width='50px'><i class='fa fa-bed icon'></i></th>"
		}else if(category =="결혼"){
			result = "<th width='50px'><i class='fa fa-heart icon'></i></th>"
		}else if(category =="기타"){
			result = "<th width='50px'><i class='fa-solid fa-circle-exclamation icon'></i></th>"
		}else if(category =="리플레쉬"){
			result = "<th width='50px'><i class='fa fa-plane icon'></i></th>"
		}else if(category =="바캉스"){
			result = "<th width='50px'><i class='fa-solid fa-sun icon'></i> </th>"
		}
	
	return result;
	
}

function vacationTerm(start_date, end_date) {
	let sDate = new Date(start_date);
	let eDate = new Date(end_date);
	
	let result = sDate.getFullYear()+"년 "+String(sDate.getMonth()+1).padStart(2,'0')+"월 "+String(sDate.getDate()).padStart(2,'0')+"일("+week[sDate.getDay()]+") ~ "
				+eDate.getFullYear()+"년 "+String((eDate.getMonth()+1)).padStart(2,'0')+"월 "+String(eDate.getDate()).padStart(2,'0')+"일("+week[eDate.getDay()]+")";
	return result;
	
}


$('#all-List-1').click(function(){//휴가 사용 내역
	let test;
	 $('.vac-menu-content').eq(1).html("");
	 oldVacList.forEach((v, index, array) =>{
	 		test = "<tr>";
	 		
	 		
	 		let vca = vcategoryName(v.vcategory_no);
	 		test +=vca
	 		let term = vacationTerm(v.start_date, v.end_date);
	 		
	 		test +="<th class='vac-detail'> "+v.vcategory_no+" | "+term+"</th>";
			test += "<th class='vac-detail'>총 "+v.totaldays+"일</th>";
			if(v.status == "W"){
	 			test +="<th><span style='background-color: lightgray; padding: 10px; border-radius: 5px;'>승인 대기</span></th>"
	 		}else if(v.status == "A"){
	 			test += "<th><span style='background-color: skyblue; padding: 10px; border-radius: 5px;color: white;'>승인 완료</span></th>"
	 		}else{
	 			test += "<th><th><span style='background-color: red; padding: 10px; border-radius: 5px;color: white;'>승인 거부</span></th>"	
	 		}
			//test += "<th class='vmenustate'><button class='btn btn-primary btn-lg' onclick='selectVacDetail("+v.vac_no+")'>보기</button></th>"
			test += "<th class='vmenustate'><button class='btn btn-secondary btn-lg' onclick='deleteVac("+v.vac_no+")'>삭제</button></th>";
			test += "<input type='hidden' name='vac_no' value='"+v.vac_no+"' ></tr>"
	 
	 $('.vac-menu-content').eq(1).append(test);
		});
	
	 console.log(test);
//	console.log($('.vac-menu-content').eq(1).html(test));
	
	
})


function deleteVac(num) {
	$('#vacNo').val(num);
	console.log($('#vacNo').val());
	
	alert("정말 삭제하시겠습니까?");
	
	$('#deleteVacForm').submit();
	
}

$(document).on('click', '.vac-menu-content tr', function(){
	let vacNo = $(this).children('input').val();
	console.log(vacNo);




})


</script>


</body>
</html>