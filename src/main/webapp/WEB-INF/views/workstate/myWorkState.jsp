<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h1{
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
margin-top: 50px;
}

.workTable{
padding-top: 90px;
}

.table{
font-size: 20px;
}


</style>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<div class="main-content">
<div style="height: 100px"></div>
	<h1>내 근무</h1>
	<h1 style="color: gray">구성원 근무</h1>
	
	<select class="form-control" id="selectweek">
	    <option>5월 8일 ~ 5월 14일</option>
	    <option>Ketchup</option>
	    <option>Relish</option>
  	</select>
  	
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
                                            <img style="height: 200px" alt="image"
                                                 src="resources/assets/img/avatar/avatar-1.png"
                                                 id="profileImg" class="img-fluid">
                                            <div class="user-details">
                                                <div class="user-name"><h2>홍길동 대리</h2></div>
                                                <div class="text-job text-muted"><h6>인사부 소속</h6></div>
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
		                                		<th>누적</th>
		                                		<th>잔여</th>
		                                		<th>초과</th>
		                                		<th>기준시간</th>
		                                		<th>휴일근무</th>
		                                	</tr>
	                                	</thead>
	                                	<tbody>
		                                	<tr>
		                                		<td>2</td>
		                                		<td></td>
		                                		<td></td>
		                                		<td></td>
		                                		<td></td>
		                                		<td></td>
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
                            	<div class="timeline table-responsive">
                            		<table class="table table-bordered " >
	                                	<thead class="thead-dark">
		                                	<tr>
		                                		<th>날짜</th>
		                                		<th>1</th>
		                                		<th>2</th>
		                                		<th>3</th>
		                                		<th>4</th>
		                                		<th>5</th>
		                                		<th>6</th>
		                                		<th>7</th>
		                                		<th>8</th>
		                                		<th>9</th>
		                                		<th>10</th>
		                                		<th>11</th>
		                                		<th>12</th>
		                                		<th>13</th>
		                                		<th>14</th>
		                                		<th>15</th>
		                                		<th>16</th>
		                                		<th>17</th>
		                                		<th>18</th>
		                                		<th>19</th>
		                                		<th>20</th>
		                                		<th>21</th>
		                                		<th>22</th>
		                                		<th>23</th>
		                                		<th>24</th>
		                                		<th>총 근무시간</th>
		                                	</tr>
	                                	</thead>
	                                	<tbody>
		                                	<tr>
		                                		<td>2</td>
		                                		<td></td>
		                                		<td></td>
		                                		<td></td>
		                                		<td></td>
		                                		<td></td>
		                                	</tr>
	                                	</tbody>
	                                </table>
                            	</div>
                            	
                            </div>
                         </div>
                     </div>
                  </div>
              </div>

</div>


</body>
</html>