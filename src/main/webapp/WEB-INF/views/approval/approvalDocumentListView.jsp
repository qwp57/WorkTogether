<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidebar.jsp"/>
	
	<div class="main-content">
	<div style="height: 50px"></div>
		<div class="container">
			<div class="title mt-5">
				<h3>기안 문서함</h3>
			</div>			
			<div class="row">
				<div class="statusList ml-4 mt-3">
					<span id="all"><a href="#">전체</a></span>
					<span class="ml-3" id="waiting"><a href="#">진행</a></span>
					<span class="ml-3" id="completion"><a href="#">완료</a></span>
					<span class="ml-3" id="rejection"><a href="#">반려</a></span>
					<span class="ml-3" id="reference"><a href="#">참조</a></span>
				</div>
			</div>
			<section class="section-body">
				<table class="table table-hover thead-light mt-3" id="approvalList">
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
						<tr>
							<td>2022-05-28</td>
							<td>-</td>
							<td>일반 품의서</td>
							<td>-</td>
							<td>기안서- 업무 협조</td>
							<td>배주임</td>
							<td>-</td>
							<td>2022_00020</td>
							<td><span class="status">결재 대기</span></td>
						</tr>
						
						<tr>
							<td>2022-05-28</td>
							<td>-</td>
							<td>일반 품의서</td>
							<td>-</td>
							<td>기안서- 업무 협조</td>
							<td>강사원</td>
							<td>-</td>
							<td>2022_00019</td>
							<td><span class="status">결재 대기</span></td>
						</tr>
						
						<tr>
							<td>2022-05-25</td>
							<td>-</td>
							<td>일반 품의서</td>
							<td>-</td>
							<td>기안서- 업무 협조</td>
							<td>안대리</td>
							<td>-</td>
							<td>2022_00018</td>
							<td><span class="status">진행중</span></td>
						</tr>
						
						<tr>
							<td>2022-05-22</td>
							<td>2022-05-24</td>
							<td>지출 결의서</td>
							<!-- if를 사용해서 만약 긴급 상태이면 긴급이라는 글자가 빨간색으로 나오도록 아니면 '-'이 나오도록 하낟. -->
							<td style="color:red">긴급</td>
							<td>2022-05-20 법인카드 사용</td>
							<td>이부장</td>
							<!-- 첨부 파일이 있으면 클립 아이콘과 함께 첨부파일 개수가 나온다.(if 사용) -->
							<td>
								<i class="bi bi-paperclip"></i>1
							</td>
							<td>2022_00017</td>
							<td><span class="status">완료</span></td>
						</tr>
						
						<tr>
							<td>2022-05-18</td>
							<td>2022-05-20</td>
							<td>회의록</td>
							<td>-</td>
							<td>2022-05-01 회의록</td>
							<td>배주임</td>
							<td>-</td>
							<td>2022_00016</td>
							<td><span class="status">완료</span></td>
						</tr>
						
						<tr>
							<td>2022-05-25</td>
							<td>-</td>
							<td>일반 품의서</td>
							<td>-</td>
							<td>기안서- 업무 협조</td>
							<td>안대리</td>
							<td>-</td>
							<td>2022_00005</td>
							<td><span class="status">진행중</span></td>
						</tr>
						
						<tr>
							<td>2022-05-25</td>
							<td>-</td>
							<td>일반 품의서</td>
							<td>-</td>
							<td>기안서- 업무 협조</td>
							<td>안대리</td>
							<td>-</td>
							<td>2022_00004</td>
							<td><span class="status">진행중</span></td>
						</tr>
						
						<tr>
							<td>2022-05-25</td>
							<td>-</td>
							<td>일반 품의서</td>
							<td>-</td>
							<td>기안서- 업무 협조</td>
							<td>안대리</td>
							<td>-</td>
							<td>2022_00003</td>
							<td><span class="status">진행중</span></td>
						</tr>
						
						<tr>
							<td>2022-05-07</td>
							<td>2022-05-09</td>
							<td>일반 품의서</td>
							<td>-</td>
							<td>기안서- 업무 협조</td>
							<td>안대리</td>
							<td>-</td>
							<td>2022_00002</td>
							<td><span class="status">완료</span></td>
						</tr>
						
						<tr>
							<td>2022-05-01</td>
							<td>2022-05-02</td>
							<td>회의록</td>
							<td>-</td>
							<td>2022-05-01 회의록</td>
							<td>안대리</td>
							<td>-</td>
							<td>2022_00001</td>
							<td><span class="status">완료</span></td>
						</tr>
					</tbody>
				</table>
			</section>
			
			<!-- 페이징 처리 -->
			<div id="pagingArea">
	          	<ul class="pagination">
		          	<c:choose>
		          		<c:when test="${ pi.currentPage ne 1 }">
		          			<li class="page-item"><a class="page-link" href="listBoard.do?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		          		</c:when>
		          		<c:otherwise>
		          			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
		          		</c:otherwise>
		          	</c:choose>
	          	
		              <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
		              	<c:choose>
			           		<c:when test="${ pi.currentPage ne p }">
			              			<li class="page-item"><a class="page-link" href="listBoard.do?currentPage=${ p }">${ p }</a></li>
			           		</c:when>
			           		<c:otherwise>
			           			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
			           		</c:otherwise>
		           		</c:choose>
		              </c:forEach>
		              
	              
		              <c:choose>
		          		<c:when test="${ pi.currentPage ne pi.maxPage }">
		          			<li class="page-item"><a class="page-link" href="listBoard.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
		          		</c:when>
		          		<c:otherwise>
		          			<li class="page-item disabled"><a class="page-link" href="listBoard.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
		          		</c:otherwise>
		          	</c:choose>
	          	</ul>
	    	</div>
	    	
	    	<div id="search">
	    		<form method="get">
	    			<div class="input-group mt-3 mb-3">
	    				<div class="input-group-prepend">
	    					<select class="form-control rounded-1" id="searchSelect" name="keyword">
								<option ${(param.keyword == "") ? "selected" : "" } value="">제목</option>
								<option ${(param.keyword == "") ? "selected" : "" } value="">결재양식</option>	
								<option ${(param.keyword == "") ? "selected" : "" } value="">문서번호</option>										
							</select>
	    				</div>
	    				<!-- 검색어 입력 -->		
						<input type="text" class="form-control" id="searchKey" name="searchKey" placeholder="검색어를 입력하세요." value="${param.searchKey }">	
						<!-- 검색 버튼 --> 
						<input type="submit" class="btn btn-primary" id="searchBtn" value="검색">	
	    			</div>
	    		</form>
	    	</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>