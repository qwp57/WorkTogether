<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>회의록 작성</title>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<head>
<meta charset="UTF-8">
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
	
	#meetingPurpose{
		resize: none;
		height: 200px;
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
				<span><h3>회의록</h3></span> 
			</div>
			<section class="section-body">
				<form id="theMinutesOfAMeetingForm" method="post" action="/insertApproval.do" enctype="multipart/form-data">
					<input type="hidden" name="docNo" value="3"/>
					<div id="theMinutesOfAMeeting">
						<div><h2 class="text-center pt-3">회의록</h2></div>											
						<table class="table table-bordered float-right" id="approvalLine1">
							<tr>
								<th colspan="2" style="height:20px;" class="text-center" >최종 결재자</th>
							</tr>
							<tr>
								<th rowspan="2" style="width:10px">결재선</th>
								<td style="height:20px" id="job2"></td>
							</tr>
							<tr>
								<td id="name2"></td>	
								<td class="d-none"><input type="hidden" name="finalApp"></td>								
							</tr>
							<tr>
								<td colspan="2"><button type="button" class="btn btn-primary float-right mr-3" data-toggle="modal" data-target="#approvalLineModal2" id="lineBtn2">결재선 선택</button></td>
							</tr>
						</table>
						<table class="table table-bordered float-right" id="approvalLine2">
							<tr>
								<th colspan="2" style="height:20px;" class="text-center" >최초 결재자</th>
							</tr>
							<tr>
								<th rowspan="2" style="width:10%">결재선</th>
								<td style="height:20px" id="job1"></td>
							</tr>
							<tr>
								<td id="name1"></td>
								<td class="d-none"><input type="hidden" name="firstApproverNo"></td>								
							</tr>
							<tr>
								<td colspan="2"><button type="button" class="btn btn-primary float-right mr-3" data-toggle="modal" data-target="#approvalLineModal1" >결재선 선택</button></td>
							</tr>
							
						</table>
						<table class="table table-bordered mt-3">							
							<tr>
								<th style="width: 15%">기안부서</th>
								<c:forEach items="${ empList }" var="el">
									<c:if test="${ el.emp_no == emp.emp_no }">
										<td id="deptName">${ el.dept_name }<input type="hidden" class="form-control" name="deptName" value="${ el.dept_name }"/></td>
									</c:if>
								</c:forEach>
								<th style="width: 15%">기안일</th>
								<td id="createDate"><input type="hidden" name="createDate" value=""/></td>
								<th style="width: 15%">문서번호</th>
								<td></td>
							</tr>
							<tr>
								<th>기안자</th>
								<td name="writer">${ emp.name }<input type="hidden" class="form-control" name="writer" value="${ emp.emp_no}"/></td>
								<th>보존년한</th>
								<td>
									<div class="input-group mt-3 mb-3">
					    				<div class="input-group-prepend">
					    					<select class="form-control rounded-1" id="retentionPeriod" name="retentionPeriod">
												<option value="5">5년</option>
												<option value="10">10년</option>	
												<option value="15">15년</option>										
											</select>
					    				</div>
					    			</div>
			    				</td>
								<th>긴급여부</th>
								<td>
									<div class="form-check mt-3 mb-3">
										<label class="form-check-label">
											 <input type="checkbox" class="form-check-input" id="emergency" name="emergency">긴급
										</label>
					    			</div>
								</td>									
							</tr>
							<!-- 
							<tr>
								<th>수신참조</th>
								<td colspan="5" name="referee">김대리</td>
							</tr>
							 -->
							<tr>
								<th>제목</th>
								<td colspan="5">
									<input type="text" class="form-control" id="title" name="title">
								</td>
							</tr>							
						</table>
						
						<table class="table table-bordered mt-3">
							<tr>
								<th style="width: 15%">참석자</th>
								<td><input type="text" class="form-control" name="attendees"></td>
							</tr>
							<tr>
								<th>회의 목적</th>
								<td><textarea class="form-control" id="meetingPurpose" name="meetingPurpose"></textarea></td>
							</tr>
							<tr>
								<th>회의 일자</th>
								<td>
									<input type="date" class="form-control" name="meetingDate" tabindex="8" required/>	 
								</td>
							</tr>
						</table>
						
						<div class="mb-2"><strong>회의 내용</strong></div>
						<textarea class="" id="appSummernote" name="meetingContent"></textarea>	
						
						<div>
							<div class="mt-5" style="font-size:15px"><strong>첨부파일</strong></div>
							<div id="fileUpload" class="mt-2 pt-5">
								<span id="file_text" class="ml-2">클릭하여 파일을 추가하세요.</span>
								<span id="file_name" class="ml-2"></span>
							</div>
							<div id="fileArea">
								<input type="file" class="" id="upfile" name="upfile" style="display:none"/>								
							</div>
						</div>
					</div>
					<div class="float-right mt-3">
						<button type="submit" class="btn btn-primary">기안하기</button>
						<button type="button" class="btn btn-primary" onclick="location.href='/approvalMain.do'">취소하기</button>
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
															${ dl.deptName }
														</a>														
													</c:if>
													<c:forEach items="${ empList }" var="el">
														<c:if test="${ dl.deptCode == el.dept_code }">
															<div id="deptEmp1${dl.deptCode}" class="mx-5 my-2 deptUpper collapse">
																<input type="radio" class="form-check-input" name="empNo1" id="empNo1" value="${ el.emp_no }"><label for="empNo1">${ el.name }</label>
																<span>${el.job_name}</span>														
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
														${ dl.deptName }
													</a>														
												</c:if>
												<c:forEach items="${ empList }" var="el">
													<c:if test="${ dl.deptCode == el.dept_code }">
														<div id="deptEmp2${dl.deptCode}" class="mx-5 my-2 deptUpper collapse">
															<input type="radio" class="form-check-input" name="empNo2" id="empNo2" value="${ el.emp_no }"><label for="empNo2">${ el.name }</label>
															<span>${el.job_name}</span>														
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
					<button type="button" class="btn btn-primary float-right" id="saveBtn2">등록</button>
				</div>
				</form>			
			</div>
		</div>	
	</div>

	<script>
		$(function(){
			$("#fileUpload").click(function(){
		       	$("#upfile").click();
		    });	
			
			$('#appSummernote').summernote({
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
	                ['insert', ['link']],
	            ]
	        });
			 
		});

		$(function(){
			 $("#fileUpload").click(function(){
		        	$("#upfile").click();
		        });	
			
			//결재선 등록 버튼 누르면 결재자 칸에 값이 들어간다.
			$("#saveBtn1").click(function(){

				var empNo1 = $("input[name='empNo1']:checked").val(); //value에 담겨있는 사번
				var empName1 = $("input[name='empNo1']:checked").next().text(); //label에 있는 이름
				var jobName1 = $("input[name='empNo1']:checked").next().next().text(); //직급
							
				console.log("empNo1 : " + empNo1);
				console.log("empName1 : " + empName1);
				console.log("jobName1 : " + jobName1);			
				
				$("#job1").text(jobName1);
				$('#name1').text(empName1);
				$("input[name='firstApproverNo']").attr('value', empNo1);
				
				alert("등록이 완료 되었습니다.");
				$("#approvalLineModal1").modal("hide");
			});
			
			$("#saveBtn2").click(function(){
				var empNo2 = $("input[name='empNo2']:checked").val(); //value에 담겨있는 사번
				var empName2 = $("input[name='empNo2']:checked").next().text(); //label에 있는 이름
				var jobName2 = $("input[name='empNo2']:checked").next().next().text(); //직급
				//최초 결재자로 선택된 사람이 또 최종 결재자로 들어가면 안되기 때문에 if문으로 걸러준다.
				var empNo1 = $("input[name='firstApproverNo']").val(); //이미 선택된 사원의 사번을 가지고 온다.
							
				console.log("empNo2 : " + empNo2);
				console.log("empName2 : " + empName2);
				console.log("jobName2 : " + jobName2);			
				
				if(empNo1 == empNo2){ //최종 결재자와 최초 결재자 사번을 비교한다.
					alert("이미 선택된 결재자 입니다.");
				}else if(empNo1 == 0){ //최초 결재자를 선택하지 않고 최종 결재자를 선택할 경우
					alert("최초 결재자를 먼저 선택해주세요.");
				}else {
					$("#job2").text(jobName2);
					$('#name2').text(empName2);
					$("input[name='finalApp']").attr('value', empNo2);

					alert("등록이 완료 되었습니다.");
					$("#approvalLineModal2").modal("hide");
				}

			});
			
			//결재선 설정하지 않고 기안버튼 누를 경우
			$("#subBtn").click(function(){
				var empNo1 = $("input[name='firstApproverNo']").val(); //최초 결재자의 사번을 가지고 온다.
				
				if(empNo1 == 0){
					alert("결재선이 비어있습니다. 결재자를 선택해주세요.");
					return false;
				}
			});
			
			//기안 날짜에 들어갈 오늘 날짜 구하기
			var today = new Date();
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			
			var date = year + '-' + month + '-' + day;
			
			console.log(date);
			
			$("#createDate").text(date);
			$('input[name="createDate"]').attr('value', date);
			
			//파일 업로드
			$("#upfile").on('change', function(){
				var fileName = $("#upfile").val(); //파일 이름 가지고 온다.
				console.log(fileName);
				$("#file_name").text(fileName);
				$("#file_text").attr('class', 'd-none');
			});
			
			//emergency
		     $('input:checkbox[name="emergency"]').on('change', function(){
	              if($('input:checkbox[name="emergency"]').prop('checked')){
	                  $(this).val('Y');
	              }else {
	                  $(this).val('N');
	              }
            });

		});

	</script>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>