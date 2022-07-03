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
	.title{
		color: black;
		margin-bottom: 20px;
	}
	
	.statusList{
		font-size: 16px;
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
	
	#pagingArea{
		width:fit-content;
		margin:auto;
		margin-top: 3em;
	}
	
	#search{
		margin:auto;
		width: 600px;
		margin-top: 3em;
	}
</style>
</head>
<body>	
	<div class="main-content">
	<div style="height: 50px"></div>
		<div class="container">
			<div class="title mt-5">
				<h3>기안 문서함</h3>
			</div>			
			<div class="row">
				<div class="statusList ml-4 mt-3">
					<span id="all"><a href="draftDocument.do">전체</a></span>
					<span class="ml-3" id="waiting"><a href="draftWaitingList.do">대기</a></span>
					<span class="ml-3" id="proceeding"><a href="#">진행</a></span>
					<span class="ml-3" id="completion"><a href="#">완료</a></span>
					<span class="ml-3" id="rejection"><a href="#">반려</a></span>
				</div>
			</div>
			<div class="section-body">
				<table class="table table-hover thead-light mt-3" id="draftList">
					<thead>
						<tr>
							<th style="width:12%">기안일</th>
							<th style="width:12%">완료일</th>
							<th style="width:12%">결재양식</th>
							<th style="width:7%">긴급</th>
							<th style="width:26%">제목</th>
							<th style="width:7%">첨부</th>
							<th style="width:10%">문서번호</th>
							<th style="width:13%">결재상태</th>
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
			
			<!-- 페이징 처리 -->
			 <div id="pagingArea">
	          <ul class="pagination">
	          <!-- 이전 -->
	          	<c:choose>
	          		<c:when test="${ pi.currentPage ne 1 }">
	          			<!-- 검색하지 않는 경우 -->
	          			<c:if test="${ empty keyword }">
	          				<li class="page-item"><a class="page-link" href="draftDocument.do?currentPage=${ pi.currentPage-1 }">Previous</a></li>
	          			</c:if>
	          			<!-- 검색하는 경우 -->
	          			<c:if test="${ !empty keyword }">
	          				<c:url var="searchUrl" value="searchDraft.do">
							<c:param name="currentPage" value="${pi.currentPage-1 }"/>
							<c:param name="condition" value="${ condition }"/>
							<c:param name="keyword" value="${ keyword }"/>							
							</c:url>
							<li class="page-item"><a class="page-link" href="${ searchUrl }">Previous</a></li>
	          			</c:if>
	          		</c:when>
	          		<c:otherwise>
	          			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
	          		</c:otherwise>
	          	</c:choose>
	          	
	          	<!-- 숫자 -->
	            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	             	<c:choose>
		           		<c:when test="${ pi.currentPage ne p }">
		           			<%-- keyword가 empty -> 검색하지 않는 경우 --%>
							<c:if test="${ empty keyword }">
								<li class="page-item"><a class="page-link" href="draftDocument.do?currentPage=${ p }">${ p }</a></li>
							</c:if>
		              		<%-- keyword가 empty아님 -> 검색하는 경우 --%>
							<c:if test="${ !empty keyword }">
								<c:url var="searchUrl" value="searchDraft.do">
									<c:param name="currentPage" value="${ p }"/>
									<c:param name="condition" value="${ condition }"/>
									<c:param name="keyword" value="${ keyword }"/>							
								</c:url>
								<li class="page-item"><a class="page-link" href="${ searchUrl }">${ p }</a></li>
							</c:if>
		           		</c:when>
		           		<c:otherwise>
		           			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
		           		</c:otherwise>
	           		</c:choose>
	           </c:forEach>
	           	       
	              <!-- 다음 페이지 -->	       
	              <c:choose>
	          		<c:when test="${ pi.currentPage ne pi.maxPage }">
	          			<!-- 검색하지 않는 경우 -->
	          			<c:if test="${ empty keyword }">
	          				<li class="page-item"><a class="page-link" href="draftDocument.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
	          			</c:if>
	          			<!-- 검색 하는 경우 -->
	          			<c:if test="${ !empty keyword }">
	          				<c:if test="${ !empty keyword }">
								<c:url var="searchUrl" value="searchDraft.do">
									<c:param name="currentPage" value="${pi.currentPage+1  }"/>
									<c:param name="condition" value="${ condition }"/>
									<c:param name="keyword" value="${ keyword }"/>
								</c:url>
								<li class="page-item"><a class="page-link" href="${ searchUrl }">Next</a></li>
							</c:if>
	          			</c:if>
	          		</c:when>
	          		<c:otherwise>
	          			<li class="page-item disabled"><a class="page-link" href="draftDocument.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
	          		</c:otherwise>
	          	</c:choose>
	          </ul>
	    	</div>
	    	<!-- 검색 영역 -->
	    	<div id="search">
	    		<form method="get" action="searchDraft.do">
	    			<div class="input-group mt-3 mb-3">
	    				<div class="input-group-prepend">
	    					<select class="form-control rounded-1" name="condition">
								<option ${(param.condition == "title") ? "selected" : "" } value="title">제목</option>
								<option ${(param.condition == "docName") ? "selected" : "" } value="docName">결재양식</option>	
								<option ${(param.condition == "approvalNo") ? "selected" : "" } value="approvalNo">문서번호</option>										
							</select>
	    				</div>
	    				<!-- 검색어 입력 -->		
						<input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어를 입력하세요." value="${ param.keyword }">	
						<!-- 검색 버튼 --> 
						<input type="submit" class="btn btn-primary" id="searchBtn" value="검색">	
	    			</div>
	    		</form>
	    	</div>
		</div>
	</div>
	
	<script>
		$(function(){
			$("#draftList tbody tr").click(function(){
				var approvalNo = $(this).children().eq(0).text();
				var docNo = $(this).children().eq(1).text();
				
				console.log(approvalNo);
				console.log(docNo);
				
				//결재 양식 번호와 문서 번호를 가지고 간다.
				location.href="detailDraftDocument.do?approvalNo=" + approvalNo + "&docNo=" + docNo;
			});
			
		});
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>