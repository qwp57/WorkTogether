<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	#addList{
		height: 75%;
		padding: 3px;
	}
	
	#refList{
		background-color: lightgray;
		margin-top: -30px;
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
				<form id="letterOfApprovalForm" method="post" action="insertLetterOfApproval.do" enctype="multipart/form-data"><!-- 첨부파일도 함께 보낸다. -->
					<div id="letterOfApproval">
						<div><h2 class="text-center pt-3">품의서</h2></div>							
						<br><br><br>
						<table class="table table-bordered float-right" id="approvalLine2">
							<tr>
								<th colspan="2" style="height:20px;" class="text-center" >최종 결재자</th>
							</tr>
							<tr>								
								<th rowspan="2" style="width:10px">결재선</th>
								<td style="height:20px">대표이사</td>
							</tr>
							<tr>
								<td>김대표</td>	
								<td class="d-none"><input type="hidden" name="LAST_APPROVER_NO" value=""></td>							
							</tr>							
							<tr>
								<td colspan="2"><button type="button" class="btn btn-primary float-right mr-3" data-toggle="modal" data-target="#approvalLineModal2">결재선 선택</button></td>
							</tr>

						</table>
						<table class="table table-bordered float-right" id="approvalLine1">
							<tr>
								<th colspan="2" style="height:20px;" class="text-center" >최초 결재자</th>
							</tr>
							<tr>
								<th rowspan="2" style="width:10%">결재선</th>
								<td style="height:20px" id="job1"></td>
							</tr>
							<tr>
								<td id="name1"></td>
								<td class="d-none"><input type="hidden" name="FIRST_APPROVER_NO" value=""></td>								
							</tr>
							<tr>
								<td colspan="2"><button type="button" class="btn btn-primary float-right mr-3" data-toggle="modal" data-target="#approvalLineModal1">결재선 선택</button></td>
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
							<!-- 
							<tr>
								<th>수신참조</th>
								<td colspan="5" name="referee">
									<button type="button" class="btn btn-primary mr-3" data-toggle="modal" data-target="#refModal">수신참조자 선택</button>
								</td>
							</tr>
							 -->
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
	<div class="modal" id="approvalLineModal1" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- modal header -->
				<div class="modal-header">
	   				<h4 class="modal-title text-left" style="color:black">결재선 설정</h4>    
	   				<input type="image" class="text-right" data-dismiss="modal" src="resources/assets/img/close.png/" style="width:20px"> 				   				
				</div>
				
				<!-- modal body -->
				<form>
				<div class="modal-body">					
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<button class="btn btn-secondary" type="button">
									<i class="bi bi-search"></i>
								</button>
								<input type="text" class="form-control" placeholder="사원 이름, 부서 검색">
							</div>
						</div>
						
						<div class="row">
							<div class="ml-3">
								<div id="lineList1">
									<div class="orgListAll mt-3">																				
										<span><h5 style="color:rgb(111, 118, 237)">워크 투게더</h5></span>
									</div>
									
									<div id="allWT" class="collapse show">
										<div class="my-4 ml-4">
											<c:forEach items="${ deptList }" var="dl">					
												<div class="my-3 ">
													<c:if test="${ dl.deptLevel == 1 }">
														<h6 id="deptName"><i class="bi bi-dash" id="minusIcon1"></i>${ dl.deptName }</h6>
													</c:if>
													<c:if test="${ dl.deptLevel == 2 }">																														
														<a href="#deptEmp1${dl.deptCode}" data-toggle="collapse" class="ml-3" id="dept_collapse1">
															<!-- <i class="bi bi-plus" id="plusIcon${ dl.deptCode }"></i>
															<i class="bi bi-dash" id="minusIcon${ dl.deptCode }" style="display:none"></i> -->
															${ dl.deptName }
														</a>														
													</c:if>
													<c:forEach items="${ empList }" var="el">
														<c:if test="${ dl.deptCode == el.dept_code }">
															<div id="deptEmp1${dl.deptCode}" class="mx-5 my-2 deptUpper collapse">
																<input type="radio" class="form-check-input" name="empName1" id="empName1" value="${ el.name }">${ el.name } ${el.job_name}
																<input type="hidden" value="${ el.job_name }" id="jobName1">
																<input type="hidden" value="${ el.emp_no }" id="empNo1">
															</div>
														</c:if>
													</c:forEach>
												</div>
											</c:forEach>
										</div>
									</div>
								</div> 							
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary float-right" id="saveBtn1">등록</button>
					</div>
				</form>			
			</div>
		</div>	
	</div>
	
	<!-- 최종 결재선 선택 모달창 -->
	<div class="modal" id="approvalLineModal2" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- modal header -->
				<div class="modal-header">
	   				<h4 class="modal-title text-left" style="color:black">결재선 설정</h4>    
	   				<input type="image" class="text-right" data-dismiss="modal" src="resources/assets/img/close.png/" style="width:20px"> 				   				
				</div>
				
				<!-- modal body -->
				<form>
				<div class="modal-body">					
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<button class="btn btn-secondary" type="button">
								<i class="bi bi-search"></i>
							</button>
							<input type="text" class="form-control" placeholder="사원 이름, 부서 검색">
						</div>
					</div>
						
					<div class="row">
						<div class="ml-3">
							<div id="lineList2">
								<div class="orgListAll mt-3">																				
									<span><h5 style="color:rgb(111, 118, 237)">워크 투게더</h5></span>
								</div>
								
								<div id="allWT2" class="collapse show">
									<div class="my-4 ml-4">
										<c:forEach items="${ deptList }" var="dl">					
											<div class="my-3 ">
												<c:if test="${ dl.deptLevel == 1 }">
													<h6 id="deptName2"><i class="bi bi-dash" id="minusIcon2"></i>${ dl.deptName }</h6>
												</c:if>
												<c:if test="${ dl.deptLevel == 2 }">																														
													<a href="#deptEmp2${dl.deptCode}" data-toggle="collapse" class="ml-3" id="dept_collapse2">
														<!-- <i class="bi bi-plus" id="plusIcon${ dl.deptCode }"></i>
														<i class="bi bi-dash" id="minusIcon${ dl.deptCode }" style="display:none"></i> -->
														${ dl.deptName }
													</a>														
												</c:if>
												<c:forEach items="${ empList }" var="el">
													<c:if test="${ dl.deptCode == el.dept_code }">
														<div id="deptEmp2${dl.deptCode}" class="mx-5 my-2 deptUpper collapse">
															<input type="radio" class="form-check-input" name="name" value="${ el.name }">${ el.name } ${el.job_name}
															<input type="hidden" value="${ el.job_name }" name="job_code">
														</div>
													</c:if>
												</c:forEach>
											</div>
										</c:forEach>
									</div>
								</div>
							</div> 							
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary float-right" id="saveBtn2">등록</button>
				</div>
				</form>			
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
	                ['insert', ['link', 'picture']],
	            ]
	        });
	    });
		
		$(function(){	        
	        $("#fileUpload").click(function(){
	        	$("#upfile").click();
	        });	
	        /*
	        $("#saveBtn1").click(function(){
	        	var empName1 = $("input[name='empName1']:checked").val();
				var jobCode1 = $("#jobCode1").val();
				var empNo1 = $("#empNo1").val();
				
				$.ajax({
					type: "post",
					url: "letterOfApprovalEnrollForm.jsp",
					data: {
						empName1 : empName1,
						jobCode1 : jobCode1,
						empNo1: empNo1
					},
					success: 
				});
	        }*/
		});
		
		$(function(){
			//결재선 등록 버튼 누르면 결재자 칸에 값이 들어간다.
			$("#saveBtn1").click(function(){
				var empName1 = $("input[name='empName1']:checked").val();
				var jobName1 = $("#jobName1").val();
				var empNo1 = $("#empNo1").val();
				
				document.getElementById("job1").innerHTML() = jobName1;
				document.getElementById("name1").innerHTML() = empName1
				$("input[name='FIRST_APPROVER_NO']").attr('value', empNo1);
			});
		});
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>