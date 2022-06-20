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
margin-top: 50px;
}
#profileImg{
	width: 90px;
	margin: 20px
}
.pagination{
	justify-content: center;
}
#beforeWeek, #afterWeek{
cursor: pointer;

}
.nonvisible{
	display: none;
}

.page-item{
	cursor: pointer;
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
	<span id="beforeWeek">◀</span>
	<select class="form-control" id="selectweek" name = "selectedWeek">
	 
  	</select>
  	<span id="afterWeek">▶</span>
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
                            <c:forEach items="${empList}" var="emp" varStatus="e">
								<tr>
									<td>
									<img alt="image"
                                         src="resources/assets/img/profile/${emp.CHANGE_NAME }"
                                         id="profileImg" class="img-fluid rounded-circle"><span>${emp.NAME} ${emp.JOB_NAME}</span>
									</td>
									<td>
										<p>누적 시간 : ${emp.TOTALTIME}h</p>
									<c:if test="${emp.OVERTIME < 0}">
										<p>초과 시간 : 0 h</p>
									</c:if>
									<c:if test="${emp.OVERTIME >= 0}">
										<p>초과 시간 : ${emp.OVERTIME}h</p>
									</c:if>
										<p>휴일 근무 : ${emp.HOLIDAY}h</p>
									</td>
									<td>${weekList[e.index].SUN}h</td>
                            		<td>${weekList[e.index].MON}h</td>
                            		<td>${weekList[e.index].TUE}h</td>
                            		<td>${weekList[e.index].WED}h</td>
                            		<td>${weekList[e.index].THU}h</td>
                            		<td>${weekList[e.index].FRI}h</td>
                            		<td>${weekList[e.index].SAT}h</td>
								</tr>
							</c:forEach>
                            </tbody>
                        </table>
                   
                    </div>
                    <ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage ne 1 }">
								<li class="page-item" onclick="beforeAfterPage(-1)"><a class="page-link" href="#">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:choose>
							<c:when test="${ pi.currentPage ne p }">
									<li class="page-item" onclick="changePage('${ p }')"><a class="page-link" href="#">${ p }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						
						
						<c:choose>
							<c:when test="${ pi.currentPage ne pi.maxPage }">
								<li class="page-item" onclick="beforeAfterPage(-1)"><a class="page-link" href="#">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
                </div>
            </div>
        </div>
    </div>
   
<script src="/resources/assets/js/teamWorkTime_ws.js?ver=11"></script>
             

</div>
<form action="teamWorkState.do" method="post" id="teamForm">
	<input class="nonvisible" type="text" value="${startday}" name="startday" id="startdayId">
	<input class="nonvisible" type="text" value="${pi.currentPage}" name="currentPage" id="currantPageId">
</form>
<jsp:include page="../common/footer.jsp"/>

</body>
</html>