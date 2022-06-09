<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<select class="sorttmenu offset-lg-11" id="selectsort_2">
			   <option>2022년 5월</option>
			   <option>2022년 5월</option>
			   <option>상태</option>
			</select>
		</div>	
		<hr>
			<div class="row">
				<div class="col-12 col-lg-6">
					<h5>이번 달 근무왕</h5>
					<table class="table text-center">
						<thead class="thead">
							<tr>
								<th>부서명</th>
								<th>사원이름</th>
							</tr>
						</thead>
						<tbody class="tbody">
							<tr>
								<td>인사부</td>
								<td>홍길동 대리</td>
							</tr>
							<tr>
								<td>영업부</td>
								<td>남우재 대리</td>
							</tr>
							<tr>
								<td>회계부</td>
								<td>유재석 대리</td>
							</tr>
							<tr>
								<td>자재관리부</td>
								<td>방명수 대리</td>
							</tr>
							<tr>
								<td>홍보부</td>
								<td>하하하 대리</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-12 col-lg-6">
					<h5>이번 달 근무왕</h5>
					<table class="table text-center">
						<thead class="thead">
							<tr>
								<th>부서명</th>
								<th>사원이름</th>
							</tr>
						</thead>
						<tbody class="tbody">
							<tr>
								<td>인사부</td>
								<td>홍길동 대리</td>
							</tr>
							<tr>
								<td>영업부</td>
								<td>남우재 대리</td>
							</tr>
							<tr>
								<td>회계부</td>
								<td>유재석 대리</td>
							</tr>
							<tr>
								<td>자재관리부</td>
								<td>방명수 대리</td>
							</tr>
							<tr>
								<td>홍보부</td>
								<td>하하하 대리</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="section-body">
		<div class="row">
			<select class="sorttmenu offset-lg-11" id="selectsort_2">
			   <option>2022년</option>
			   <option>기한</option>
			   <option>상태</option>
			</select>
		</div>		
			<hr>
			<div class="row">
				<div class="col-12 col-lg-6">
					<h5>이번 달 근무왕</h5>
					<table class="table text-center">
						<thead class="thead">
							<tr>
								<th>부서명</th>
								<th>사원이름</th>
							</tr>
						</thead>
						<tbody class="tbody">
							<tr>
								<td>인사부</td>
								<td>홍길동 대리</td>
							</tr>
							<tr>
								<td>영업부</td>
								<td>남우재 대리</td>
							</tr>
							<tr>
								<td>회계부</td>
								<td>유재석 대리</td>
							</tr>
							<tr>
								<td>자재관리부</td>
								<td>방명수 대리</td>
							</tr>
							<tr>
								<td>홍보부</td>
								<td>하하하 대리</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-12 col-lg-6">
					<h5>이번 달 근무왕</h5>
					<table class="table text-center">
						<thead class="thead">
							<tr>
								<th>부서명</th>
								<th>사원이름</th>
							</tr>
						</thead>
						<tbody class="tbody">
							<tr>
								<td>인사부</td>
								<td>홍길동 대리</td>
							</tr>
							<tr>
								<td>영업부</td>
								<td>남우재 대리</td>
							</tr>
							<tr>
								<td>회계부</td>
								<td>유재석 대리</td>
							</tr>
							<tr>
								<td>자재관리부</td>
								<td>방명수 대리</td>
							</tr>
							<tr>
								<td>홍보부</td>
								<td>하하하 대리</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
</div>

</body>
</html>