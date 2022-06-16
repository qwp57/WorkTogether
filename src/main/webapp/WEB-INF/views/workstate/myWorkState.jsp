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
#selectweek{
display: inline-block;
width: auto;
}
.section-body{
margin-left: 20px;
margin-right: 20px;
margin-top: 0px;
}

.workTable{
padding-top: 3%;
}
.timelineTable{
width: 100%;
}
td{
border: 1px solid lightgray;
}
.TLtablecss{
width: 50px;
text-align: center;
background-color: #EAEAEA;
height: 20px;
}
.DT{
width: 100px;
text-align: center;
}
.workTime{
background-color: green;
}
.workTimeinHoliday{
background-color: red;
}
#beforeWeek, #afterWeek{
cursor: pointer;

}



</style>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<div class="main-content">
<div style="height: 100px"></div>
	<a href="workStateMain.do"><h2>내 근무</h2></a>
	<a href="teamWorkState.do"><h2 style="color: gray">구성원 근무</h2></a>
	<span id="beforeWeek">◀</span>
	<select class="form-control" id="selectweek" name = "selectedWeek">
	 
  	</select>
  	<span id="afterWeek">▶</span>
	<script type="text/javascript">

	var currentDay = new Date();  
	var theYear = currentDay.getFullYear();
	var theMonth = currentDay.getMonth();
	var theDate  = currentDay.getDate();
	var theDayOfWeek = currentDay.getDay();
	//console.log(theDayOfWeek);
	 
	var thisWeek = [];
	 
	for(var i=0; i<7; i++) {
	  var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
	  var yyyy = resultDay.getFullYear();
	  var mm = Number(resultDay.getMonth()) + 1;
	  var dd = resultDay.getDate();
	 
	  mm = String(mm).length === 1 ? '0' + mm : mm;
	  dd = String(dd).length === 1 ? '0' + dd : dd;
	 
	  thisWeek[i] = yyyy + '-' + mm + '-' + dd;
	
	}
	 
	//console.log(thisWeek);
	
	
	
	</script>
  	
	<hr>
	  <div class="section-body">
                <h2 class="section-title" style="text-align: left;"> </h2>
                <div class="row mt-sm-4 body-1">
                    <div class="col-12 col-md-10 col-lg-3">
                        <div class="card h-100">
                            <div class="card-body ">
                                <div class="owl-carousel owl-theme" id="users-carousel">
                                    <div>
                                        <div class="user-item">
                                            <img style="height: 100px" alt="image"
                                                 src="resources/assets/img/avatar/avatar-1.png"
                                                 id="profileImg" class="img-fluid">
                                            <div class="user-details">
                                                <div class="user-name"><h3>${loginEmp.name}</h3></div>
                                                <div class="text-job text-muted"><h6>${loginEmp.job_code}</h6></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                        <div class="col-12 col-md-10 col-lg-9">
                        <div class="card h-100">
                            <div class="card-body text-center h-100">
                            	<div class="workTable">
	                                <table class="table table-bordered " >
	                                	<thead class="thead-dark">
		                                	<tr>
		                                		<th>주</th>
		                                		<th>누적 시간</th>
		                                		<th>잔여 시간</th>
		                                		<th>초과 시간</th>
		                                		<th>기준시간</th>
		                                		<th>휴일근무</th>
		                                	</tr>
	                                	</thead>
	                                	<tbody>
		                                	<tr class="workTotalTime">
		                                		<td></td>
		                                		<td>${weekWork["TOTALTIME"]}</td>
		                                		<c:choose>
		                                			<c:when test="${weekWork['LEFTTIME'] >= 0}">
		                                				<td>${weekWork["LEFTTIME"]}</td>
		                                			</c:when>
		                                			<c:otherwise>
		                                				<td>0</td>
		                                			</c:otherwise>
		                                		</c:choose>
		                                		<c:choose>
			                                		<c:when test="${weekWork['OVERTIME'] > 0 }">
			                                			<td>${weekWork["OVERTIME"]}</td>
			                                		</c:when>
			                                		<c:otherwise>
			                                			<td>0</td>
			                                		</c:otherwise>
			                                	</c:choose>
		                                		<td>52시간</td>
		                                		<td>${weekWork["HOLIDAY"]}</td>
		                                	</tr>
	                                	</tbody>
	                                </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <div class="section-body">
                <h2 class="section-title" style="text-align: left;"> </h2>
                <div class="row mt-sm-4 body-1">
                    <div class="col-12 col-md-10 col-lg-12">
                        <div class="card h-100">
                            <div class="card-body ">
                            	<div class="timeline">
                            		<table class="timelineTable">
	                                	<thead>
		                                	<tr>
		                                		<th class="TLtablecss DT">날짜</th>
		                                		<th class="TLtablecss">1</th>
		                                		<th class="TLtablecss">2</th>
		                                		<th class="TLtablecss">3</th>
		                                		<th class="TLtablecss">4</th>
		                                		<th class="TLtablecss">5</th>
		                                		<th class="TLtablecss">6</th>
		                                		<th class="TLtablecss">7</th>
		                                		<th class="TLtablecss">8</th>
		                                		<th class="TLtablecss">9</th>
		                                		<th class="TLtablecss">10</th>
		                                		<th class="TLtablecss">11</th>
		                                		<th class="TLtablecss">12</th>
		                                		<th class="TLtablecss">13</th>
		                                		<th class="TLtablecss">14</th>
		                                		<th class="TLtablecss">15</th>
		                                		<th class="TLtablecss">16</th>
		                                		<th class="TLtablecss">17</th>
		                                		<th class="TLtablecss">18</th>
		                                		<th class="TLtablecss">19</th>
		                                		<th class="TLtablecss">20</th>
		                                		<th class="TLtablecss">21</th>
		                                		<th class="TLtablecss">22</th>
		                                		<th class="TLtablecss">23</th>
		                                		<th class="TLtablecss">24</th>
		                                		<th class="TLtablecss DT">총 근무시간</th>
		                                	</tr>
	                                	</thead>
	                                	<tbody id = "timelineTableData">
		                                	
	                                	</tbody>
	                                </table>
                            	</div>
                            	
                            </div>
                         </div>
                     </div>
                  </div>
              </div>
