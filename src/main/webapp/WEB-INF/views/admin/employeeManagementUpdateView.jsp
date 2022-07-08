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
	h3,h4,h5,h6{
		color: black;
	}
	
	.required{
		color: white;
		background-color: Firebrick;
		border-radius: 5px;
		margin-left: -50px;
		padding: 5px;
		margin-bottom: 20px;
	}
	
</style>
</head>
<body>
	<div class="main-content">
		<div style="height: 50px"></div>
		<div class="container">
			<div class="title mt-5">
				<h3>사원 정보 수정</h3>
			</div>
		
			<div class="section-body">			
				<div class="">
					<form method="post" action="updateEmployeeInfo.do">			
						<input type="hidden" name="emp_no" value="${ selectEmp.emp_no }"/>							
						<div class="">
							<div class="requiredTitle mt-3 ml-4 mr-4 row">
								<span class="col-lg-2 mt-4"><h6>기본정보 입력</h6></span>
								<span class="required mt-3">입력 필수</span>
							</div>
							<hr>
							<div class="inputRequired mt-3 ml-4 mr-4 row">
								<div class="col-lg-6 form-group">
									<label for="newEmpName">이름*</label>
									<input type="text" class="form-control" value="${ selectEmp.name }" name="name" required>
								</div>
								<div class="col-lg-6 form-group">
									<label for="newEmpId">아이디*</label>
									<input type="text" class="form-control" value="${ selectEmp.id }" readonly>
								</div>
							</div>
							<div class="inputRequired mt-3 ml-4 mr-4 row">									
								<div class="col-lg-6 form-group">
									<label for="newEmpEmail">이메일*</label>
									<input type="text" class="form-control" value="${ selectEmp.email }" name="email" required>
								</div>
								<div class="col-lg-6 form-group">
									<label for="newEmpPhone">핸드폰 번호*</label>
									<input type="text" class="form-control" value="${ selectEmp.phone }" name="phone" required>
								</div>
							</div>
							<div class="inputRequired mt-3 ml-4 mr-4 row">									
								<div class="col-lg-6 form-group">
									<label>생년월일*</label> 
									<input type="date" class="form-control" id="birth" name="birth" tabindex="8">			                              									        
								</div>
								<div class="col-lg-6 form-group">
									<label>입사일*</label>
									<input type="date" class="form-control" id="join_date" name="join_date" tabindex="8">
								</div>							
							</div>
							
							<div class="requiredTitle mt-3 ml-4 mr-4 row">
								<span class="col-lg-2  mt-4"><h6>인사정보 입력</h6></span>
							</div>
							<hr>
							<div class="inputRequired mt-3 ml-4 mr-4 row">
								<div class="col-lg-6 form-group">
									<label for="newEmpDept">부서</label>
									<select class="form-select custom-select border-1 rounded-1" name="upper_dept_code">
										<c:forEach items="${ deptList }" var="dl">
											<c:if test="${ dl.deptLevel == 1 }">
												<option ${(selectEmp.upper_dept_code == dl.deptCode) ? "selected" : "" } value="${ dl.deptCode }">
													${ dl.deptName }												
												</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
								<div class="col-lg-6 form-group">
									<label for="newEmpDeptUpper">하위 부서</label>  
									<select class="form-select custom-select border-1 rounded-1" name="dept_code">
										<c:forEach items="${ deptList }" var="dl">																										
											<c:if test="${ dl.deptLevel == 2 }">					
												<option ${(selectEmp.dept_code == dl.deptCode) ? "selected" : "" } value="${ dl.deptCode }">
													${ dl.deptName }
												</option>
											</c:if>	
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="inputRequired mt-3 ml-4 mr-4 row">
								<div class="col-lg-6 form-group">
									<label for="newEmpJob">직위</label>
									<select class="form-select custom-select border-1 rounded-1" id="newEmpJob" name="job_code">
										<option ${(selectEmp.job_code == "J1") ? "selected" : "" } value="J1">대표</option>
										<option ${(selectEmp.job_code == "J2") ? "selected" : "" } value="J2">부사장</option>
										<option ${(selectEmp.job_code == "J3") ? "selected" : "" } value="J3">부장</option>
										<option ${(selectEmp.job_code == "J4") ? "selected" : "" } value="J4">차장</option>
										<option ${(selectEmp.job_code == "J5") ? "selected" : "" } value="J5">과장</option>
										<option ${(selectEmp.job_code == "J6") ? "selected" : "" } value="J6">대리</option>
										<option ${(selectEmp.job_code == "J7") ? "selected" : "" } value="J7">사원</option>
									</select>
								</div>
							
								<div class="col-lg-6 form-group">
									<label for="resignationDate">퇴직일</label>  
									<input type="date" class="form-control" id="resignationDate" name="resignationDate" value="${ selectEmp.resignation_date }" tabindex="8">
								</div>									
							</div>
						</div>

						<div class="mb-3 mt-5 float-right">
							<button type="submit" class="btn btn-primary">저장</button>
							<button type="button" class="btn btn-secondary" onclick="location.href='employeeManagement.do'">취소</button>
						</div>
					</form>
				</div>				
			</div>
		</div>
	</div>
	<script>
		$(function(){
			document.getElementById('birth').valueAsDate = new Date("${ selectEmp.birth }");
			document.getElementById('join_date').valueAsDate = new Date("${ selectEmp.join_date }");
		});
	</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>