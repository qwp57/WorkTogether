<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidebar.jsp"/>
	
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
							<a href="#management" data-toggle="collapse">
								<i class="bi bi-plus" id="plusIcon2"></i>
								<i class="bi bi-dash" id="minusIcon2" style="display:none"></i>
							</a>
							<a href="#" id="deptName"><span>관리부</span></a>
							
							<div id="management" class="collapse">
								<a href="#">인사팀</a><br>
								<a href="#">재무회계팀</a>
							</div>
						</div>
						
						<div id="allProduction">
							<a href="#production" data-toggle="collapse">
								<i class="bi bi-plus" id="plusIcon3"></i>
								<i class="bi bi-dash" id="minusIcon3" style="display:none"></i>
							</a>
							<a href="#" id="deptName"><span>생산부</span></a>
							
							<div id="production" class="collapse">
								<a href="#">생산팀</a><br>
								<a href="#">품질관리팀</a>
							</div>
						</div>
						
						<div id="allSales">
							<a href="#sales" data-toggle="collapse">
								<i class="bi bi-plus" id="plusIcon4"></i>
								<i class="bi bi-dash" id="minusIcon4" style="display:none"></i>
							</a>
							<a href="#" id="deptName"><span>영업부</span></a>
							
							<div id="sales" class="collapse">
								<a href="#">영업팀</a><br>
								<a href="#">고객지원팀</a>
							</div>
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
						<img src="resources/assets/img/profile/김대표.jpg" class="img-fluid float-left mt-3">
					</div>
					<div class="col-lg-2 mt-3">
						<span class="font-weight-bold" id="empName">김대표</span>
						<div class="mt-2" id="empJob">대표이사</div>
					</div>					
				</div>
			
				<!-- 부서와 하위 부서 이름 -->
				<!-- 직급 레벨 컬럼 추가 -> 레벨이 다르면 또 div가 만들어져서 밑에 추가되고, 레벨이 같으면 같은 div 안에 추가된다. -->
				<div id="dept">
					<h5 class="mt-5" id="deptTitle" style="color:black">관리부</h5>
					<h6 class="mt-3" id="deptUpperTitle" style="color:black">인사팀</h6>
				</div>
				
				<div class="row mt-3" id="empProfile">
					<div class="col-lg-1 picture">
						<img id="picture" src="resources/assets/img/profile/정부사장.jpg" class="img-fluid float-left mt-3">
					</div>
					<div class="col-lg-2 mt-3">
						<span class="font-weight-bold" id="empName">정부사장</span>
						<div class="mt-2" id="empDept">인사팀</div>
						<div class="mt-2" id="empJob">부사장</div>
					</div>					
				</div>	
						
				<div class="row mt-3" id="empProfile">
					<div class="col-lg-1 picture">
						<img src="resources/assets/img/profile/최차장.jpg" class="img-fluid float-left mt-3">
					</div>
					<div class="col-lg-2 mt-3">
						<span class="font-weight-bold" id="empName">최차장</span>
						<div class="mt-2" id="empDept">인사팀</div>
						<div class="mt-2" id="empJob">차장</div>
					</div>					
				</div>
				
				<div class="row mt-3" id="empProfile">
					<div class="col-lg-1 picture">
						<img src="resources/assets/img/profile/나과장.jpg" class="img-fluid float-left mt-3">
					</div>
					<div class="col-lg-2 mt-3">
						<span class="font-weight-bold" id="empName">나과장</span>
						<div class="mt-2" id="empDept">인사팀</div>
						<div class="mt-2" id="empJob">과장</div>
					</div>	
					
					<div class="col-lg-1 picture">
						<img src="resources/assets/img/profile/이과장.jpg" class="img-fluid float-left mt-3">
					</div>
					<div class="col-lg-2 mt-3">
						<span class="font-weight-bold" id="empName">이과장</span>
						<div class="mt-2" id="empDept">인사팀</div>
						<div class="mt-2" id="empJob">과장</div>
					</div>					
				</div>
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
                                              id=empModalProfile"" class="img-fluid m-3">
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
			$("#plusIcon1").click(function(){
				$(this).css("display","none");
				$("#minusIcon1").removeAttr("style");	
				
			});
			
			$("#minusIcon1").click(function(){
				$(this).css("display","none");
				$("#plusIcon1").removeAttr("style");				
			});
			
			$("#minusIcon2").click(function(){
				$(this).css("display","none");
				$("#plusIcon2").removeAttr("style");	
				
			});
			
			$("#plusIcon2").click(function(){
				$(this).css("display","none");
				$("#minusIcon2").removeAttr("style");				
			});
			
			$("#minusIcon3").click(function(){
				$(this).css("display","none");
				$("#plusIcon3").removeAttr("style");	
				
			});
			
			$("#plusIcon3").click(function(){
				$(this).css("display","none");
				$("#minusIcon3").removeAttr("style");				
			});
			
			$("#minusIcon4").click(function(){
				$(this).css("display","none");
				$("#plusIcon4").removeAttr("style");	
				
			});
			
			$("#plusIcon4").click(function(){
				$(this).css("display","none");
				$("#minusIcon4").removeAttr("style");				
			});
			
			//사진 클릭하면 모달창이 뜨도록 한다.
			$(".picture").click(function(){
				$("#empModal").modal("show");
			});

		});
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>