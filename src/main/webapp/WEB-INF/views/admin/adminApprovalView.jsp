<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.title{
		color: black;
	}
	
	.status{
		font-size: 15px;
	}
	
	.table{
		width: 100%;
		border-top: 1px solid lightgray;
    	border-collapse: collapse;
	}
	
	table>tbody>tr>td,th{
		border-bottom: 1px solid lightgray;
   	 	padding: 10px;
   	 	color: black;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidebar.jsp"/>
	
	<div class="main-content">
		<div style="height: 50px"></div>
		<div class="container">		
			<div class="title mt-5">
				<h3>가입 승인</h3>
			</div>			
			<div class="row">
				<div class="status ml-4 mt-3">
					<span id="all"><a href="#">전체</a></span>
					<span class="ml-2" id="waiting"><a href="#">승인 대기</a></span>
					<span class="ml-2" id="completion"><a href="#">승인 완료</a></span>
					<span class="ml-2" id="rejection"><a href="#">승인 거부</a></span>
				</div>
			</div>
			<table class="table table-hover thead-light mt-3">
				<thead>
					<tr>
						<th style="width:13%">입사일</th>
						<th style="width:10%">이름</th>
						<th style="width:10%">아이디</th>
						<th style="width:10%">비밀번호</th>
						<th style="width:18%">이메일</th>
						<th style="width:15%">휴대폰번호</th>
						<th style="width:13%">생년월일</th>
						<th style="width:10%">상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2022-05-29</td>
						<td>이사원</td>
						<td>lee123</td>
						<td>lee123</td>
						<td>lee123@WT.com</td>
						<td>010-1111-2222</td>
						<td>1996-09-11</td>
						<td>승인 대기</td>
					</tr>
					
					<tr>
						<td>2022-05-29</td>
						<td>김사원</td>
						<td>kim123</td>
						<td>kim123</td>
						<td>kim123@WT.com</td>
						<td>010-1212-1212</td>
						<td>1996-09-11</td>
						<td>승인 대기</td>
					</tr>
					
					<tr>
						<td>2022-05-29</td>
						<td>최사원</td>
						<td>choi123</td>
						<td>choi123</td>
						<td>choi123@WT.com</td>
						<td>010-3333-4444</td>
						<td>1996-09-11</td>
						<td>승인 대기</td>
					</tr>
					
					<tr>
						<td>2022-05-28</td>
						<td>권사원</td>
						<td>kwon124</td>
						<td>kwon124</td>
						<td>kwon124@WT.com</td>
						<td>010-5555-6666</td>
						<td>1996-09-11</td>
						<td>승인 대기</td>
					</tr>
					
					<tr>
						<td>2022-05-28</td>
						<td>박사원</td>
						<td>back123</td>
						<td>back123</td>
						<td>back123@WT.com</td>
						<td>010-7777-8888</td>
						<td>1996-09-11</td>
						<td>승인 거부</td>
					</tr>
					
					<tr>
						<td>2022-05-28</td>
						<td>양사원</td>
						<td>yang123</td>
						<td>yang123</td>
						<td>yang123@WT.com</td>
						<td>010-9999-1010</td>
						<td>1996-09-11</td>
						<td>승인 완료</td>
					</tr>
					
					<tr>
						<td>2022-05-27</td>
						<td>심사원</td>
						<td>sim123</td>
						<td>sim123</td>
						<td>sim123@WT.com</td>
						<td>010-3434-5656</td>
						<td>1996-09-11</td>
						<td>승인 완료</td>
					</tr>
					
					<tr>
						<td>2022-05-27</td>
						<td>백사원</td>
						<td>baeck123</td>
						<td>baeck123</td>
						<td>baeck123@WT.com</td>
						<td>010-6767-8989</td>
						<td>1996-09-11</td>
						<td>승인 완료</td>
					</tr>
					
					<tr>
						<td>2022-05-27</td>
						<td>강사원</td>
						<td>kang123</td>
						<td>kang123</td>
						<td>kang123@WT.com</td>
						<td>010-3434-7878</td>
						<td>1996-09-11</td>
						<td>승인 거부</td>
					</tr>
					
					<tr>
						<td>2022-05-27</td>
						<td>홍사원</td>
						<td>hong123</td>
						<td>hong123</td>
						<td>hong123@WT.com</td>
						<td>010-9999-4567</td>
						<td>1996-09-11</td>
						<td>승인 완료</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		
	</div>
	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>