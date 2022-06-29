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
				<c:choose>
				<c:when test="${ map['app'].progress eq 'W' || map['app'].progress eq 'R' }"> <!-- 결재 상태가 대기이거나 반려일 때만 수정 가능 -->
					<button type="button" class="btn btn-primary" onclick="location.href='updateMyLetterOfApproval.do'">수정</button>
					<button type="button" class="btn btn-danger" onclick="location.href='deleteMyLetterOfApproval.do'">삭제</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-primary" disabled>수정</button>
					<button type="button" class="btn btn-danger" disabled>삭제</button>
				</c:otherwise>
				</c:choose>
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
						<!-- 
						<tr>
							<th>수신참조</th>
							<td colspan="5">김대리</td>
						</tr>	
						 -->						
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
					<button type="button" class="btn btn-primary" onclick="location.href='draftDocument.do'">목록</button>
				</div>	
			</section>
		</div>
	</div>
	
	<script>
		$(function(){
			
		});
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>