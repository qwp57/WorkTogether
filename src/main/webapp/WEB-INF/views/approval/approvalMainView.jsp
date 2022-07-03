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
	h2, h3, h4, h5{
		color: black;
	}
	
	.section-body{
		margin-bottom: 30px;
		margin-top: 30px;
	}
	
	.card{
		width: 250px;
		height: 250px;
	}
	
	.card-deck>.card{
		border-radius: 25px;
	}
	
	.card-body{
		margin-top: 50px;
	}
	
	#newApprovalCount{
		border-bottom: 1px solid lightgray;
	}
	
	#approvalNow{
		margin-left: 80px;
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
				<div class="title mt-4 mb-3 col-lg-3" id="approvalNow">
					<h4>결재문서 현황</h4>
				</div>				
				<div>
					<div class="card-deck">
						<div class="card mt-3 ml-3">
							<div class="card-body text-center">
								<p class="card-text"><h3 style="color: rgb(111, 118, 237)">결재 대기</h3></p>
								<p class="card-text"><h2>${waitCount}</h2></p>
							</div>
						</div>
						
						<div class="card mt-3 ml-3">
							<div class="card-body text-center">
								<p class="card-text"><h3 style="color: rgb(111, 118, 237)">결재 진행 중</h3></p>
								<p class="card-text"><h2>${proceedingCount}</h2></p>
							</div>
						</div>
						
						<div class="card mt-3 ml-3">
							<div class="card-body text-center">
								<p class="card-text"><h3 style="color: rgb(111, 118, 237)">결재 완료</h3></p>
								<p class="card-text"><h2>${completeCount}</h2></p>
							</div>
						</div>
						
						<div class="card mt-3 ml-3">
							<div class="card-body text-center">
								<p class="card-text"><h3 style="color: rgb(111, 118, 237)">새 결재 문서</h3></p>
								<p class="card-text"><h2 class="pb-2" id="newApprovalCount">${newApprovalCount}</h2></p>
								<a href="approvalDocument.do"><h5>결재하기</h5></a>
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
						<c:forEach items="${ draftList }" var="dl">
							<tr>
								<td class="d-none">${ dl.approvalNo }</td>
								<td class="d-none">${ dl.docNo }</td>
								<td>${ dl.createDate }</td>
								<c:choose>
									<c:when test="${ dl.approvalDate eq null }">
										<td>-</td>
									</c:when>
									<c:otherwise>
										<td>${ dl.approvalDate }</td>
									</c:otherwise>
								</c:choose>
								<td>${ dl.docName }</td>
								<c:choose>
									<c:when test="${ dl.emergency eq 'N' }">
										<td>-</td>
									</c:when>
									<c:otherwise>
										<td style="color: red">긴급</td>
									</c:otherwise>
								</c:choose>
								<td>${ dl.title }</td>
								<c:choose>
									<c:when test="${ dl.fileNo eq 0 }">
										<td>-</td>
									</c:when>
									<c:otherwise>
										<td><i class="bi bi-paperclip"></i>1</td>
									</c:otherwise>
								</c:choose>
								<td>${ dl.approvalNo }</td>
								<c:choose>
									<c:when test="${ dl.progress eq 'W' }">
										<td><span class="p-2" style="color: white; background-color: skyblue; border-radius: 5px;">대기</span></td>
									</c:when>
									<c:when test="${ dl.progress eq 'P' }">
										<td><span class="p-2" style="color: white; background-color: green; border-radius: 5px;">진행중</span></td>
									</c:when>
									<c:when test="${ dl.progress eq 'C' }">
										<td><span class="p-2" style="color: white; background-color: darkgray; border-radius: 5px;">완료</span></td>
									</c:when>
									<c:when test="${ dl.progress eq 'R' }">
										<td><span class="p-2" style="color: white; background-color: Firebrick; border-radius: 5px;">반려</span></td>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>										
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
						<c:forEach items="${ appList }" var="al">
							<tr>
								<td class="d-none">${ al.approvalNo }</td>
								<td class="d-none">${ al.docNo }</td>
								<td>${ al.createDate }</td>
								<c:choose>
									<c:when test="${ al.approvalDate eq null }">
										<td>-</td>
									</c:when>
									<c:otherwise>
										<td>${ al.approvalDate }</td>
									</c:otherwise>
								</c:choose>
								<td>${ al.docName }</td>
								<c:choose>
									<c:when test="${ al.emergency eq 'N' }">
										<td>-</td>
									</c:when>
									<c:otherwise>
										<td style="color: red">긴급</td>
									</c:otherwise>
								</c:choose>
								<td>${ al.title }</td>
								<td>${ al.name }</td>
								<c:choose>
									<c:when test="${ al.fileNo eq 0 }">
										<td>-</td>
									</c:when>
									<c:otherwise>
										<td><i class="bi bi-paperclip"></i>1</td>
									</c:otherwise>
								</c:choose>
								<td>${ al.approvalNo }</td>
								<c:choose>
									<c:when test="${ al.progress eq 'W' }">
										<td><span class="p-2" style="color: white; background-color: skyblue; border-radius: 5px;">대기</span></td>
									</c:when>
									<c:when test="${ al.progress eq 'P' }">
										<td><span class="p-2" style="color: white; background-color: green; border-radius: 5px;">진행중</span></td>
									</c:when>
									<c:when test="${ al.progress eq 'C' }">
										<td><span class="p-2" style="color: white; background-color: darkgray; border-radius: 5px;">완료</span></td>
									</c:when>
									<c:when test="${ al.progress eq 'R' }">
										<td><span class="p-2" style="color: white; background-color: Firebrick; border-radius: 5px;">반려</span></td>
									</c:when>
								</c:choose>
							</tr>						
						</c:forEach>										
					</tbody>
				</table>
			</section>
		</div>		
	</div>
	<script>
		$(function(){
			$("#draftDocumentTable tbody tr").click(function(){
				var approvalNo = $(this).children().eq(0).text();
				var docNo = $(this).children().eq(1).text();
				
				console.log(approvalNo);
				console.log(docNo);
				
				//결재 양식 번호와 문서 번호를 가지고 간다.
				location.href="detailDraftDocument.do?approvalNo=" + approvalNo + "&docNo=" + docNo;
			});
			
			$("#approvalDocumentTable tbody tr").click(function(){
				var approvalNo = $(this).children().eq(0).text();
				var docNo = $(this).children().eq(1).text();
				
				console.log(approvalNo);
				console.log(docNo);
				
				//결재 양식 번호와 문서 번호를 가지고 간다.
				location.href="detailApproval.do?approvalNo=" + approvalNo + "&docNo=" + docNo;
			});
			
		});
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>