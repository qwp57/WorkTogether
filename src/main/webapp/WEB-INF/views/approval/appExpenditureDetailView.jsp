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
	
	#expenditure{
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
				<span><h3>지출 결의서</h3></span> 
			</div>
			<div class="float-right">
				<!-- <button type="button" class="btn btn-primary" onclick="location.href='/updateFormQna.do?qno=<=q.getQnaNo()%>'">수정</button> -->
				<button type="button" class="btn btn-primary" onclick="location.href='approvalDocument.do'">승인</button>
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#rejectModal">반려</button>
			</div>	
			<section class="section-body mt-5">
				<div id="expenditure">
					<div><h2 class="text-center pt-3">지출 결의서</h2></div>							
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
							<td>10년</td>
							<th>긴급여부</th>
							<td>긴급하지 않음</td>									
						</tr>
						<tr>
							<th>수신참조</th>
							<td colspan="5" name="referee">김대리</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="5">2022-05-20 법인카드 사용</td>
						</tr>							
					</table>	
					<table class="table table-bordered mt-3">
						<tr>
							<th style="width: 15%">구분</th>
							<td>
								<div class="form-check-inline">
									<label class="form-check-label">
										<input type="radio" class="form-check-input" name="divison">개인
									</label>
								</div>
								<div class="form-check-inline">
									<label class="form-check-label">
										<input type="radio" class="form-check-input" name="divison">법인
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<th>회계 기준월</th>
							<td>2022-06-01</td>
						</tr>
						<tr>
							<th>지출자</th>
							<td>배대리</td>
						</tr>
						<tr>
							<th>계좌 정보</th>
							<td>우리은행 1002-111-2222</td>
						</tr>
						<tr>
							<th>지출 사유</th>
							<td>회의</td>
						</tr>
					</table>	
					
					<h6>지출 내역</h6>	
					<table class="table table-bordered mt-3 text-center">
						<thead>
							<tr>
								<th style="width:20%">지출 일자</th>
								<th style="width:20%">분류</th>
								<th style="width:20%">금액</th>
								<th style="width:20%">사용 내역</th>
								<th style="width:20%">비고</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2022-05-03</td>
								<td>물품구입비</td>
								<td>10000원</td>
								<td>회의 자료 구입</td>
								<td></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5">합계 : 
									<span name="sum">10000원</span>
								</td>									
							</tr>
						</tfoot>
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
	
	<!-- 반려 모달창 -->
	<div class="modal" id="rejectModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- modal header -->
				<div class="modal-header">
					<h4 class="modal-title text-left" style="color:black">결재 반려</h4> 
				</div>
				
				<!-- modal body -->
				<form method="">
					<div class="modal-body">
						<div class="mt-2">
							<form class="form-group">
								<label for="comment"><h6>반려 사유</h6></label>
								<textarea class="form-control" rows="10" id="comment" style="resize:none; height:300px;"></textarea>
							</form>
						</div>
					</div>
					
					<!-- modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">반려</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
<jsp:include page="../common/footer.jsp"/>
</body>
</html>