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
.sorttmenu{
display: inline-block;
height: 35px;
width : 100px;
margin : 10px;
float: right;
border: 1px solid lightgray;
border-radius: 5px;
}
</style>
<body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/sidebar.jsp" />
<div class="main-content">
	<section class="section">
	<div style="height: 100px"></div>
		<h2>통계</h2>
		<div class="section-body">
		<div class="row">
			<select class="sorttmenu offset-lg-11" id="selectMonth">
			</select>
		</div>	
		<hr>
			<div class="row">
				<div class="col-12 col-lg-6">
					<h5>월별 근무왕</h5>
					<table class="table text-center">
						<thead class="thead">
							<tr>
								<th>부서명</th>
								<th>사원이름</th>
							</tr>
						</thead>
						<tbody class="tbody" id="monthBestEmp">
							<c:forEach items="${empOfTheMonthList}" var="i">
								<tr>
								<th>${i.dept_name}</th>
								<th>${i.name} ${i.job_name}님</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-12 col-lg-6">
					<h5>월별 부서별 전체 & 평균 근무시간</h5>
					<table class="table text-center">
						<thead class="thead">
							<tr>
								<th>부서명</th>
								<th>전체 근무 시간</th>
								<th>평균 근무 시간</th>
							</tr>
						</thead>
						<tbody class="tbody" id="monthDept">
							<c:forEach items="${statsOfTheMonthList}" var="i">
								<tr>
									<th>${i.DEPT_NAME}</th>
									<th>${i.SUM} HOUR</th>
									<th>${i.AVG} HOUR</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="section-body">
		<div class="row">
			<select class="sorttmenu offset-lg-11" id="selectYear">
			
			
			</select>
		</div>		
			<hr>
			<div class="row">
				<div class="col-12 col-lg-6">
					<h5>연도별  근무왕</h5>
					<table class="table text-center">
						<thead class="thead">
							<tr>
								<th>부서명</th>
								<th>사원이름</th>
							</tr>
						</thead>
						<tbody class="tbody" id="yearBestEmp">
							<c:forEach items="${empOfTheYearList}" var="i">
							<tr>
								<th>${i.dept_name}</th>
								<th>${i.name} ${i.job_name}님</th>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-12 col-lg-6">
					<h5>연도별 부서별 전체 & 평균 근무시간</h5>
					<table class="table text-center">
						<thead class="thead">
							<tr>
								<th>부서명</th>
								<th>전체 근무 시간</th>
								<th>평균 근무 시간</th>
							</tr>
						</thead>
						<tbody class="tbody" id="yearDept">
							<c:forEach items="${statsOfTheYearList}" var="i">
							<tr>
								<th>${i.DEPT_NAME}</th>
								<th>${i.SUM} HOUR</th>
								<th>${i.AVG} HOUR</th>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
</div>
<script src="/resources/assets/js/Statistics_ws.js?ver=4"></script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>