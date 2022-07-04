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
				<c:choose>
					<c:when test="${ map['app'].progress eq 'W'}"> <!-- 결재 상태가 대기일 때만 수정 가능 -->
						<button type="button" class="btn btn-primary" onclick="location.href='/updateMyExpenditureForm.do?approvalNo=' + ${map['app'].approvalNo}">수정</button>
						<button type="button" class="btn btn-danger" onclick="deleteDocument()">삭제</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-primary" disabled>수정</button>
						<button type="button" class="btn btn-danger" disabled>삭제</button>
					</c:otherwise>
				</c:choose>
			</div>	
			<section class="section-body mt-5">
				<div id="expenditure">
					<div><h2 class="text-center pt-3">지출 결의서</h2></div>							
					<c:if test="${ map['appL'].lineLevel eq 2 }">						
						<table class="table table-bordered float-right" id="approvalLine2">
							<tr>
								<th rowspan="2" style="width:10px">결재선</th>
								<td style="height:15px">${ map['appL'].finalApproverJob }</td>
							</tr>
							<tr>
								<td>${ map['appL'].finalApproverName }</td>								
							</tr>
							<tr>
								<c:choose>								
									<c:when test="${ map['appL'].finalApprovalResult == 'C' }">
										<td colspan="2" class="text-center" style="color:blue"><strong>승인 완료</strong></td>
									</c:when>	
									<c:when test="${  map['appL'].finalApprovalResult == 'R' }">
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
						</tr>
						<tr>
							<c:choose>								
								<c:when test="${ map['appL'].firstApprovalResult == 'C' }">
									<td colspan="2" class="text-center" style="color:blue"><strong>승인 완료</strong></td>
								</c:when>	
								<c:when test="${  map['appL'].firstApprovalResult == 'R' }">
									<td colspan="2" class="text-center" style="color:red"><strong>반려</strong></td>				
								</c:when>
							</c:choose>
						</tr>
					</table>
					<c:if test="${ map['appL'].progress == 'R' }">
					<table class="table table-bordered mt-3">
						<tr>
							<th style="width: 15%">반려 사유</th>
							<td>${ map['appL'].rejectionReason }</td>
						</tr>
					</table>
					</c:if>
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
						<tr>
							<th>제목</th>
							<td colspan="5">${map['app'].title}</td>
						</tr>
						<!-- 
						<tr>
							<th>수신참조</th>
							<td colspan="5">김대리</td>
						</tr>	
						 -->						
					</table>		
					<table class="table table-bordered mt-3">
						<tr>
							<th style="width: 15%">구분</th>
							<td>${ map['appEx'].exDivision }</td>
						</tr>
						<tr>
							<th>회계 기준월</th>
							<td>${ map['appEx'].accountingMonth }</td>
						</tr>
						<tr>
							<th>지출자</th>
							<td>${ map['appEx'].spender }</td>
						</tr>
						<tr>
							<th>계좌 정보</th>
							<td>${ map['appEx'].account }</td>
						</tr>
						<tr>
							<th>지출 사유</th>
							<td>${ map['appEx'].exContent }</td>
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
						<tbody id="exTableTbody">
							
						</tbody>
						<!--  
						<tfoot>
							<tr>
								<td colspan="5">합계 : 
									<span id="sum">10000원</span>
								</td>									
							</tr>
						</tfoot>
						-->
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
					<button type="button" class="btn btn-primary" onclick="location.href='/draftDocument.do'">목록</button>
				</div>				
			</section>
		</div>
	</div>
	
	<script>
		$(function(){
			var exDateArray = "${map['appEx'].exDate}".split(",");
			var exClassificationArray = "${map['appEx'].exClassification}".split(",");
			var amountArray = "${map['appEx'].amount}".split(",");
			var exHistoryArray = "${map['appEx'].exHistory}".split(",");
			var noteArray = "${map['appEx'].note}".split(",");
			
			console.log(exDateArray);
			console.log(exClassificationArray);
			console.log(amountArray);
			console.log(exHistoryArray);
			console.log(noteArray);
			
			//배열 선언
			var exArray = new Array();
			for(let i = 0; i < exDateArray.length; i++){
				exArray.push({exDate: exDateArray[i], exClassification: exClassificationArray[i], amount: amountArray[i], exHistory: exHistoryArray[i], note: noteArray[i]});
			}
			console.log(exArray);
			
			//table 변수 선언
			var tableTr =""
			
			for(key in exArray){
			
				tableTr += '<tr>';
				tableTr += '<td>' + exArray[key].exDate + '</td>';
				tableTr += '<td>' + exArray[key].exClassification + '</td>';
				tableTr += '<td>' + exArray[key].amount + '</td>';
				tableTr += '<td>' + exArray[key].exHistory + '</td>';
				tableTr += '<td>' + exArray[key].note + '</td>';
				tableTr += '</tr>';
			}
			
			$("#exTableTbody").append(tableTr);
		});
		
		
		function deleteDocument(){
			if(confirm("정말 삭제하시겠습니까?") == true){
				location.href = "/deleteApproval.do?approvalNo=" + "${ map['app'].approvalNo }" + "&docNo=" + "${map['app'].docNo}" + "&fileNo=" + "${map['app'].fileNo}";
			}else {
				return false;
			}
		};	
	</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>