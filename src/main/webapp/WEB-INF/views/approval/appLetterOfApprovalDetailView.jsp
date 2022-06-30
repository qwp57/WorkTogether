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
				<span><h3>문서 제목</h3></span> 
			</div>
			<div class="float-right">
				<button type="button" class="btn btn-primary" onclick="approveFunction()">승인</button>
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#rejectModal">반려</button>
			</div>	
			<section class="section-body mt-5">
				<div id="letterOfApproval">
					<div><h2 class="text-center pt-3">품의서</h2></div>							
					<c:if test="${ map['appL'].lineLevel eq 2 }">						
						<table class="table table-bordered float-right" id="approvalLine2">
							<tr>
								<th rowspan="2" style="width:10px">결재선</th>
								<td style="height:15px">${ map['appL'].finalApproverJob }</td>
							</tr>
							<tr>
								<td>${ map['appL'].finalApproverName }</td>
								<td class="d-none" id="finalApproverNo">${ map['appL'].finalApproverNo }</td>								
							</tr>
							<tr>
								<c:choose>								
									 <c:when test="${ map['appL'].lastApprovalDate != null && map['appL'].progress == 'C'}">
										<td colspan="2" class="text-center" style="color:blue"><strong>승인 완료</strong></td>
									</c:when>	
									<c:when test="${  map['appL'].lastApprovalDate != null  && map['appL'].progress == 'R' }">
										<td colspan="2" class="text-center" style="color:red"><strong>반려</strong></td>
									</c:when>					
								</c:choose>
							</tr>
						</table>
					</c:if>
					<table class="table table-bordered float-right" id="approvalLine1">
						<tr>
							<th rowspan="2" style="width:10%">결재선</th>
							<td style="height:15px">${ map['appL'].firstApproverJob }</td>
						</tr>
						<tr>
							<td>${ map['appL'].firstApproverName }</td>	
							<td class="d-none" id="firstApproverNo">${ map['appL'].firstApproverNo }</td>							
						</tr>
						<tr>
							<c:choose>								
								 <c:when test="${ (map['appL'].firstApprovalDate != null && map['appL'].progress == 'P') || (map['appL'].firstApprovalDate != null && map['appL'].progress == 'C')}"><!-- 첫 번째 결재 날짜가 null이 아니고 progress가 C, 첫번째 결재 날짜가 null이 아니고 progress가 p여야 결재가 승인된 것이다. -->
									<td colspan="2" class="text-center" style="color:blue"><strong>승인 완료</strong></td>
								</c:when>	
								<c:when test="${  map['appL'].firstApprovalDate != null  && map['appL'].progress == 'R' }">
									<td colspan="2" class="text-center" style="color:red"><strong>반려</strong></td>
								</c:when>					
							</c:choose>
						</tr>
					</table>
					<table class="table table-bordered mt-3">							
						<tr>
							<th style="width: 15%">기안부서</th>
							<td>${map['app'].deptName}</td>
							<th style="width: 15%">기안일</th>
							<td>${map['app'].createDate}</td>
							<th style="width: 15%">문서번호</th>
							<td>${map['app'].approvalNo}</td>
						</tr>
						<tr>
							<th>기안자</th>
							<td>${map['app'].name}</td>
							<th>보존년한</th>
							<td>${map['app'].retentionPeriod}년</td>
							<th>긴급여부</th>
							<c:if test="${map['app'].emergency eq 'Y'}">
								<td>긴급</td>									
							</c:if>
							<c:if test="${map['app'].emergency eq 'N'}">
								<td>-</td>									
							</c:if>								
						</tr>													
					</table>		
									
					<table class="table table-bordered">
						<tr>
							<th style="width:15%">제목</th>
							<td>${map['app'].title}</td>
						</tr>
						<tr>
							<td colspan="2">${map['loa'].content}</td>
						</tr>
					</table>													
				</div>
				<div>
					<div class="mt-5" id="file" style="font-size:15px">
						<i class="bi bi-paperclip"></i>
						<strong>첨부파일</strong>
					</div>
					<c:if test="${ map['app'].fileNo ne 0 }">
						<div class="mt-3 ml-4" id="fileArea">
							<div>
								<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${ map['app'].change_name }" download="${ map['app'].orginal_name }">${ map['app'].orginal_name }</a>
							</div>									
						</div>
					</c:if>
					<c:if test="${ map['app'].fileNo eq 0 }">
						<div>첨부파일이 없습니다.</div>
					</c:if>
				</div>					
				<div class="float-right mt-3">						
					<button type="button" class="btn btn-primary" onclick="location.href='approvalDocument.do'">목록</button>
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
	<script>
		function approveFunction(){
			var emp_no = "${map['emp_no']}";
			var firstApproverNo = $("#firstApproverNo").text();
			var finalApproverNo = $("#finalApproverNo").text();
			var approvalNo = "${map['app'].approvalNo}";
			var progress = "${map['appL'].progress}";
			var lineLevel = "${map['appL'].lineLevel}";	
			console.log(emp_no);
			console.log(firstApproverNo);
			console.log(finalApproverNo);
			console.log(approvalNo);
			console.log(progress);
			console.log(lineLevel);
			
			alert("결재를 승인하시겠습니까?");
			
			//첫번째 결재자와 같으면 결재 순서를 확인하지 않아도 된다.
			if(emp_no == firstApproverNo){ 
				location.href="approvalUpdate.do?firstApproverNo=" + firstApproverNo +"&approvalNo=" +approvalNo + "&lineLevel=" + lineLevel;
			}else if(emp_no == finalApproverNo){
				if(progress == 'W') { //아직 첫번째 결재자가 결재하지 않은 상태
					alert("결재 순서가 아닙니다."); return false;						
				}else if(progress == 'P'){
					location.href="approvalUpdate.do?finalApproverNo=" + finalApproverNo + "&approvalNo=" + approvalNo + "&lineLevel=" + lineLevel;
				}
			}
		
		}
	</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>