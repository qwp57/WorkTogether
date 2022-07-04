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
	.orgListToggle>div>a>span{
		font-size: medium;
		color: black;
		font-weight: bold;
	}
	
	#allWT{
		margin: 1em;
	}
	
	#deptName{
		font-size: medium;
		color: black;
		font-weight: bold;
	}
	
	#allManagement, #allProduction, #allSales{
		margin: 1.5em;
	}
	
	#management, #production, #sales{		
		margin-left: 2em;
	}
	
	.orgListToggle{
		border-right: 1px solid lightgray;
	}
	
	#picture{
		width: 70px;
		height: 80px;
	}

	.empJob{
		margin-bottom: 30px;
	}
</style>
</head>
<body>	
	<div class="main-content">	
		<div style="height: 50px"></div>
		<!-- 임직원 검색이 있는 header -->
		<form class="row">			
			<div class="input-group col-lg-3 mb-3">					
				<input type="text" class="form-control" id="memberSearching" placeholder="임직원 검색">
				<div class="input-group-append">
					<button class="btn btn-light" type="submit"><i class="bi bi-search"></i></button> <!-- 부트스트랩 공식 아이콘 사용 -->
				</div>
			</div>
		</form>
		
		<hr>
		
		<!-- 부서 선택 -->
		<div class="row">
			<div class="col-lg-3" id="orgList">
				<div class="orgListToggle">
					<div class="orgListAll">
						<a href="#allWT" data-toggle="collapse">
							<i class="bi bi-plus" id="plusIcon1" style="display:none"></i>
							<i class="bi bi-dash" id="minusIcon1"></i>
						</a>
						<a href="#"><span>워크 투게더</span></a>
					</div>
					
					<div id="allWT" class="collapse show">
						<div id="allManagement">													
							<c:forEach items="${ deptList }" var="dl">							
								<c:if test="${ dl.deptLevel == 1 }">
									<div class="mb-3">
										<a href="#management" data-toggle="collapse" id="deptName">${ dl.deptName }</a>
									</div>									
								</c:if>		
								<div id="management" class="collapse mb-3">						
									<c:if test="${ dl.deptLevel == 2}">
										<a href="organizationChartDept.do?deptCode="+"${ dl.deptCode }">${ dl.deptName }</a><br>																		
									</c:if>	
								</div>							
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 부서별 사원들의 사진 및 정보 -->
			<!-- 기능 구현할 때는 list로 뿌려주기 -> 부서 테이블 조회해서 -->
			<div class="col-lg-9">
				<h4 id="title" style="color:black">워크 투게더</h4>							
				<div class="row" id="empProfile">						
					<div class="col-lg-1 picture">
					<c:forEach items="${ empList }" var="el">	
						<c:if test="${ el.job_code == 'J1' }"> 
							<c:choose>
								<c:when test="${ el.file_no == null }">
									<img src="resources/assets/img/noimg.jpg" class="img-fluid float-left mt-3">
								</c:when>
								<c:otherwise>
									<img src="resources/upload_files/${ el.change_name }" class="img-fluid float-left mt-3">
								</c:otherwise>
							</c:choose>		
						</c:if>
						</c:forEach>
					</div>
					
					<div class="col-lg-2 mt-3">
						<c:forEach items="${ empList }" var="el">
							<c:if test="${  el.job_code == 'J1' }">
								<span class="font-weight-bold" id="empName">${ el.name }</span>
								<div class="mt-2" id="empJob">${ el.job_name }</div>
							</c:if>
						</c:forEach>	
					</div>										
				</div>
			
				<!-- 부서와 하위 부서 이름 -->
				<!-- 직급 레벨 컬럼 추가 -> 레벨이 다르면 또 div가 만들어져서 밑에 추가되고, 레벨이 같으면 같은 div 안에 추가된다. -->
				<c:forEach items="${ deptList }" var="dl">	
					<div id="dept">
						<c:if test="${ dl.deptLevel == 1 }">
						<h5 class="mt-5" id="deptTitle" style="color:black">${ dl.deptName }</h5>
						</c:if>
						<c:if test="${ dl.deptLevel == 2 }">
						<h6 class="mt-3" id="deptUpperTitle" style="color:black">${ dl.deptName }</h6>
						</c:if>
					</div>				
					<div class="row mt-3" id="empProfile">
						<div class="col-lg-1 picture">	
						<c:forEach items="${ empList }" var="el">				
								<c:if test="${ dl.deptCode == el.dept_code}">
									<c:choose>
										<c:when test="${ el.file_no == null }">
											<img src="resources/assets/img/noimg.jpg" class="img-fluid float-left mt-3">
										</c:when>
										<c:otherwise>
											<img src="resources/upload_files/${ el.change_name }" class="img-fluid float-left mt-3">
										</c:otherwise>
									</c:choose>								
								</c:if>	
							</c:forEach>
						</div>			
						<div class="col-lg-2 mt-3"> 
							<c:forEach items="${ empList }" var="el">	
								<c:if test="${ dl.deptCode == el.dept_code}">
									<span class="font-weight-bold mt-3 empName" name="empName">${ el.name }</span>
									<div class="mt-2 empDept" name="empDept">${ el.dept_name }</div>
									<div class="mt-2 empJob" name="empJob">${ el.job_name }</div>
								</c:if>
							</c:forEach>
						</div>					
					</div>					
				</c:forEach>		
			</div>
		</div>		
	</div>
	
	<!-- 개인정보 모달 창 -->
	<div class="modal" id="empModal" data-backdrop="static" data-keyboard="false">
      	<div class="modal-dialog modal-dialog-centered">
      		<div class="modal-content row">
      			<!-- modal header : 제목 -->
      			<div class="modal-header">
      				<span><h4 class="modal-title text-left" style="color:black">직원 기본 정보</h4></span>
      				<span><input type="image" data-dismiss="modal" src="resources/assets/img/close.png/" style="width:20px"></span>
      			</div>
      			<!-- modal body : 내용 -->
      			<div class="modal-body">      				    				
   					<div class="row">	
   						<div class="col-lg-4">
   							<img style="height: 100px" alt="image"
                                              src="resources/assets/img/profile/최차장.jpg"
                                              id="empModalProfile" class="img-fluid m-3">
   						</div>
						<div class="col-lg-8">
							<h6 class="mt-3" style="color:black" id="empModalName">최차장</h6>
							<div class="mt-3" id="empModalDept">워크투게더 >관리부>인사팀</div>
							<div class="mt-3" id="empModalJob">차장</div>
						</div> 
						<div>
							<span class="my-3 mx-5">이메일</span>
							<span class="mx-4" id="empModalEmail">choi@WT.com</span>
						</div> 
						<div class="mt-3 mb-3">
							<span class="my-3 mx-5">휴대폰</span>
							<span class="mx-4" id="empModalPhone">010-1111-2222</span>
						</div>   
					</div> 				
      			</div>				     			
      		</div>
      	</div>
    </div>
      
	<script>
		$(function(){
			//사진 클릭하면 모달창이 뜨도록 한다.
			$(".picture").click(function(){
				$("#empModal").modal("show");
			});

		});
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>