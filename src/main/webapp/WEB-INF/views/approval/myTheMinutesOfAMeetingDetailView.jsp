<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2, h3, h4, h5, h6{
		color: black;
	}
	
	.bi-clipboard2-check-fill{
		font-size: 25px;
		margin-right: 10px;
	}
	
	#theMinutesOfAMeeting{
		background-color: white;
		margin-top: 30px;
		border: 3px solid lightgray;
		padding: 20px;
	}
	
	#approvalLine1{
		width: 17%;		
	}
	
	#approvalLine2{
		width: 17%;		
	}
	
	#file{
		background-color: lightgray;
		padding: 10px;
	}
	
</style>
</head>
<body>
	<div class="main-content">
	<div style="height: 50px"></div>
		<div class="container">
			<div class="title mt-5 row">
				<span><i class="bi bi-clipboard2-check-fill"></i></span>
				<span><h3>회의록</h3></span> 
			</div>
			<div class="float-right">
				<!-- <button type="button" class="btn btn-primary" onclick="location.href='/updateFormQna.do?qno=<=q.getQnaNo()%>'">수정</button> -->
				<button type="button" class="btn btn-primary" onclick="location.href='updateMyTheMinutesOfAMeeting.do'">수정</button>
				<button type="button" class="btn btn-danger" onclick="location.href='deleteMyTheMinutesOfAMeeting.do'">삭제</button>
			</div>	
			<section class="section-body mt-5">
				<div id="theMinutesOfAMeeting">
					<div><h2 class="text-center pt-3">회의록</h2></div>													
					<table class="table table-bordered float-right" id="approvalLine1">
						<tr>
							<th rowspan="2" style="width:10px">결재선</th>
							<td style="height:15px">대표이사</td>
						</tr>
						<tr>
							<td>김대표</td>								
						</tr>
					</table>
					<table class="table table-bordered float-right" id="approvalLine2">
						<tr>
							<th rowspan="2" style="width:10%">결재선</th>
							<td style="height:15px">대표이사</td>
						</tr>
						<tr>
							<td>김대표</td>								
						</tr>
					</table>
					<table class="table table-bordered mt-3">							
						<tr>
							<th style="width: 15%">기안부서</th>
							<td>인사팀</td>
							<th style="width: 15%">기안일</th>
							<td>2022-06-13</td>
							<th style="width: 15%">문서번호</th>
							<td></td>
						</tr>
						<tr>
							<th>기안자</th>
							<td>홍사원</td>
							<th>보존년한</th>
							<td>15년</td>
							<th>긴급여부</th>
							<td>긴급</tr>
						<tr>
							<th>수신참조</th>
							<td colspan="5">김대리</td>
						</tr>										
					</table>
					
					<table class="table table-bordered mt-3">
						<tr>
							<th style="width: 15%">참석자</th>
							<td>김대표, 최부사장, 이차장</td>
						</tr>
						<tr>
							<th>회의 목적</th>
							<td>프로젝트 일정 조회</td>
						</tr>
						<tr>
							<th>회의 일자</th>
							<td>2022-05-01</td>
						</tr>
					</table>
					
					<table class="table table-bordered">
						<tr>
							<th style="width:15%">제목</th>
							<td>2022-05-01 회의록</td>
						</tr>
						<tr>
							<td colspan="2" style="height: 500px">사업 목적 : 그룹웨어를 구매함으로써 불필요한 이동을 줄이고 업무 효율성을 높인다.</td>
						</tr>
					</table>	
				</div>
				<div>
					<div class="mt-5" id="file" style="font-size:15px">
						<i class="bi bi-paperclip"></i>
						<strong>첨부파일</strong>
					</div>
					<div class="mt-3 ml-4" id="fileArea">
						<div>project.jpg</div>									
					</div>
				</div>					
				<div class="float-right mt-3">						
					<button type="button" class="btn btn-primary" onclick="location.href='draftDocument.do'">목록</button>
				</div>	
			</section>
		</div>
	</div>
	
	
<jsp:include page="../common/footer.jsp"/>
</body>
</html>