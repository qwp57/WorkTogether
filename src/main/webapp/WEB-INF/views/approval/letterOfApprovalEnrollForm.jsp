<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	
	#letterOfApproval{
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
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidebar.jsp"/>
	
	<div class="main-content">
	<div style="height: 50px"></div>
		<div class="container">
			<div class="title mt-5 row">
				<span><i class="bi bi-clipboard2-check-fill"></i></span>
				<span><h3>일반 품의서</h3></span> 
			</div>	
			<section class="section-body">
				<div id="letterOfApproval">
					<div><h2 class="text-center pt-3">품의서</h2></div>
					<form id="letterOfApprovalForm" method="">						
						<button type="button" class="btn btn-primary float-right mr-3" data-toggle="modal" data-target="#approvalLineModal">결재선 선택</button> <br><br><br>
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
							<thead>
								
							</thead>
							<tbody>
								<tr>
									<th style="width: 15%">기안부서</th>
									<td name="appDept">인사팀</td>
									<th style="width: 15%">기안일</th>
									<td name="appCreateDate">2022-06-13</td>
									<th style="width: 15%">문서번호</th>
									<td></td>
								</tr>
								<tr>
									<th>기안자</th>
									<td name="appEmployee">홍사원</td>
									<th>보존년한</th>
									<td>
										<div class="input-group mt-3 mb-3">
						    				<div class="input-group-prepend">
						    					<select class="form-control rounded-1" id="retentionPeriod" name="retentionPeriod">
													<option ${(param.retentionPeriod == "") ? "selected" : "" } value="">5년</option>
													<option ${(param.retentionPeriod == "") ? "selected" : "" } value="">10년</option>	
													<option ${(param.retentionPeriod == "") ? "selected" : "" } value="">15년</option>										
												</select>
						    				</div>
						    			</div>
				    				</td>
									<th>긴급여부</th>
									<td>
										<div class="form-check mt-3 mb-3">
											<label class="form-check-label">
												 <input type="checkbox" class="form-check-input" value="">긴급
											</label>
						    			</div>
									</td>									
								</tr>
								<tr>
									<th>수신참조</th>
									<td colspan="5" name="referee">김대리</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="5">
										<input type="text" class="form-control" id="appTitle" name="appTitle">
									</td>
								</tr>
							</tbody>
						</table>						
						<div class="" id="summernote"></div>				
					</form>
				</div>
			</section>
		</div>
	</div>
	
	<!-- 결재선 선택 모달창 -->
	<div class="modal" id="approvalLineModal" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- modal header -->
				<div class="modal-header">
					<div class="modal-header">
	   					<h4 class="modal-title text-left" style="color:black">결재선 설정</h4>     				   				
	   				</div>
				</div>
				
				<!-- modal body -->
				<div class="modal-body">
					<form>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<button class="btn btn-secondary" type="button">
									<i class="bi bi-search"></i>
								</button>
								<input type="text" class="form-control" placeholder="사원 이름, 부서 검색">
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-3" id="orgList">
								<div class="orgListToggle">
									<div class="orgListAll">
										<a href="#allWT" data-toggle="collapse">
											<i class="bi bi-plus" id="plusIcon1" style="display:none"></i>
											<i class="bi bi-dash" id="minusIcon1"></i>
										</a>
										<a href="#"><span>워크 투게더</span></a>
									</div>
									
									<div id="allWT" class="collapse show">
										<div id="allManagement">
											<a href="#management" data-toggle="collapse">
												<i class="bi bi-plus" id="plusIcon2"></i>
												<i class="bi bi-dash" id="minusIcon2" style="display:none"></i>
											</a>
											<a href="#" id="deptName"><span>관리부</span></a>											
											<div id="management" class="collapse">
												<a href="#">인사팀</a><br>
												<a href="#">재무회계팀</a>
											</div>
										</div>
										
										<div id="allProduction">
											<a href="#production" data-toggle="collapse">
												<i class="bi bi-plus" id="plusIcon3"></i>
												<i class="bi bi-dash" id="minusIcon3" style="display:none"></i>
											</a>
											<a href="#" id="deptName"><span>생산부</span></a>
											
											<div id="production" class="collapse">
												<a href="#">생산팀</a><br>
												<a href="#">품질관리팀</a>
											</div>
										</div>
										
										<div id="allSales">
											<a href="#sales" data-toggle="collapse">
												<i class="bi bi-plus" id="plusIcon4"></i>
												<i class="bi bi-dash" id="minusIcon4" style="display:none"></i>
											</a>
											<a href="#" id="deptName"><span>영업부</span></a>
											
											<div id="sales" class="collapse">
												<a href="#">영업팀</a><br>
												<a href="#">고객지원팀</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>	
	</div>
	<script>		
		$(function () {
			console.log("test");
			
	        $('#summernote').summernote({
	            placeholder: '내용을 입력해주세요',
	            tabsize: 2,
	            height: 300,
	            toolbar: [
	                ['style', ['style']],
	                ['font', ['bold', 'underline']],
	                ['color', ['color']],
	                ['ul', 'ol', 'paragraph'],
	                ['table', ['table']],
	                ['insert', ['link', 'picture', 'video']],
	            ]
	        });
	    })

	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>