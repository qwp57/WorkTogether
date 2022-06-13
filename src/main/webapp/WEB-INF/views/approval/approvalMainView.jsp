<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2, h3, h4, h5{
		color: black;
	}
	
	.section-body{
		margin-bottom: 30px;
		margin-top: 30px;
	}
	
	.card{
		width: 300px;
		height: 300px;
	}
	
	.card-deck>.card{
		border-radius: 25px;
	}
	
	.card-body{
		margin-top: 70px;
	}
	
	#newApprovalCount{
		border-bottom: 1px solid lightgray;
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
				<h3>전자결재 홈</h3>
			</div>	
			
			<div class="section-body row">
				<div class="title mt-4 mb-3 col-lg-8">
					<h4 class="ml-3">기안 현황</h4>
				</div>
				<div class="title mt-4 mb-3 col-lg-4">
					<h4>결재문서 현황</h4>
				</div>				
				<div>
					<div class="card-deck">
						<div class="card mt-3 ml-5">
							<div class="card-body text-center">
								<p class="card-text"><h2 style="color: rgb(111, 118, 237)">결재 대기</h2></p>
								<p class="card-text"><h2>3</h2></p>
							</div>
						</div>
						
						<div class="card mt-3 ml-5">
							<div class="card-body text-center">
								<p class="card-text"><h2 style="color: rgb(111, 118, 237)">결재 완료</h2></p>
								<p class="card-text"><h2>5</h2></p>
							</div>
						</div>
						
						<div class="card mt-3 ml-5">
							<div class="card-body text-center">
								<p class="card-text"><h2 style="color: rgb(111, 118, 237)">새 결재 문서</h2></p>
								<p class="card-text"><h2 class="pb-2" id="newApprovalCount">2</h2></p>
								<a href="#"><h5>결재하기</h5></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="section-body">
				<div class="title mt-5 mb-3">
					<h4 class="ml-3">기안 문서</h4>
				</div>
				<!-- 인기글 5개를 보여주는 것 처럼 ajax로 최신 게시글 5개를 보여준다. -->
				<table class="table" id="draftDocumentTable">
					<thead>
						<tr>
							<th style="width:12%">기안일</th>
							<th style="width:12%">완료일</th>
							<th style="width:12%">결재양식</th>
							<th style="width:7%">긴급</th>
							<th style="width:26%">제목</th>
							<th style="width:7%">첨부</th>
							<th style="width:12%">문서번호</th>
							<th style="width:10%">결재상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<!-- <td class="empNo">사번</td>을 숨겨놓는다. -->
							<td>2022-05-28</td>
							<td>-</td>
							<td>일반 품의서</td>
							<td>-</td>
							<td>기안서- 업무 협조</td>
							<td>-</td>
							<td>2022_00020</td>
							<td><span class="status">결재 대기</span></td>
						</tr>
						
						<tr>
							<td>2022-05-28</td>
							<td>-</td>
							<td>일반 품의서</td>
							<td>-</td>
							<td>기안서- 업무 협조</td>
							<td>-</td>
							<td>2022_00019</td>
							<td><span class="status">결재 대기</span></td>
						</tr>
						
						<tr>
							<td>2022-05-25</td>
							<td>-</td>
							<td>일반 품의서</td>
							<td>-</td>
							<td>기안서- 업무 협조</td>
							<td>-</td>
							<td>2022_00018</td>
							<td><span class="status">진행중</span></td>
						</tr>
						
						<tr>
							<td>2022-05-22</td>
							<td>2022-05-24</td>
							<td>지출 결의서</td>
							<!-- if를 사용해서 만약 긴급 상태이면 긴급이라는 글자가 빨간색으로 나오도록 아니면 '-'이 나오도록 하낟. -->
							<td style="color:red">긴급</td>
							<td>2022-05-20 법인카드 사용</td>
							<!-- 첨부 파일이 있으면 클립 아이콘과 함께 첨부파일 개수가 나온다.(if 사용) -->
							<td>
								<i class="bi bi-paperclip"></i>1
							</td>
							<td>2022_00017</td>
							<td><span class="status">완료</span></td>
						</tr>
						
						<tr>
							<td>2022-05-18</td>
							<td>2022-05-20</td>
							<td>회의록</td>
							<td>-</td>
							<td>2022-05-01 회의록</td>
							<td>-</td>
							<td>2022_00016</td>
							<td><span class="status">완료</span></td>
						</tr>										
					</tbody>
				</table>
			</div>	
			
			<section class="section-body">
				<div class="title mt-5 mb-3">
					<h4 class="ml-3">결재 문서</h4>
				</div>
				<!-- 인기글 5개를 보여주는 것 처럼 ajax로 최신 게시글 5개를 보여준다. -->
				<table class="table" id="approvalDocumentTable">
					<thead>
						<tr>
							<th style="width:12%">기안일</th>
							<th style="width:12%">완료일</th>
							<th style="width:12%">결재양식</th>
							<th style="width:8%">긴급</th>
							<th style="width:18%">제목</th>
							<th style="width:9%">기안자</th>
							<th style="width:8%">첨부</th>
							<th style="width:10%">문서번호</th>
							<th style="width:10%">결재상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2022-05-28</td>
							<td>-</td>
							<td>일반 품의서</td>
							<td>-</td>
							<td>기안서- 업무 협조</td>
							<td>배주임</td>
							<td>-</td>
							<td>2022_00020</td>
							<td><span class="status">결재 대기</span></td>
						</tr>
						
						<tr>
							<td>2022-05-28</td>
							<td>-</td>
							<td>일반 품의서</td>
							<td>-</td>
							<td>기안서- 업무 협조</td>
							<td>강사원</td>
							<td>-</td>
							<td>2022_00019</td>
							<td><span class="status">결재 대기</span></td>
						</tr>
						
						<tr>
							<td>2022-05-25</td>
							<td>-</td>
							<td>일반 품의서</td>
							<td>-</td>
							<td>기안서- 업무 협조</td>
							<td>안대리</td>
							<td>-</td>
							<td>2022_00018</td>
							<td><span class="status">진행중</span></td>
						</tr>
						
						<tr>
							<td>2022-05-22</td>
							<td>2022-05-24</td>
							<td>지출 결의서</td>
							<!-- if를 사용해서 만약 긴급 상태이면 긴급이라는 글자가 빨간색으로 나오도록 아니면 '-'이 나오도록 하낟. -->
							<td style="color:red">긴급</td>
							<td>2022-05-20 법인카드 사용</td>
							<td>이부장</td>
							<!-- 첨부 파일이 있으면 클립 아이콘과 함께 첨부파일 개수가 나온다.(if 사용) -->
							<td>
								<i class="bi bi-paperclip"></i>1
							</td>
							<td>2022_00017</td>
							<td><span class="status">완료</span></td>
						</tr>
						
						<tr>
							<td>2022-05-18</td>
							<td>2022-05-20</td>
							<td>회의록</td>
							<td>-</td>
							<td>2022-05-01 회의록</td>
							<td>배주임</td>
							<td>-</td>
							<td>2022_00016</td>
							<td><span class="status">완료</span></td>
						</tr>										
					</tbody>
				</table>
			</section>
		</div>		
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>