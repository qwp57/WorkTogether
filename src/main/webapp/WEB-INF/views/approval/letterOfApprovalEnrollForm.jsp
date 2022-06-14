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

	#fileUpload{
		border: 2px dotted black;
		height: 120px;
	}
	
	#lineList, #refList{
		background-color: lightgray;
		padding: 3px;
	}
	
	#addList{
		background-color: lightgray;
		height: 75%;
		padding: 3px;
	}
	
	#allWT{
		color: black;
	}
	
	#approvalAddBtn{
		margin-top: 100px;
	}
	
</style>
 	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>	
	<div class="main-content">
	<div style="height: 50px"></div>
		<div class="container">
			<div class="title mt-5 row">
				<span><i class="bi bi-clipboard2-check-fill"></i></span>
				<span><h3>일반 품의서</h3></span> 
			</div>	
			<section class="section-body">
				<form id="letterOfApprovalForm"  method="post" enctype="multipart/form-data">
					<div id="letterOfApproval">
						<div><h2 class="text-center pt-3">품의서</h2></div>							
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
						</table>		
										
						<div class="" id="summernote" name="loaContent"></div>	
						
						<div class="" >
							<div class="mt-5" style="font-size:15px"><strong>첨부파일</strong></div>
							<div id="fileUpload" class="text-center mt-2 pt-5">클릭하여 파일을 추가하세요.</div>
							<div id="fileArea">
								<input type="file" class="" id="upfile" name="upfile" style="display:none"/>									
							</div>
						</div>									
					</div>
					<div class="float-right mt-3">
						<button type="submit" class="btn btn-primary">기안하기</button>
						<button type="button" class="btn btn-primary" onclick="location.href='approvalMain.do'">취소하기</button>
					</div>
				</form>	
			</section>
		</div>
	</div>
	
	<!-- 결재선 선택 모달창 -->
	<div class="modal" id="approvalLineModal" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- modal header -->
				<div class="modal-header">					
	   				<h4 class="modal-title text-left" style="color:black">결재선 설정</h4>   
	   				<input type="image" class="text-right" data-dismiss="modal" src="resources/assets/img/close.png/" style="width:20px">  				   					   				
				</div>
				
				<!-- modal body -->
				<div class="modal-body">
					<form method="">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<button class="btn btn-secondary" type="button">
									<i class="bi bi-search"></i>
								</button>
								<input type="text" class="form-control" placeholder="사원 이름, 부서 검색">
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-4 ml-3">
								<div id="lineList">
									<div class="orgListAll mt-3">																				
										<span><h6>워크 투게더</h6></span>
									</div>
									
									<div id="allWT" class="collapse show">
										<div class="my-4 deptTree">
											<h6 class="dept"><i class="bi bi-dash" id="minusIcon"></i>관리부</h6>
											<div class="ml-3">
												<a href="#deptEmp1" data-toggle="collapse">
													<i class="bi bi-plus" id="plusIcon1"></i>
													<i class="bi bi-dash" id="minusIcon1" style="display:none"></i>
													<span style="color:black">인사팀</span>
												</a>
												<div id="deptEmp1" class="mx-4 my-2 deptUpper collapse">
													<a href="#" style="color:black">최사장</a><!-- 사번 숨겨놓기 -->
												</div>
											</div>
											<div class="ml-3">
												<a href="#deptEmp2" data-toggle="collapse">
													<i class="bi bi-plus" id="plusIcon2"></i>
													<i class="bi bi-dash" id="minusIcon2" style="display:none"></i>
													<span style="color:black">재무회계팀</span>
												</a>
												<div id="deptEmp2" class="mx-4 my-2 deptUpper collapse">
													<a href="#" style="color:black">최사장</a><!-- 사번 숨겨놓기 -->
												</div>
											</div>
										</div>
										<div class="my-4 deptTree">
											<h6 class="dept"><i class="bi bi-dash" id="minusIcon"></i>생산부</h6>
											<div class="ml-3">
												<a href="#deptEmp3" data-toggle="collapse">
													<i class="bi bi-plus" id="plusIcon3"></i>
													<i class="bi bi-dash" id="minusIcon3" style="display:none"></i>
													<span style="color:black">생산팀</span>
												</a>
												<div id="deptEmp3" class="mx-4 my-2 deptUpper collapse">
													<a href="#" style="color:black">최사장</a><!-- 사번 숨겨놓기 -->
												</div>
											</div>
											<div class="ml-3">
												<a href="#deptEmp4" data-toggle="collapse">
													<i class="bi bi-plus" id="plusIcon4"></i>
													<i class="bi bi-dash" id="minusIcon4" style="display:none"></i>
													<span style="color:black">품질관리팀</span>
												</a>
												<div id="deptEmp4" class="mx-4 my-2 deptUpper collapse">
													<a href="#" style="color:black">최사장</a><!-- 사번 숨겨놓기 -->
												</div>
											</div>
										</div>
										<div class="my-4 deptTree">
											<h6 class="dept"><i class="bi bi-dash" id="minusIcon"></i>영업부</h6>
											<div class="ml-3">
												<a href="#deptEmp5" data-toggle="collapse">
													<i class="bi bi-plus" id="plusIcon5"></i>
													<i class="bi bi-dash" id="minusIcon5" style="display:none"></i>
													<span style="color:black">영업팀</span>
												</a>
												<div id="deptEmp5" class="mx-4 my-2 deptUpper collapse">
													<a href="#" style="color:black">최사장</a><!-- 사번 숨겨놓기 -->
												</div>
											</div>
											<div class="ml-3">
												<a href="#deptEmp6" data-toggle="collapse">
													<i class="bi bi-plus" id="plusIcon6"></i>
													<i class="bi bi-dash" id="minusIcon6" style="display:none"></i>
													<span style="color:black">고객지원팀</span>
												</a>
												<div id="deptEmp6" class="mx-4 my-2 deptUpper collapse">
													<a href="#" style="color:black">최사장</a><!-- 사번 숨겨놓기 -->
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<div>
									<h6 class="mt-3">결재선</h6>
									<div class="input-group mb-3 input-group-sm">										
										<!-- 결재선 선택-->
										<div class="input-group-prepend" style="width:100%">
											<select class="form-select custom-select border-1 rounded-1" id="approvalLevel" name="approvalLevel">
												<option ${(param.job == "") ? "selected" : "" } value="">레벨 1</option>
												<option ${(param.job == "") ? "selected" : "" } value="">레벨 2</option>
											</select>
										</div>	
									</div>	
								</div>
							</div>
							<div class="col-lg-3 ml-5" id="approvalAddBtn">
								<div><button type="button" class="btn btn-secondary mb-2" id="appLineAdd">결재 > </button></div>
								<div><button type="button" class="btn btn-secondary mt-2" id="appRefAdd">참조 > </button></div>
							</div>
							<div class="col-lg-4">
								<div id="addList">
									<div>1레벨</div>
								</div>
								
								<h6 class="mt-3">참조</h6>
								<div id="refList">
									
								</div>
								
								<button type="submit" class="btn btn-primary float-right mt-5">등록</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>	
	</div>
	
	<script>		
		$(function () {
	        $('#summernote').summernote({
	            placeholder: '내용을 입력해주세요',
	            tabsize: 2,
	            height: 500,
	            minHeight: null,
	            maxHeight: null,
	            lang: 'ko-KR',
	            toolbar: [
	                ['style', ['style']],
	                ['font', ['bold', 'underline']],
	                ['color', ['color']],
	                ['ul', 'ol', 'paragraph'],
	                ['table', ['table']],
	                ['insert', ['link', 'picture', 'video']],
	            ]
	        });
	    });

		$(function(){	        
	        $("#fileUpload").click(function(){
	        	$("#upfile").click();
	        });			
		
	        $("#plusIcon1").click(function(){
				$(this).css("display","none");
				$("#minusIcon1").removeAttr("style");	
				
			});
			
			$("#minusIcon1").click(function(){
				$(this).css("display","none");
				$("#plusIcon1").removeAttr("style");				
			});
			
			$("#minusIcon2").click(function(){
				$(this).css("display","none");
				$("#plusIcon2").removeAttr("style");	
				
			});
			
			$("#plusIcon2").click(function(){
				$(this).css("display","none");
				$("#minusIcon2").removeAttr("style");				
			});
			
			$("#minusIcon3").click(function(){
				$(this).css("display","none");
				$("#plusIcon3").removeAttr("style");	
				
			});
			
			$("#plusIcon3").click(function(){
				$(this).css("display","none");
				$("#minusIcon3").removeAttr("style");				
			});
			
			$("#minusIcon4").click(function(){
				$(this).css("display","none");
				$("#plusIcon4").removeAttr("style");	
				
			});
			
			$("#plusIcon4").click(function(){
				$(this).css("display","none");
				$("#minusIcon5").removeAttr("style");				
			});
			
			$("#minusIcon5").click(function(){
				$(this).css("display","none");
				$("#plusIcon5").removeAttr("style");	
				
			});
			
			$("#plusIcon5").click(function(){
				$(this).css("display","none");
				$("#minusIcon4").removeAttr("style");				
			});
			
			$("#minusIcon6").click(function(){
				$(this).css("display","none");
				$("#plusIcon4").removeAttr("style");	
				
			});
			
			$("#plusIcon6").click(function(){
				$(this).css("display","none");
				$("#minusIcon4").removeAttr("style");				
			});
		});
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>