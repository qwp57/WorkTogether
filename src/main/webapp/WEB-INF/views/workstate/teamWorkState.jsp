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
#selectweek{
display: inline-block;
width: auto;
}
.section-body{
margin-left: 20px;
margin-right: 20px;
margin-top: 50px;
}
#profileImg{
	width: 90px;
	margin: 20px
}
.pagination{
	justify-content: center;
}
/*#searchwrap{
display: flex;
justify-content: center;
}
#search{
width: auto;
}*/


/**/




</style>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<div class="main-content">
<div style="height: 100px"></div>
	<a href="workState.do"><h2 style="color: gray">내 근무</h2></a>
	<a href="teamWorkState.do"><h2 >구성원 근무</h2></a>
	
	<select class="form-control" id="selectweek">
	    <option>5월 8일 ~ 5월 14일</option>
	    <option>Ketchup</option>
	    <option>Relish</option>
  	</select>
  	
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
                            		<th>총 근무시간</th>
                            		<th></th>
                            		<th></th>
                            		<th></th>
                            		<th></th>
                            		<th></th>
                            		<th></th>
                            		<th></th>
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
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
  

	var currentDay = new Date();  
	var theYear = currentDay.getFullYear();
	var theMonth = currentDay.getMonth();
	var theDate  = currentDay.getDate();
	var theDayOfWeek = currentDay.getDay();
	//console.log(theDayOfWeek);
	let week = new Array('일', '월', '화', '수', '목','금', '토');
	 
	var thisWeek = [];
	 
	for(var i=0; i<7; i++) {
	  var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
	  var mm = Number(resultDay.getMonth()) + 1;
	  var dd = resultDay.getDate();
	  var day = resultDay.getDay();
	 
	  mm = String(mm).length === 1 ? '0' + mm : mm;
	  dd = String(dd).length === 1 ? '0' + dd : dd;
	  
	 $('#thead').children().eq(i+2).text(mm + '월 ' + dd+"일 ("+week[day]+")" );
	  console.log($('#thead').children().eq(i+2).text());
	  
	 
	  thisWeek[i] = mm + '월 ' + dd+"일";
	}
	
	
	 
	//console.log(thisWeek);
	
	
	
	
    </script>
             

</div>


</body>
</html>