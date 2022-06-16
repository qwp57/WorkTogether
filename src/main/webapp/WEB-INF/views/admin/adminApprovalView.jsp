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
	
	#adminModalTable tr th{
		border-right: 1px solid lightgray;
		border-bottom: 1px solid white;
		background-color: lightgray;
	}
	
</style>
</head>
<body>
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
					<span class="ml-3" id="rejection"><a href="#">승인 거부</a></span>
				</div>
			</div>
			
			<table class="table table-hover thead-light mt-3" id="adminList">
				<thead>
					<tr>
						<th style="width:13%">입사일</th>
						<th style="width:10%">이름</th>
						<th style="width:10%">아이디</th>
						<th style="width:17%">이메일</th>
						<th style="width:14%">휴대폰번호</th>
						<th style="width:13%">생년월일</th>
						<th style="width:13%">가입일</th>
						<th style="width:10%">상태</th>
					</tr>
				</thead>
				<tbody id="admin_rows">
					<c:forEach items="${ adminList }" var="ad">
						<tr onclick="modalEmpInfo(this)">
							<!-- <td class="empNo">사번</td>을 숨겨놓는다. -->
							<td class="d-none">${ ad.emp_no }</td>
							<td>${ ad.join_date }</td>
							<td>${ ad.name }</td>
							<td>${ ad.id }</td>
							<td>${ ad.email }</td>
							<td>${ ad.phone }</td>
							<td>${ ad.birth }</td>
							<td>${ ad.create_date }</td>
							<c:if test="${ ad.status == 'W'}">
								<td><span class="status p-2" style="color: white; background-color: skyblue; border-radius: 5px;">대기</span></td>
							</c:if>
							<c:if test="${ ad.status == 'R'}">
								<td><span class="status p-2" style="color: white; background-color: red; border-radius: 5px;">반려</span></td>
							</c:if>
						</tr>
					</c:forEach>					
				</tbody>
			</table>

			<!-- 페이징 처리 -->
			 <div id="pagingArea">
	          <ul class="pagination">
	          	<c:choose>
	          		<c:when test="${ pi.currentPage ne 1 }">
	          			<li class="page-item"><a class="page-link" href="adminApproval.do?currentPage=${ pi.currentPage-1 }">Previous</a></li>
	          		</c:when>
	          		<c:otherwise>
	          			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
	          		</c:otherwise>
	          	</c:choose>
	          	
	              <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	              	<c:choose>
	           		<c:when test="${ pi.currentPage ne p }">
	              			<li class="page-item"><a class="page-link" href="adminApproval.do?currentPage=${ p }">${ p }</a></li>
	           		</c:when>
	           		<c:otherwise>
	           			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	           		</c:otherwise>
	           	</c:choose>
	              </c:forEach>
	              
	              
	              <c:choose>
	          		<c:when test="${ pi.currentPage ne pi.maxPage }">
	          			<li class="page-item"><a class="page-link" href="adminApproval.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
	          		</c:when>
	          		<c:otherwise>
	          			<li class="page-item disabled"><a class="page-link" href="adminApproval.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
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
      				<div class="modal-body row">      				    				
   					 	<table class="table mt-3" id="adminModalTable">
   					 		<tr>
   					 			<th style="width:20%">사번</th>
   					 			<td id="empNo"></td>
   					 		</tr>
   					 		<tr>
   					 			<th>입사일</th>
   					 			<td id="empJoinDate"></td>
   					 		</tr>
   					 		<tr>
   					 			<th>이름</th>
   					 			<td id="empName"></td>
   					 		</tr>
   					 		<tr>
   					 			<th>아이디</th>
   					 			<td id="empId"></td>
   					 		</tr>
   					 		<tr>
   					 			<th>이메일</th>
   					 			<td id="empEmail"></td>
   					 		</tr>
   					 		<tr>
   					 			<th>휴대폰번호</th>
   					 			<td id="empPhone"></td>
   					 		</tr>
   					 		<tr>
   					 			<th>생년월일</th>
   					 			<td id="empBirth"></td>
   					 		</tr>
   					 		<tr>
   					 			<th>가입일</th>
   					 			<td id="empCreateDate"></td>
   					 		</tr>
   					 	</table>			
      				  				    				
   					 	<div class="col-lg-2 ml-2" style="color:red">거부 사유</div>
   					 	<textarea class="col-lg-9" rows="5" id="rComment" name="rComment" style="resize:none"></textarea>
      				</div>	    				
      				<div class="modal-footer">
      					<span><button type="submit" class="btn btn-primary" style="color:white" id="adminApprovalBtn">가입 승인</button></span>
      					<span><button type="submit" class="btn btn-danger" style="color:white" id="adminRejectBtn">가입 거부</button></span>
      				</div>
      			</form>			     			
      		</div>
      	</div>
    </div>

	
	<script type="text/javascript">
		//방법 1
		function modalEmpInfo(clicked_element) {
			var row_td = clicked_element.getElementsByTagName("td"); //클릭한 tr의 td 태그 리스트를 받는다.
			var modal = document.getElementById("adminModal"); //modal 아이디로 modal 정보를 변수에 저장한다.
			
			//모달 id에 innerHtml로 row_td의 값들을 넣어준다.
			document.getElementById("empNo").innerHTML = row_td[0].innerHTML;
			document.getElementById("empJoinDate").innerHTML = row_td[1].innerHTML;
			document.getElementById("empName").innerHTML = row_td[2].innerHTML;
			document.getElementById("empId").innerHTML = row_td[3].innerHTML;
			document.getElementById("empEmail").innerHTML = row_td[4].innerHTML;
			document.getElementById("empPhone").innerHTML = row_td[5].innerHTML;
			document.getElementById("empBirth").innerHTML = row_td[6].innerHTML;
			document.getElementById("empCreateDate").innerHTML = row_td[7].innerHTML;
			
			//모달 창 띄우기 -> data-dismiss 안먹음
			//modal.style.display = 'block';
		}
		//모달창 열기
		$(function(){
			$("#adminList tbody tr").click(function(){
				$("#adminModal").modal("show");
			});
		});
		
		//가입 승인
		//ajax로 모달창의 사번 컨트롤러로 보내기
		$(function(){		
			$("#adminApprovalBtn").click(function() {
				$.ajax({
					type: "post",
					url: "adminApproval.do",
					data: {empNo : $("#empNo").text()},
					success: function(status){ //데이터를 보내고 리턴값을 받아온다.
						if(status > 0){
							alert("가입 승인 완료");
						}else {
							alert("가입 승인 실패")
						}
					},
					error: function(){ //통신 실패시 
						console.log("통신 실패")
					}
				});
			});
			
			//가입 반려
			$("#adminRejectBtn").click(function() {
				if($("#rComment").val().trim().length != 0){ 
					if($("#rComment").val().length < 100) { //데이터 길이에 따른 조건 걸어주기 -> 100글자 초과하면
						$.ajax({
							type: "post",
							url: "adminReject.do",
							data: {empNo : $("#empNo").text(),
									rComment : $("rComment").val()},
							success: function(status){ //데이터를 보내고 리턴값을 받아온다.
								if(status > 0){
									alert("가입 거부 완료");
								}else {
									alert("가입 거부 실패");
								}
							},
							error: function(){ //통신 실패시 
								console.log("통신 실패");
							}
						})
					}else{
						alert("반려 사유는 100글자 이하로 작성해주세요.");
					}
				}else {
					alert("반려 사유를 작성해주세요.");
				}
			});
			
		});
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>