</div>
<script src="/resources/assets/js/myWork_ws.js?ver=1"></script>
<script type="text/javascript">

	let timesum = [];
	let workday = new Array();
	let startTime = new Array();
	let holiday = new Array();

$(function() {
	

	<c:forEach items="${workTime}" var="item" varStatus = "status">
		timesum[${status.index}]=${item['TIMESUM']}; 
		wd = "${item['WORKDAY']}";
		wdidx = wd.indexOf("/");
		workday[${status.index}] = wd.substring(0, wdidx);
		startTime[${status.index}] = Number(wd.substring(wdidx+1));
		
	</c:forEach>
	<c:forEach items="${holiday}" var="item" varStatus = "status">
		var hday = "${item}";
		holiday[${status.index}] = hday.substring(4,6)+"."+hday.substring(6);
	</c:forEach>
	

	console.log(workday);
	console.log(startTime);
	console.log(timesum);
	console.log(holiday);
	
	
	timecolor(workday, startTime, timesum, holiday);
	
	
})


function timecolor(workday, startTime, timesum, holiday){

	for(let j = 0; j<workday.length; j++){
		let a = holiday[j]; 
		for(let i = 1; i<=7; i++){
		let day = $('#timelineTableData tr:nth-child('+i+') td:nth-child(1)').text();
			
			if(a.includes(day) && a.includes(workday[i-1])){
				console.log("휴일이다")
				green(i, startTime[j], timesum[j]);
				
			}else if(day == workday[j]){
				console.log("평일이다")
				red(i, startTime[j], timesum[j]);
				
			}
			
		}
	}
	
}


function green(i, startTime, timesum) {
	
	for(let k = 1; k<=timesum; k++){
		 $('#timelineTableData tr:nth-child('+i+') td:nth-child('+(startTime+k)+')').addClass("workTimeinHoliday");
		 $('#timelineTableData tr:nth-child('+i+') td:last').text(timesum);
		}
	
	
}

function red(i, startTime, timesum) {
	for(let k = 1; k<=timesum; k++){
		 $('#timelineTableData tr:nth-child('+i+') td:nth-child('+(startTime+k)+')').addClass("workTime");
		 $('#timelineTableData tr:nth-child('+i+') td:last').text(timesum);
		}
	
	
}



</script>


</body>
</html>