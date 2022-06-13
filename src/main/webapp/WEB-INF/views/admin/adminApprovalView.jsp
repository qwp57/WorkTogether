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
	
	.status{
		color: white;
		background-color: skyblue;
		border-radius: 5px;
		
	}
	
	#adminModalTable tr th{
		border-right: 1px solid lightgray;
		border-bottom: 1px solid white;
		background-color: lightgray;
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
				<h3>가입 승인</h3>
			</div>			
			<div class="row">
				<div class="statusList ml-4 mt-3">
					<span id="all"><a href="#">전체</a></span>
					<span class="ml-3" id="waiting"><a href="#">승인 대기</a></span>
					<span class="ml-3" id="completion"><a href="#">승인 완료</a></span>
					<span class="ml-3" id="rejection"><a href="#">승인 거부</a></span>
				</div>
			</div>
			
			<table class="table table-hover thead-light mt-3" id="adminList">
				<thead>
					<tr>
						<th style="width:13%">입사일</th>
						<th style="width:10%">이름</th>
						<th style="width:10%">아이디</th>
						<th style="width:10%">비밀번호</th>
						<th style="width:18%">이메일</th>
						<th style="width:15%">휴대폰번호</th>
						<th style="width:13%">생년월일</th>
						<th style="width:10%">상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<!-- <td class="empNo">사번</td>을 숨겨놓는다. -->
						<td>2022-05-29</td>
						<td>이사원</td>
						<td>lee123</td>
						<td>lee123</td>
						<td>lee123@WT.com</td>
						<td>010-1111-2222</td>
						<td>1996-09-11</td>
						<td><span class="status">승인 대기</span></td>
					</tr>
					
					<tr>
						<td>2022-05-29</td>
						<td>김사원</td>
						<td>kim123</td>
						<td>kim123</td>
						<td>kim123@WT.com</td>
						<td>010-1212-1212</td>
						<td>1996-09-11</td>
						<td><span class="status">승인 대기</span></td>
					</tr>
					
					<tr>
						<td>2022-05-29</td>
						<td>최사원</td>
						<td>choi123</td>
						<td>choi123</td>
						<td>choi123@WT.com</td>
						<td>010-3333-4444</td>
						<td>1996-09-11</td>
						<td><span class="status">승인 대기</span></td>
					</tr>
					
					<tr>
						<td>2022-05-28</td>
						<td>권사원</td>
						<td>kwon124</td>
						<td>kwon124</td>
						<td>kwon124@WT.com</td>
						<td>010-5555-6666</td>
						<td>1996-09-11</td>
						<td><span class="status">승인 대기</span></td>
					</tr>
					
					<tr>
						<td>2022-05-28</td>
						<td>박사원</td>
						<td>back123</td>
						<td>back123</td>
						<td>back123@WT.com</td>
						<td>010-7777-8888</td>
						<td>1996-09-11</td>
						<td><span class="status">승인 거부</span></td>
					</tr>
					
					<tr>
						<td>2022-05-28</td>
						<td>양사원</td>
						<td>yang123</td>
						<td>yang123</td>
						<td>yang123@WT.com</td>
						<td>010-9999-1010</td>
						<td>1996-09-11</td>
						<td><span class="status">승인 완료</span></td>
					</tr>
					
					<tr>
						<td>2022-05-27</td>
						<td>심사원</td>
						<td>sim123</td>
						<td>sim123</td>
						<td>sim123@WT.com</td>
						<td>010-3434-5656</td>
						<td>1996-09-11</td>
						<td><span class="status">승인 완료</span></td>
					</tr>
					
					<tr>
						<td>2022-05-27</td>
						<td>백사원</td>
						<td>baeck123</td>
						<td>baeck123</td>
						<td>baeck123@WT.com</td>
						<td>010-6767-8989</td>
						<td>1996-09-11</td>
						<td><span class="status">승인 완료</span></td>
					</tr>
					
					<tr>
						<td>2022-05-27</td>
						<td>강사원</td>
						<td>kang123</td>
						<td>kang123</td>
						<td>kang123@WT.com</td>
						<td>010-3434-7878</td>
						<td>1996-09-11</td>
						<td><span class="status">승인 거부</span></td>
					</tr>
					
					<tr>
						<td>2022-05-27</td>
						<td>홍사원</td>
						<td>hong123</td>
						<td>hong123</td>
						<td>hong123@WT.com</td>
						<td>010-9999-4567</td>
						<td>1996-09-11</td>
						<td><span class="status">승인 완료</span></td>
					</tr>
				</tbody>
			</table>
			
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
		</div>
	</div>
	
	<!-- 승인창 모달 -->
	<div class="modal" id="adminModal" data-backdrop="static" data-keyboard="false">
      	<div class="modal-dialog modal-lg modal-dialog-centered">
      		<div class="modal-content row">
      			<!-- modal header : 제목 -->
      			<div class="modal-header">
      				<span><h4 class="modal-title text-left" style="color:black">가입 승인</h4></span>
      				<span><input type="image" data-dismiss="modal" src="resources/assets/img/close.png/" style="width:20px"></span>    				
      			</div>
      			<!-- modal body : 내용 -->
      			<form class="form" id="adminApprovalForm">
      				<div class="modal-body">      				    				
   					 	<table class="table mt-3" id="adminModalTable">
   					 		<tr>
   					 			<th style="width:20%">입사일</th>
   					 			<td>2022-05-27</td>
   					 		</tr>
   					 		<tr>
   					 			<th>이름</th>
   					 			<td>홍사원</td>
   					 		</tr>
   					 		<tr>
   					 			<th>아이디</th>
   					 			<td>hong123</td>
   					 		</tr>
   					 		<tr>
   					 			<th>비밀번호</th>
   					 			<td>hong123</td>
   					 		</tr>
   					 		<tr>
   					 			<th>이메일</th>
   					 			<td>hong123@WT.com</td>
   					 		</tr>
   					 		<tr>
   					 			<th>휴대폰번호</th>
   					 			<td>010-9999-4567</td>
   					 		</tr>
   					 		<tr>
   					 			<th>생년월일</th>
   					 			<td>1996-06-27</td>
   					 		</tr>
   					 	</table>			
      				</div>	     				
      				<div class="modal-body row" id="adminReject">      				    				
   					 	<div class="col-lg-2 ml-2" style="color:red">거부 사유</div>
   					 	<textarea class="col-lg-9" rows="5" id="rComment" style="resize:none"></textarea>
      				</div>	    				
      				<div class="modal-footer">
      					<span><button type="submit" class="btn btn-primary" style="color:white" name="w">가입 승인</button></span>
      					<span><button type="submit" class="btn btn-danger" style="color:white" id="adminReject">가입 거부</button></span>
      				</div>
      			</form>			     			
      		</div>
      	</div>
    </div>

	
	<script>
		$(function(){
			//상태가 승인 대기인 경우에만 클릭했을 때 모달 창이 나와야 한다. 또는 이미 승인 완료,거부된 경우에는  모달창의 버튼이 나오지 않는다.
			$("#adminList tbody tr").click(function(){
				//위에서 사번을 모달로 넘기면 제이쿼리에서 받아서 사용한다.
				//empNo = $(this).data(empNo);
				//$("#adminModal").on("modal");
				$("#adminModal").modal("show");
			});
			
		});
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>