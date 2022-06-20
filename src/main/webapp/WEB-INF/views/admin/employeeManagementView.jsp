<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h3,h4,h5,h6{
		color: black;
	}
	
	.section-body{
		margin-top: 65px;
		margin-bottom: 40px;
	}
	
	.searchOption{
		background-color: white;
		border-radius: 5px;
		height: auto;
		margin-top: 20px;
		margin-bottom: 20px;
		padding: 20px;		
	}
	
	.searchTitle{
		font-weight: bolder;
		color: black;
	}
	
	#searchDept, #searchDeptUppper, #searchJob{
		width: 300px;
		margin-top: 15px;
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
	
	.required{
		color: white;
		background-color: Firebrick;
		border-radius: 5px;
		margin-left: -50px;
		padding: 5px;
		margin-bottom: 20px;
	}
	
	.requiredTitle{
		border-bottom: 1px solid lightgray;
	}

</style>
</head>
<body>	
<script>
$(function(){
	   let msg = "${msg}";
	   if(msg != ""){
	      alert(msg);      
	   }
	})
</script>
	<div class="main-content">
	<div style="height: 50px"></div>
		<div class="container">
			<div class="title mt-5">
				<h3>인사 관리</h3>
			</div>
			<button type="button" class="col-lg-2 btn btn-outline-secondary float-right" id="addBtn" data-toggle="modal" data-target="#addModal">
				<span><i class="bi bi-plus"></i></span>
				<span>사원 추가</span>
			</button>
			
			<!-- 검색 영역 -->
			<div class="section-body">
				<div class="searchOption">
					<div class="searchTitle mb-3">검색옵션</div>
					<div class="text-center">
						<form id="search" action="searchEmp.do">
							<table class="table table-bordered">
								<tr class="thead-light">
									<th>상태</th>
									<td colspan="3" class="text-left">
									  	<div class="form-check-inline">
										  <label class="form-check-label">
										    <input type="radio" class="form-check-input" name="optradio" >전체
										  </label>
										</div>
										<div class="form-check-inline">
										  <label class="form-check-label">
										    <input type="radio" class="form-check-input" name="optradio">재직
										  </label>
										</div>
										<div class="form-check-inline disabled">
										  <label class="form-check-label">
										    <input type="radio" class="form-check-input" name="optradio">퇴직
										  </label>
										</div>
									</td>
								</tr>
								<tr class="thead-light">
									<th>부서</th>
									<td class="text-left">
									 	<div class="input-group mb-3 input-group-sm">
											<!-- 부서 키워드 선택 토글 -->
											<div class="input-group-prepend" style="width:100px">
												<select class="form-select custom-select border-1 rounded-1" id="searchDept" name="dept">
													<c:forEach items="${ deptList }" var="dl">
														<c:if test="${ dl.deptLevel == 1 }">
															<option value="${ dl.deptCode }">${ dl.deptName }</option>
														</c:if>
													</c:forEach>
												</select>
											</div>							
										</div>	
									</td>
									
									<th>팀</th>
									<td class="text-left">
										<div class="input-group mb-3 input-group-sm">
											<div class="input-group-prepend" style="width:100px">
												<select class="form-select custom-select border-1 rounded-1" id="searchDeptUppper" name="deptUpper">
													<c:forEach items="${ deptList }" var="dl">																										
														<c:if test="${ dl.deptLevel == 2 }">					
															<option value="${ dl.deptCode }">${ dl.deptName }</option>
														</c:if>	
													</c:forEach>
												</select>
											</div>							
										</div>
									</td>
								</tr>
								<tr class="thead-light">
									<th>직급</th>
									<td colspan="3" class="text-left">
									  	<div class="input-group mb-3 input-group-sm">
											<!-- 직급 키워드 선택 토글 -->
											<div class="input-group-prepend" style="width:100px">
												<select class="form-select custom-select border-1 rounded-1" id="searchJob" name="job">
													<option value="J1">대표</option>
													<option value="J2">부사장</option>
													<option value="J3">부장</option>
													<option value="J4">차장</option>
													<option value="J5">과장</option>
													<option value="J6">대리</option>
													<option value="J7">사원</option>
												</select>
											</div>							
										</div>
									</td>
								</tr>
							</table>
							<div class="input-group mb-3 input-group-sm">
								<!-- 검색 키워드 선택 토글 -->
								<div class="input-group-prepend">
									<select class="form-control rounded-1" id="searchSelect" name="keyword">
										<option ${(param.keyword == "") ? "selected" : "" } value="">사번</option>
										<option ${(param.keyword == "") ? "selected" : "" } value="">이름</option>										
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
			
			<!-- 사원 리스트 테이블 -->			
			<table class="table table-hover thead-light mt-3" id="employeeList">
				<thead>
					<tr>
						<th style="width:7%">사번</th>
						<th style="width:10%">이름</th>
						<th style="width:13%">팀</th>
						<th style="width:10%">직급</th>
						<th style="width:13%">생년월일</th>
						<th style="width:15%">휴대폰번호</th>
						<th style="width:15%">이메일</th>
						<th style="width:10%">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ empList }" var="el">
						<tr>
							<td>${ el.emp_no }</td>
							<td>${ el.name }</td>
							<td>${ el.dept_name }</td>
							<td>${ el.job_name }</td>
							<td>${ el.birth }</td>
							<td>${ el.phone }</td>
							<td>${ el.email }</td>
							<c:if test="${ el.status == 'I'}">
								<td><span class="status" style="color: white; background-color: skyblue; border-radius: 5px;">재직</span></td>
							</c:if>
							<c:if test="${ el.status == 'Q'}">
								<td><span class="status" style="color: white; background-color: red; border-radius: 5px;">퇴직</span></td>
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
	
	<!-- 사원 추가 모달 창 -->
	<div class="modal" id="addModal" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<form>
					<!-- modal header -->
					<div class="modal-header">
						<div class="modal-header">
	      					<h4 class="modal-title text-left" style="color:black">사원 추가</h4>     				   				
	      				</div>
					</div>
					
					<!-- modal body -->
					<div class="modal-body">
						<div class="requiredTitle mt-3 ml-4 mr-4 row">
							<span class="col-lg-2 mt-1"><h6>기본정보 입력</h6></span>
							<span class="required">입력 필수</span>
						</div>
						<div class="inputRequired mt-3 ml-4 mr-4 row">
							<div class="col-lg-6 form-group">
								<label for="empName">이름*</label>
								<input type="text" class="form-control" id="empName" name="name" required>
							</div>
							<div class="col-lg-6 form-group">
								<label for="empId">아이디*</label>
								<input type="text" class="form-control" id="empId" name="id" required>
							</div>
						</div>
						<div class="inputRequired mt-3 ml-4 mr-4 row">
							<div class="col-lg-6 form-group">
								<label for="empPassword">비밀번호*</label>
								<input type="text" class="form-control" id="empPassword" name="password" required>
							</div>
							<div class="col-lg-6 form-group">
								<label for="empEmail">이메일*</label>
								<input type="text" class="form-control" id="empEmail" name="email" required>
							</div>
						</div>
						<div class="inputRequired mt-3 ml-4 mr-4 row">
							<div class="col-lg-6 form-group">
								<label for="empPhone">핸드폰 번호*</label>
								<input type="text" class="form-control" id="empPhone" name="phone" required>
							</div>
							<div class="col-lg-6 form-group">
								<label>생년월일*</label>
								 <div class="input-group date mt-2" id="datetimepicker1" data-target-input="nearest">
									<input id="birth" type="date" class="form-control" name="birth" tabindex="7">
	                              	<div class="invalid-feedback">생년월일을 입력해주세요</div>
						        </div>
							</div>
						</div>
						<div class="inputRequired mt-3 ml-4 mr-4 row">
							<div class="col-lg-6 form-group">
								<label>입사일*</label>
								 <input id="join_date" type="date" class="form-control" name="join_date" tabindex="8">
                              <div class="invalid-feedback">입사일을 입력해주세요</div>
							</div>
						</div>
						
						<div class="requiredTitle mt-3 ml-4 mr-4 row">
							<span class="col-lg-2 mt-1"><h6>인사정보 입력</h6></span>
						</div>
						<div class="inputRequired mt-3 ml-4 mr-4 row">
							<div class="col-lg-6 form-group">
								<label for="empDept">부서</label>
								<select class="form-select custom-select border-1 rounded-1" id="empDept" name="upper_dept_code">
									<c:forEach items="${ deptList }" var="dl">
										<c:if test="${ dl.deptLevel == 1 }">
											<option value="${ dl.deptCode }">${ dl.deptName }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="col-lg-6 form-group">
								<label for="empDeptUpper">하위 부서</label>  
								<select class="form-select custom-select border-1 rounded-1" id="empDeptUpper" name="dept_code">
									<c:forEach items="${ deptList }" var="dl">																										
										<c:if test="${ dl.deptLevel == 2 }">					
											<option value="${ dl.deptCode }">${ dl.deptName }</option>
										</c:if>	
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="inputRequired mt-3 ml-4 mr-4 row">
							<div class="col-lg-6 form-group">
								<label for="empJob">직위</label>
								<select class="form-select custom-select border-1 rounded-1" id="empJob" name="job_code">
									<option value="J1">대표</option>
									<option value="J2">부사장</option>
									<option value="J3">부장</option>
									<option value="J4">차장</option>
									<option value="J5">과장</option>
									<option value="J6">대리</option>
									<option value="J7">사원</option>
								</select>
							</div>
							<div class="col-lg-6 form-group">
								<label>퇴직일</label>  
								<input id="resignation_date" type="date" class="form-control" name="resignation_date" tabindex="8">
							</div>
						</div>
					</div>
					
					<!-- modal footer -->
					<div class="modal-footer mb-3">
						<button type="button" class="btn btn-primary" id="saveBtn">저장</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 사원 정보 모달 창 -> 행을 클릭하면 그 회원의 정보를 수정할 수 있는 모달 창이 뜬다.(그 회원의 정보가 뜬다) -->
	<div class="modal" id="updateModal" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<form method="post">
					<!-- modal header -->
					<div class="modal-header">
						<div class="modal-header">
	      					<h4 class="modal-title text-left" style="color:black">사원 정보</h4>     				   				
	      				</div>
					</div>
					
					<!-- modal body -->
					<div class="modal-body">
						<div class="requiredTitle mt-3 ml-4 mr-4 row">
							<span class="col-lg-2 mt-1"><h6>기본정보 입력</h6></span>
							<span class="required">입력 필수</span>
						</div>
						<div class="inputRequired mt-3 ml-4 mr-4 row">
							<div class="col-lg-6 form-group">
								<label for="newEmpName">이름*</label>
								<input type="text" class="form-control" id="newEmpName" required value="이사원">
							</div>
							<div class="col-lg-6 form-group">
								<label for="newEmpId">아이디*</label>
								<input type="text" class="form-control" id="newEmpId" required>
							</div>
						</div>
						<div class="inputRequired mt-3 ml-4 mr-4 row">
							<div class="col-lg-6 form-group">
								<label for="newEmpPassword">비밀번호*</label>
								<input type="text" class="form-control" id="newEmpPassword" required>
							</div>
							<div class="col-lg-6 form-group">
								<label for="newEmpEmail">이메일*</label>
								<input type="text" class="form-control" id="newEmpEmail" required>
							</div>
						</div>
						<div class="inputRequired mt-3 ml-4 mr-4 row">
							<div class="col-lg-6 form-group">
								<label for="newEmpPhone">핸드폰 번호*</label>
								<input type="text" class="form-control" id="newEmpPhone" required>
							</div>
							<div class="col-lg-6 form-group">
								<label>생년월일*</label>
								 <div class="input-group date mt-2" id="datetimepicker4" data-target-input="nearest">
						            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker4" value="">
						            <div class="input-group-append" data-target="#datetimepicker4" data-toggle="datetimepicker">
						                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
						            </div>
						        </div>
							</div>
						</div>
						<div class="inputRequired mt-3 ml-4 mr-4 row">
							<div class="col-lg-6 form-group">
								<label>입사일*</label>
								 <div class="input-group date" id="datetimepicker5" data-target-input="nearest">
						            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker5" value="">
						            <div class="input-group-append" data-target="#datetimepicker5" data-toggle="datetimepicker">
						                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
						            </div>
						        </div>
							</div>
						</div>
						
						<div class="requiredTitle mt-3 ml-4 mr-4 row">
							<span class="col-lg-2 mt-1"><h6>인사정보 입력</h6></span>
						</div>
						<div class="inputRequired mt-3 ml-4 mr-4 row">
							<div class="col-lg-6 form-group">
								<label for="newEmpDept">부서</label>
								<select class="form-select custom-select border-1 rounded-1" id="newEmpDept" name="newEmpDept">
									<c:forEach items="${ deptList }" var="dl">
										<c:if test="${ dl.deptLevel == 1 }">
											<option value="${ dl.deptCode }">${ dl.deptName }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="col-lg-6 form-group">
								<label for="newEmpDeptUpper">하위 부서</label>  
								<select class="form-select custom-select border-1 rounded-1" id="newEmpDeptUpper" name="newEmpDeptUpper">
									<c:forEach items="${ deptList }" var="dl">																										
										<c:if test="${ dl.deptLevel == 2 }">					
											<option value="${ dl.deptCode }">${ dl.deptName }</option>
										</c:if>	
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="inputRequired mt-3 ml-4 mr-4 row">
							<div class="col-lg-6 form-group">
								<label for="newEmpJob">직위</label>
								<select class="form-select custom-select border-1 rounded-1" id="newEmpJob" name="newEmpJob">
									<option value="J1">대표</option>
									<option value="J2">부사장</option>
									<option value="J3">부장</option>
									<option value="J4">차장</option>
									<option value="J5">과장</option>
									<option value="J6">대리</option>
									<option value="J7">사원</option>
								</select>
							</div>
							<div class="col-lg-6 form-group">
								<label>퇴직일</label>  
								<div class="input-group date mt-2" id="datetimepicker6" data-target-input="nearest">
						            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker6" value="">
						            <div class="input-group-append" data-target="#datetimepicker6" data-toggle="datetimepicker">
						                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
						            </div>
						        </div>
							</div>
						</div>
					</div>
					
					<!-- modal footer -->
					<div class="modal-footer mb-3">
						<button type="submit" class="btn btn-primary">저장</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
		/*$(function(){
			$("#saveBtn").click(function(){
				$.ajax({
					type: "post",
					method: "addEmployee.do",
					data: {}
				})
			});
		});*/
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>